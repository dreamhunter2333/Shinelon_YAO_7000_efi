/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190215 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLD0dDcf.aml, Tue Apr  2 21:06:47 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000109 (265)
 *     Revision         0x02
 *     Checksum         0x78
 *     OEM ID           "hack"
 *     OEM Table ID     "fnkey"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190215 (538509845)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "fnkey", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (ATKP, IntObj)

    Method (_SB.PCI0.LPCB.EC0._Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
    {
        Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
        Notify (\_SB.PCI0.LPCB.PS2K, 0x20) // Reserved
    }

    Method (_SB.PCI0.LPCB.EC0._Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
    {
        Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
        Notify (\_SB.PCI0.LPCB.PS2K, 0x10) // Reserved
    }
}

