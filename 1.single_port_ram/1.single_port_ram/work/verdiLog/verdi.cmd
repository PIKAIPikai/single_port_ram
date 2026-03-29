debImport "-f" "../script/filelist.f"
wvCreateWindow
wvOpenFile -win $_nWave2 {/home/user/Desktop/pk/1.single_port_ram/work/*.fsdb}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -line 2 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcHBSelect "tb_single_port.inst_single_port" -win $_nTrace1
srcSetScope "tb_single_port.inst_single_port" -delim "." -win $_nTrace1
srcHBSelect "tb_single_port.inst_single_port" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -line 5 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "tb_single_port" -win $_nTrace1
srcSetScope "tb_single_port" -delim "." -win $_nTrace1
srcHBSelect "tb_single_port" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr" -line 6 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
debExit
