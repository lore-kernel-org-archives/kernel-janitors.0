From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Thu, 01 Mar 2012 09:41:29 +0000
Subject: Latest Kernel source Fail to Build
Message-Id: <CAOD=uF71cTJkKsEk4pyuN+JuP5Fw=_xDn0A5c_yob4paC6CJAA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi all,

I am getting following error while building latest kernel source;

----------------------------------------------------------------------------------------
  OBJCOPY arch/x86/boot/vmlinux.bin
  HOSTCC  arch/x86/boot/tools/build
  BUILD   arch/x86/boot/bzImage
Setup is 14560 bytes (padded to 14848 bytes).
System is 3733 kB
CRC e5cc211e
Kernel: arch/x86/boot/bzImage is ready  (#1)
  Building modules, stage 2.
  MODPOST 2253 modules
ERROR: "__udivdi3" [drivers/media/dvb/frontends/rtl2830.ko] undefined!
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2
[root@localhost linux-next]#
-----------------------------------------------------------------------------------------------

I have downloaded the latest linux-next from kernel.org


regards
santosh
