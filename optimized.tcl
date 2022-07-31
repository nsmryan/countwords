#!/usr/bin/env tclsh

proc main {} {
    fconfigure stdin -buffering line

    # It turns out that dict is a little faster then array for this problem.
    set table [list]
    while {[gets stdin data] >= 0} {
      foreach word [split [string tolower $data]] {
        dict incr table $word
      }
    }

    foreach {word count} [lsort -decreasing -integer -index 1 -stride 2 $table] {
      puts "$word $count"
    }
}

main
