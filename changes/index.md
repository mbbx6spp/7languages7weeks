---
path: /changes/index.html  
layout: default  
title: Changes  
---

This page lists all posts with the category of _changes_.

<section>

<h2 id="posts">Posts</h2>

{% for page in site.categories.changes %}
  {% include post.html %}
{% endfor %}
</section>