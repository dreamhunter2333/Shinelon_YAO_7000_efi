/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190215 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLEaeux3.aml, Tue Apr  2 21:07:06 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000005B3 (1459)
 *     Revision         0x02
 *     Checksum         0xFE
 *     OEM ID           "hack"
 *     OEM Table ID     "BATT"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "BATT", 0x00000000)
{
    External (_SB_, DeviceObj)
    External (_SB_.BAT0, DeviceObj)
    External (_SB_.BAT0.BFB0, IntObj)
    External (_SB_.BAT0.PAK0, IntObj)
    External (_SB_.MUEX, MutexObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (BFB0, IntObj)

    Scope (_SB.PCI0.LPCB.EC0)
    {
        OperationRegion (ECXP, EmbeddedControl, Zero, 0xFF)
        Field (ECXP, ByteAcc, Lock, Preserve)
        {
            X0IF,   8, 
            X1IF,   8, 
            X2IF,   8, 
            X3IF,   8, 
            X4IF,   8, 
            X5IF,   8, 
            X6IF,   8, 
            X7IF,   8, 
            X8IF,   8, 
            X9IF,   8, 
            XI0F,   8, 
            XI1F,   8, 
            XI2F,   8, 
            XI3F,   8, 
            XI4F,   8, 
            XI5F,   8, 
            XI6F,   8, 
            XI7F,   8, 
            Offset (0x32), 
            X0ST,   8, 
            X1ST,   8, 
            X2ST,   8, 
            X3ST,   8, 
            X4ST,   8, 
            X5ST,   8, 
            X6ST,   8, 
            X7ST,   8, 
            X0TP,   8, 
            X1TP,   8, 
            Offset (0x62), 
            S0LU,   8, 
            S1LU,   8, 
            Offset (0x90), 
                ,   1, 
                ,   1, 
            BSOK,   1, 
            Offset (0xA6), 
            C0YC,   8, 
            C1YC,   8, 
            Offset (0xC0), 
            B0IF,   8, 
            B1IF,   8, 
            B2IF,   8, 
            B3IF,   8, 
            BI6F,   8, 
            BI7F,   8, 
            B4IF,   8, 
            B5IF,   8, 
            B6IF,   8, 
            B7IF,   8, 
            B8IF,   8, 
            B9IF,   8, 
            BI0F,   8, 
            BI1F,   8, 
            BI2F,   8, 
            BI3F,   8, 
            BI4F,   8, 
            BI5F,   8, 
            Offset (0xF2), 
            B0ST,   8, 
            B1ST,   8, 
            B2ST,   8, 
            B3ST,   8, 
            B4ST,   8, 
            B5ST,   8, 
            B6ST,   8, 
            B7ST,   8, 
            B0TP,   8, 
            B1TP,   8
        }
    }

    Scope (_SB.BAT0)
    {
        Method (ECBE, 0, NotSerialized)
        {
            Acquire (MUEX, 0xFFFF)
            Debug = "ECBE"
            PAK0 [One] = B1B2 (^^PCI0.LPCB.EC0.X2IF, ^^PCI0.LPCB.EC0.X3IF)
            If ((B1B2 (^^PCI0.LPCB.EC0.C0YC, ^^PCI0.LPCB.EC0.C1YC) >= 0x32))
            {
                PAK0 [0x02] = B1B2 (^^PCI0.LPCB.EC0.X4IF, ^^PCI0.LPCB.EC0.X5IF)
            }
            Else
            {
                PAK0 [0x02] = B1B2 (^^PCI0.LPCB.EC0.X2IF, ^^PCI0.LPCB.EC0.X3IF)
            }

            PAK0 [0x03] = B1B2 (^^PCI0.LPCB.EC0.X6IF, ^^PCI0.LPCB.EC0.X7IF)
            PAK0 [0x04] = B1B2 (^^PCI0.LPCB.EC0.X8IF, ^^PCI0.LPCB.EC0.X9IF)
            PAK0 [0x07] = B1B2 (^^PCI0.LPCB.EC0.XI4F, ^^PCI0.LPCB.EC0.XI5F)
            Release (MUEX)
        }

        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
        {
            Acquire (MUEX, 0xFFFF)
            Debug = "BST1 Start"
            If ((^^PCI0.LPCB.EC0.BSOK == One))
            {
                BFB0 [Zero] = B1B2 (^^PCI0.LPCB.EC0.X0ST, ^^PCI0.LPCB.EC0.X1ST)
                BFB0 [One] = B1B2 (^^PCI0.LPCB.EC0.X2ST, ^^PCI0.LPCB.EC0.X3ST)
                If ((B1B2 (^^PCI0.LPCB.EC0.C0YC, ^^PCI0.LPCB.EC0.C1YC) >= 0x32))
                {
                    BFB0 [0x02] = B1B2 (^^PCI0.LPCB.EC0.X4ST, ^^PCI0.LPCB.EC0.X5ST)
                }
                Else
                {
                    Local0 = ((B1B2 (^^PCI0.LPCB.EC0.X4ST, ^^PCI0.LPCB.EC0.X5ST) * 0x64) / B1B2 (^^PCI0.LPCB.EC0.X4IF, ^^PCI0.LPCB.EC0.X5IF)
                        )
                    Local1 = (B1B2 (^^PCI0.LPCB.EC0.X2IF, ^^PCI0.LPCB.EC0.X3IF) / 0x64)
                    BFB0 [0x02] = (Local0 * Local1)
                }

                BFB0 [0x03] = B1B2 (^^PCI0.LPCB.EC0.X6ST, ^^PCI0.LPCB.EC0.X7ST)
                Debug = "BST1 End"
            }

            Release (MUEX)
            Return (BFB0) /* External reference */
        }
    }

    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }
}

