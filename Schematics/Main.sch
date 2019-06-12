<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="IR1" />
        <signal name="IR2" />
        <signal name="CLK" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="SALIDA_MT(3:0)" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="RESET" />
        <signal name="IR_IN(2:0)" />
        <signal name="XLXN_21(2:0)" />
        <signal name="XLXN_22(1:0)" />
        <signal name="LUGARES_DISP(2:0)" />
        <signal name="DISPLAY_OUT(10:0)" />
        <port polarity="Input" name="IR1" />
        <port polarity="Input" name="IR2" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="SALIDA_MT(3:0)" />
        <port polarity="Input" name="RESET" />
        <port polarity="Input" name="IR_IN(2:0)" />
        <port polarity="Output" name="LUGARES_DISP(2:0)" />
        <port polarity="Output" name="DISPLAY_OUT(10:0)" />
        <blockdef name="UnidadDeControl">
            <timestamp>2019-3-11T19:19:50</timestamp>
            <rect width="352" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="480" y1="-480" y2="-480" x1="416" />
            <line x2="480" y1="-256" y2="-256" x1="416" />
            <rect width="64" x="416" y="-44" height="24" />
            <line x2="480" y1="-32" y2="-32" x1="416" />
        </blockdef>
        <blockdef name="Inversor">
            <timestamp>2019-3-11T19:20:0</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="DriverMotor">
            <timestamp>2019-3-11T19:20:9</timestamp>
            <rect width="288" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="416" y1="-160" y2="-160" x1="352" />
            <rect width="64" x="352" y="-44" height="24" />
            <line x2="416" y1="-32" y2="-32" x1="352" />
        </blockdef>
        <blockdef name="Decodificador">
            <timestamp>2019-3-11T19:20:16</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="DF">
            <timestamp>2019-3-11T19:20:24</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="Contador">
            <timestamp>2019-3-11T19:20:33</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="UnidadDeControl" name="XLXI_7">
            <blockpin signalname="IR1" name="IR_Entrada1" />
            <blockpin signalname="IR2" name="IR_Entrada2" />
            <blockpin signalname="XLXN_18" name="Stop_MT" />
            <blockpin signalname="RESET" name="reset" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="IR_IN(2:0)" name="IR_LEDS(2:0)" />
            <blockpin signalname="XLXN_22(1:0)" name="numLug_Disp(1:0)" />
            <blockpin signalname="XLXN_9" name="Enable_MT" />
            <blockpin signalname="XLXN_10" name="Dir_MT" />
            <blockpin signalname="XLXN_21(2:0)" name="Lug_Disp(2:0)" />
        </block>
        <block symbolname="DF" name="XLXI_8">
            <blockpin signalname="CLK" name="clk_in" />
            <blockpin signalname="RESET" name="reset" />
            <blockpin signalname="XLXN_19" name="clk_out" />
        </block>
        <block symbolname="Inversor" name="XLXI_9">
            <blockpin signalname="XLXN_21(2:0)" name="A(2:0)" />
            <blockpin signalname="LUGARES_DISP(2:0)" name="B(2:0)" />
        </block>
        <block symbolname="Decodificador" name="XLXI_10">
            <blockpin signalname="XLXN_22(1:0)" name="HEX(1:0)" />
            <blockpin signalname="DISPLAY_OUT(10:0)" name="LED(10:0)" />
        </block>
        <block symbolname="Contador" name="XLXI_11">
            <blockpin signalname="XLXN_21(2:0)" name="A(2:0)" />
            <blockpin signalname="XLXN_22(1:0)" name="unos(1:0)" />
        </block>
        <block symbolname="DriverMotor" name="XLXI_12">
            <blockpin signalname="XLXN_10" name="Direction" />
            <blockpin signalname="XLXN_9" name="StepEnable" />
            <blockpin signalname="XLXN_19" name="CLK" />
            <blockpin signalname="XLXN_18" name="Done" />
            <blockpin signalname="SALIDA_MT(3:0)" name="StepDrive(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="IR1">
            <wire x2="2576" y1="1520" y2="1520" x1="2560" />
            <wire x2="2864" y1="1520" y2="1520" x1="2576" />
        </branch>
        <branch name="IR2">
            <wire x2="2576" y1="1584" y2="1584" x1="2560" />
            <wire x2="2864" y1="1584" y2="1584" x1="2576" />
        </branch>
        <branch name="CLK">
            <wire x2="2752" y1="1840" y2="1840" x1="2560" />
            <wire x2="2752" y1="1840" y2="2176" x1="2752" />
            <wire x2="2912" y1="2176" y2="2176" x1="2752" />
            <wire x2="2864" y1="1840" y2="1840" x1="2752" />
        </branch>
        <branch name="SALIDA_MT(3:0)">
            <wire x2="4128" y1="1696" y2="1696" x1="4064" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="3408" y1="2176" y2="2176" x1="3296" />
            <wire x2="3408" y1="1696" y2="2176" x1="3408" />
            <wire x2="3648" y1="1696" y2="1696" x1="3408" />
        </branch>
        <iomarker fontsize="28" x="2592" y="1776" name="RESET" orien="R180" />
        <iomarker fontsize="28" x="2560" y="1840" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="2560" y="1584" name="IR2" orien="R180" />
        <iomarker fontsize="28" x="2560" y="1520" name="IR1" orien="R180" />
        <iomarker fontsize="28" x="4128" y="1696" name="SALIDA_MT(3:0)" orien="R0" />
        <branch name="RESET">
            <wire x2="2688" y1="1776" y2="1776" x1="2592" />
            <wire x2="2688" y1="1776" y2="2240" x1="2688" />
            <wire x2="2912" y1="2240" y2="2240" x1="2688" />
            <wire x2="2864" y1="1776" y2="1776" x1="2688" />
        </branch>
        <branch name="IR_IN(2:0)">
            <wire x2="2656" y1="1904" y2="1904" x1="2640" />
            <wire x2="2848" y1="1904" y2="1904" x1="2656" />
            <wire x2="2864" y1="1904" y2="1904" x1="2848" />
        </branch>
        <branch name="XLXN_21(2:0)">
            <wire x2="3440" y1="1968" y2="1968" x1="3344" />
            <wire x2="3552" y1="1968" y2="1968" x1="3440" />
            <wire x2="3440" y1="1968" y2="2176" x1="3440" />
            <wire x2="3552" y1="2176" y2="2176" x1="3440" />
        </branch>
        <branch name="LUGARES_DISP(2:0)">
            <wire x2="3952" y1="2176" y2="2176" x1="3936" />
            <wire x2="4048" y1="2176" y2="2176" x1="3952" />
        </branch>
        <iomarker fontsize="28" x="2640" y="1904" name="IR_IN(2:0)" orien="R180" />
        <iomarker fontsize="28" x="4048" y="2176" name="LUGARES_DISP(2:0)" orien="R0" />
        <branch name="DISPLAY_OUT(10:0)">
            <wire x2="4512" y1="1968" y2="1968" x1="4480" />
        </branch>
        <iomarker fontsize="28" x="4512" y="1968" name="DISPLAY_OUT(10:0)" orien="R0" />
        <branch name="XLXN_10">
            <wire x2="3360" y1="1744" y2="1744" x1="3344" />
            <wire x2="3632" y1="1568" y2="1568" x1="3360" />
            <wire x2="3648" y1="1568" y2="1568" x1="3632" />
            <wire x2="3360" y1="1568" y2="1744" x1="3360" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="3504" y1="1520" y2="1520" x1="3344" />
            <wire x2="3504" y1="1520" y2="1632" x1="3504" />
            <wire x2="3632" y1="1632" y2="1632" x1="3504" />
            <wire x2="3648" y1="1632" y2="1632" x1="3632" />
        </branch>
        <branch name="XLXN_22(1:0)">
            <wire x2="2784" y1="1968" y2="2064" x1="2784" />
            <wire x2="4032" y1="2064" y2="2064" x1="2784" />
            <wire x2="2864" y1="1968" y2="1968" x1="2784" />
            <wire x2="4032" y1="1968" y2="1968" x1="3936" />
            <wire x2="4096" y1="1968" y2="1968" x1="4032" />
            <wire x2="4032" y1="1968" y2="2064" x1="4032" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="4128" y1="1376" y2="1376" x1="2832" />
            <wire x2="4128" y1="1376" y2="1568" x1="4128" />
            <wire x2="2832" y1="1376" y2="1712" x1="2832" />
            <wire x2="2864" y1="1712" y2="1712" x1="2832" />
            <wire x2="4080" y1="1568" y2="1568" x1="4064" />
            <wire x2="4128" y1="1568" y2="1568" x1="4080" />
        </branch>
        <instance x="2864" y="2000" name="XLXI_7" orien="R0">
        </instance>
        <instance x="2912" y="2272" name="XLXI_8" orien="R0">
        </instance>
        <instance x="3552" y="2208" name="XLXI_9" orien="R0">
        </instance>
        <instance x="4096" y="2000" name="XLXI_10" orien="R0">
        </instance>
        <instance x="3552" y="2000" name="XLXI_11" orien="R0">
        </instance>
        <instance x="3648" y="1728" name="XLXI_12" orien="R0">
        </instance>
    </sheet>
</drawing>