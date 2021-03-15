{% macro datetime_diff(column1, column2, type=minute) %}

((extract (
  {{ type }} from (
      {{ column1 }}::timestamp - {{ column2 }}::timestamp
                       )
           )
  ))::integer
{% endmacro %}
