procedure( changeRefs(newLib oldLib targetView)
  prog( (allCells cv)
    printf("Processing cells in %s lib for view %s\n" newLib targetView)
    allCells=ddGetObj(newLib)~>cells
    foreach(cell allCells
      cv=dbOpenCellViewByType(newLib cell~>name targetView "" "a")
      getWarn()
      if( cv then
        leRemasterInstances(cv oldLib "" "" newLib "" "" nil)
        if( targetView == "schematic" then
          schCheck(cv)
          dbCheck(cv)
        ) ;if
        dbSave(cv)
        dbClose(cv)
      ) ;if
    ) ;foreach
    return(t)
  ) ;prog
) ;procedure

changeRefs("sram_compiled_20240505_151244_r256_c256_w64" "sram_compiled" "schematic")
changeRefs("sram_compiled_20240505_151244_r256_c256_w64" "sram_compiled" "layout")

exit
