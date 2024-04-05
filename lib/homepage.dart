import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String yourName = "";
  String partnerName = "";

  Map<String, String> data = {
    "f": "friend",
    "l": "lover",
    "a": "affection",
    "m": "merrage",
    "e": "enimies",
    "s": "sister/Brother"
  };

  String getTheRelationship(List<String> flames, length) {
    final finalRemovingData = length % flames.length;
    final local = [...flames];
    local.removeAt(
        finalRemovingData == 0 ? flames.length - 1 : finalRemovingData - 1);
    if (local.length == 1) {
      return local.join('');
    }
    return getTheRelationship(local, length);
  }

  void findMyRelationship() {
    List<String> longestName =
        (yourName.length > partnerName.length ? yourName : partnerName)
            .split("");
    List<String> shotestName =
        (yourName.length < partnerName.length ? yourName : partnerName)
            .split("");

    final local = [...longestName];
    for (var singleCharacter in local) {
      if (shotestName.contains(singleCharacter)) {
        longestName.remove(singleCharacter);
        shotestName.remove(singleCharacter);
      }
    }
    final totalLengthName = longestName.length + shotestName.length;
    List<String> flames = ["f", "l", "a", "m", "e", "s"];
    final ans = getTheRelationship(flames, totalLengthName);

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Your RelationShip'),
        content:  Text(data[ans] ?? ""),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: ((value) {
              yourName = value;
            }),
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Your Name '),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: ((value) {
              partnerName = value;
            }),
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Your Partner '),
          ),
        ),
        TextButton(
            onPressed: () {
              findMyRelationship();
            },
            child: Container(
              color: Color.fromARGB(255, 255, 137, 176),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Find My Relationship",
                  style: TextStyle(
                    // backgroundColor: Color.fromARGB(255, 255, 137, 176),
                    color: Colors.white,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
