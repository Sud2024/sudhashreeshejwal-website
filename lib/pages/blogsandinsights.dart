import 'package:flutter/material.dart';

class BlogsAndInsights extends StatefulWidget {
  const BlogsAndInsights({super.key});

  @override
  State<BlogsAndInsights> createState() => _FeaturedprojectsState();
}

class _FeaturedprojectsState extends State<BlogsAndInsights> {
  final List<BlogPost> blogPosts = [
    BlogPost(
      category: 'Web Development',
      readTime: '5 min read',
      title: 'Modern Web Development Practices in 2024',
      description:
      'Exploring the latest trends and best practices in modern web development, including performance optimization and user experience.',
      date: 'March 15, 2024',
    ),
    BlogPost(
      category: 'AI & ML',
      readTime: '8 min read',
      title: 'Implementing AI in Modern Applications',
      description:
      'A deep dive into practical applications of AI and machine learning in today’s software development landscape.',
      date: 'March 10, 2024',
    ),
    BlogPost(
      category: 'Cloud Computing',
      readTime: '6 min read',
      title: 'Scaling Applications in the Cloud',
      description:
      'Essential strategies and best practices for scaling applications effectively in cloud environments.',
      date: 'March 5, 2024',
    ),
  ];

  final List<BlogCategory> blogCategories = [
    BlogCategory(category: 'Web Development', articles: '12 Articles'),
    BlogCategory(category: 'AI & ML', articles: '8 Articles'),
    BlogCategory(category: 'Cloud Computing', articles: '10 Articles'),
    BlogCategory(category: 'DevOps', articles: '6 Articles'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Blogs and Insights",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 120,
            height: 4,
            color: Colors.blue,
          ),
          const SizedBox(height: 40),
          // Blog Posts
          ...blogPosts.map((post) => BlogPostCard(blogPost: post)),
          const SizedBox(height: 40),
          // Blog Categories Section
          Text(
            'Blog Categories',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          isSmallScreen
              ? Column(
            children: blogCategories
                .map((category) => BlogCategoryCard(blogCategory: category))
                .toList(),
          )
              : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: blogCategories
                  .map((category) => BlogCategoryCard(blogCategory: category))
                  .toList(),
            ),
          ),
          const SizedBox(height: 20),
          // View All Posts Button
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                'View All Posts',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlogPost {
  final String category;
  final String readTime;
  final String title;
  final String description;
  final String date;

  BlogPost({
    required this.category,
    required this.readTime,
    required this.title,
    required this.description,
    required this.date,
  });
}

class BlogPostCard extends StatelessWidget {
  final BlogPost blogPost;

  const BlogPostCard({super.key, required this.blogPost});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  blogPost.category,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  blogPost.readTime,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              blogPost.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              blogPost.description,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  blogPost.date,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read More >',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BlogCategory {
  final String category;
  final String articles;

  BlogCategory({
    required this.category,
    required this.articles,
  });
}

class BlogCategoryCard extends StatelessWidget {
  final BlogCategory blogCategory;

  const BlogCategoryCard({super.key, required this.blogCategory});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20, right: 20),
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              blogCategory.category,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              blogCategory.articles,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}