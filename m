From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Thu, 15 May 2008 14:12:02 +0000
Subject: Fwd: bad_page_fault oops
Message-Id: <e4c675870805150712r2c58e630i7d350a40f5c06521@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all folks,

 before writing here I tried opening a thread in linuxnewbies and
somebody tried to help me but...
 I still have the problem and I have no any other idea how to face it... :-(
 So I decide to write here hoping not having done wrong!

 I think if I could reproduce following Oops I would be at half of my way.
 It happens in the first 30-60 seconds after boot or it does not happen at all.
 At this time I need to force around 1500 reboots to see it once.

 It was running a 2.6.21.7 on PPC MPC8247 CPU when this Oops happens


Oops: kernel access of bad area, sig: 11 [#1]
PREEMPT
NIP: 00000000 LR: 00000000 CTR: 00000000
REGS: ced69dd0 TRAP: 0400   Not tainted  (2.6.21.7)
MSR: 20009032 <EE,ME,IR,DR>  CR: 24004228  XER: 20000000
TASK = cfb614c0[1747] 'df' THREAD: ced68000
GPR00: 00000000 CED69E80 CFB614C0 C02F5630 C0400000 10005000 10000000 C0541580
GPR08: 10004000 C02F0000 0000F52C 00000000 44004222 10089214 0FFC4000 00000001
GPR16: FFFFFFFF 007FFF00 0FFBF6D8 00000000 00000000 C02F5630 00000001 CED69E9C
GPR24: 00000000 CED69E98 00000000 00000001 FFFFFFFF 10070000 10005000 CE973B00
NIP [00000000] 0x0
LR [00000000] 0x0
Call Trace:
Instruction dump:
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
Fixing recursive fault but reboot is needed!
BUG: scheduling while atomic: df/0x00000001/1747
Call Trace:
[CED69CD0] [C000C174] show_stack+0x4c/0x194 (unreliable)
[CED69D10] [C0238ADC] schedule+0x6a4/0x6a8
[CED69D50] [C001B490] do_exit+0x440/0x480
[CED69D80] [C0004AD8] die+0xc4/0xcc
[CED69DA0] [C000E1B0] bad_page_fault+0x5c/0x60
[CED69DC0] [C000459C] handle_page_fault+0x7c/0x80
[CED69E80] [00000000] 0x0

 Best regards,
-- 
/roberto
