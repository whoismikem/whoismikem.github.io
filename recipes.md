---
layout: page
title: "Recipes"
permalink: "/recipes/"
---
<ul>
  {% assign sorted_pages = site.recipes | sort %}
  {% for recipe in sorted_pages %}
    <li>
      <a href="{{ recipe.url }}">{{ recipe.name }}</a>
    </li>
  {% endfor %}
</ul>
