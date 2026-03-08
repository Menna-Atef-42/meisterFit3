import 'package:flutter/material.dart';

class LevelSelectionSheet extends StatefulWidget {
  final bool isVisible;
  final VoidCallback onClose;

  const LevelSelectionSheet({
    super.key,
    required this.isVisible,
    required this.onClose,
  });

  @override
  State<LevelSelectionSheet> createState() => _LevelSelectionSheetState();
}

class _LevelSelectionSheetState extends State<LevelSelectionSheet> {
  // متغير لتخزين المستوى المختار حالياً
  String selectedLevel = 'Standard';

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      left: 0,
      right: 0,
      // إذا كانتisVisible بـ true تظهر في الأسفل (0)، وإلا تختفي تحت الشاشة (-500)
      bottom: widget.isVisible ? 0 : -500,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        decoration: const BoxDecoration(
          color: Color(0xFF1C1C1E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black54, blurRadius: 10, spreadRadius: 1),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // مقبض صغير في الأعلى لإعطاء شكل الـ Sheet
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'CHOOSE LEVEL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onClose,
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: Color(0xFF3A3A3C),
                    child: Icon(Icons.close, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            _buildLevelOption('Standard', '18 min', '30 Reps', Colors.blue),
            _buildLevelOption('Intermediate', '27 min', '45 Reps', Colors.purple),
            _buildLevelOption('Advanced', '37 min', '60 Reps', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelOption(String title, String time, String reps, Color dotColor) {
    bool isSelected = selectedLevel == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLevel = title;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.greenAccent : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$time  |  $reps',
                    style: const TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.greenAccent, size: 22),
          ],
        ),
      ),
    );
  }
}