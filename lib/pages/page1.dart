import 'package:flutter/material.dart';
import 'person_detail.dart';

class TeamMember {
  final String name;
  final String imageAsset;
  final String description;
  final String elaboration;
  final List<String> contributions;
  final String quote;

  const TeamMember({
    required this.name,
    required this.imageAsset,
    required this.description,
    required this.elaboration,
    required this.contributions,
    required this.quote,
  });
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  final List<TeamMember> members = const [
    TeamMember(
      name: 'Gladson George',
      imageAsset: 'assets/team1.jpeg',
      description: 'Team Captian',
      elaboration: 'As Team Captain, Gladson leads the group with dedication, ensuring every member is motivated and the team spirit remains high. He is known for his leadership skills and ability to make tough decisions under pressure.',
      contributions: [
        'Led the team to multiple victories in competitions.',
        'Motivated and mentored new members.',
        'Coordinated team meetings and strategy sessions.',
        'Developed strategies for overcoming obstacles.',
        'Represented the team at inter-college events.',
        'Built a culture of trust and respect.',
      ],
      quote: 'Leadership is not a position or a title, it is action and example.'
    ),
    TeamMember(
      name: 'Amrutha B',
      imageAsset: 'assets/team2.jpeg',
      description: 'Team Vice Captian',
      elaboration: 'Amrutha supports the captain and steps up whenever needed. She is the backbone of the team, always ready to take responsibility and guide others.',
      contributions: [
        'Assisted the captain in all leadership duties.',
        'Organized team-building activities.',
        'Ensured smooth communication among members.',
        'Bridged gaps between team members.',
        'Handled conflict resolution gracefully.',
        'Took initiative in planning surprise events.',
      ],
      quote: 'Success is best when it’s shared.'
    ),
    TeamMember(
      name: 'Akshay Murali ',
      imageAsset: 'assets/team3.jpeg',
      description: 'Co-ordinator.',
      elaboration: 'Akshay ensures that all events and activities are well-organized. His coordination skills help the team stay on track and achieve their goals efficiently.',
      contributions: [
        'Planned and scheduled all team events.',
        'Managed logistics for competitions and practices.',
        'Kept records of team progress.',
        'Streamlined communication with external parties.',
        'Maintained a calendar of important deadlines.',
        'Helped automate repetitive tasks for the team.',
      ],
      quote: 'Great things are done by a series of small things brought together.'
    ),
    TeamMember(
      name: 'Alex lison',
      imageAsset: 'assets/team4.jpeg',
      description: 'Resource Person.',
      elaboration: 'Alex is the go-to person for resources and information. He is always prepared and ensures the team has everything they need.',
      contributions: [
        'Provided necessary materials and resources for the team.',
        'Researched and shared valuable information.',
        'Supported team members in their preparation.',
        'Created a shared knowledge base for the team.',
        'Connected the team with external experts.',
        'Kept inventory of all team assets.',
      ],
      quote: 'Knowledge shared is knowledge multiplied.'
    ),
    TeamMember(
      name: 'Abhay Subramanian',
      imageAsset: 'assets/team5.png',
      description: 'Active Player.',
      elaboration: 'Abhay brings energy and enthusiasm to the team. His active participation in all activities inspires others to give their best.',
      contributions: [
        'Participated actively in all team events.',
        'Motivated others through his enthusiasm.',
        'Helped in organizing practice sessions.',
        'Volunteered for extra duties during events.',
        'Encouraged fair play and sportsmanship.',
        'Initiated team warm-up routines.',
      ],
      quote: 'Energy and persistence conquer all things.'
    ),
    TeamMember(
      name: 'Aswathi Bindhu',
      imageAsset: 'assets/team6.jpeg',
      description: 'Creative Person',
      elaboration: 'Aswathi is known for her creativity and innovative ideas. She adds a unique touch to every project and helps the team think outside the box.',
      contributions: [
        'Designed posters and creative materials.',
        'Came up with innovative solutions for challenges.',
        'Inspired the team with creative ideas.',
        'Organized brainstorming sessions.',
        'Introduced new digital tools for collaboration.',
        'Helped with visual storytelling for presentations.',
      ],
      quote: 'Creativity is intelligence having fun.'
    ),
    TeamMember(
      name: 'Athira P S',
      imageAsset: 'assets/team7.jpeg',
      description: 'Silent Storm.',
      elaboration: 'Athira may be quiet, but her impact is powerful. She works diligently behind the scenes and delivers outstanding results.',
      contributions: [
        'Worked efficiently behind the scenes.',
        'Delivered high-quality work without seeking attention.',
        'Supported the team in every possible way.',
        'Took care of documentation and notes.',
        'Ensured tasks were completed on time.',
        'Provided emotional support to team members.',
      ],
      quote: 'Silent waters run deep.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Team'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonDetailPage(member: member),
      ),
    );
  },
  child: Card(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              member.imageAsset,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(member.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 8),
          Text(member.description, textAlign: TextAlign.center),
const SizedBox(height: 6),
Text(
  member.elaboration,
  style: TextStyle(fontSize: 14, color: Colors.black87),
  textAlign: TextAlign.center,
),
        ],
      ),
    ),
  ),
);
        },
      ),
    );
  }
}

