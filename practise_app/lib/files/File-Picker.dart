import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.all(32.0),
            alignment: Alignment.center,
            child: ElevatedButton(onPressed: () async {
              final result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.custom,
                  allowedExtensions:  ['jpg','jpeg','pdf','mp4','mp3']
              );
              if (result == null) return;

              //Open a single file
              final file = result.files.first;
              //openFile(file);

              //Open multiple files
              final files=result.files;
              openFiles(files);

              print("Name:${file.name}");
              print("Bytes:${file.bytes}");
              print("Path:${file.path}");
              print("Size:${file.size}");
              print("Extension:${file.extension}");

              final newFile=await saveFilePermanently(file);
              print("From path:${file.path}");
              print("To path:${newFile.path}");
            }, child: Text("Pick File"),),
          ),
        )
    );
  }
  Future<File>saveFilePermanently(PlatformFile file) async  {
    final appStorage=await getApplicationDocumentsDirectory();
    final newFile=File("${appStorage.path}/${file.name}");
    return File(file.path!).copy(newFile.path);
  }
  void openFiles(List<PlatformFile> files){
    Navigator.of(context).push(MaterialPageRoute(
      builder:(context)=>FilesPage(
        files:files,
        onOpenedFile:openFile,
      ),
    ));
  }

  void openFile(PlatformFile file){
    OpenFile.open(file.path!);
  }
}

class FilesPage extends StatefulWidget{
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const FilesPage({
    Key? key,
    required this.files,
    required this.onOpenedFile
  }):super(key:key);

  @override
  State<StatefulWidget> createState()=> _FilePageState();
}

class _FilePageState extends State<FilesPage>{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("All Files"),
      centerTitle: true,
    ),
    body: Center(
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing:8,crossAxisSpacing: 8),
        itemCount: widget.files.length,
        itemBuilder:(context,index){
          final file=widget.files[index];
          return buildFile(file);
        },
      ),
    ),
  );
  Color getColor(String extension) {
    // Define a list of "hot" colors
    List<Color> hotColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.deepOrange,
      Colors.amber,
    ];

    // Generate a random index
    Random random = Random();
    int index = random.nextInt(hotColors.length);

    // Return a random hot color
    return hotColors[index];
  }
  Widget buildFile(PlatformFile file){
    final kb=file.size / 1024;
    final mb=kb / 1024;
    final fileSize= mb>=1 ? '${mb.toStringAsFixed(2)} MB': '${kb.toStringAsFixed(2)} KB';
    final extension = file.extension??'none';
    final color=getColor(extension);
    return InkWell(
      onTap:()=>widget.onOpenedFile(file),
      child: Container(
        padding:EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Expanded(child:Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('${extension}',style:TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),),
            )
            ),
            const SizedBox(height: 8,),
            Text(file.name,style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.black),),
            Text(fileSize,style:TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
