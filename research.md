---
layout: default
category: research
title: Research
description: >-
    Brenton Kenkel's research page.
jquery: |-
    $('button').click(function() {
        if ( $(this).hasClass('collapsed') ) {
            $(this).text('Hide Full Abstract');
        } else {
            $(this).text('Show Full Abstract');
        }
    });

---

## Working Papers

{% for article in site.data.working-papers %}
  <div class="row"><div class="col-sm-12">
  <h3>
    {{article.title}}
    {% for link in article.links %}<small>&nbsp;&nbsp;&nbsp;&nbsp;<a href="{{link.url}}">{{link.name}}</a></small>{% endfor %}
  </h3>
  {% if article.note %}
  <p>
    <i>{{article.note}}</i>
  </p>
  {% endif %}
  </div></div>
  <div class="row"><div class="col-sm-12">
  {% if article.image %}
    <div class="{{article.image.size}}"><img class="img-thumbnail" src="{{article.image.url}}"></div>
  {% endif %}
  <p>
    {{article.abstract-short}}
  </p>
  <button type="button" class="btn btn-link btn-sm collapsed"
  data-toggle="collapse" data-target="#abstract-{{forloop.index}}">
    Show Full Abstract
  </button>
  <p id="abstract-{{forloop.index}}" class="collapse">
    {{article.abstract-long}}
  </p>
  {% if article.companions %}
  Companion papers: <ul>
  {% for paper in article.companions %}
  <li>[{{paper.title}}]({{paper.url}})</li>
  {% endfor %}
  </ul>
  {% endif %}
  </div></div>
{% endfor %}
