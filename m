From: "Jason Hogan O'Neill" <Jason.hogan@nottingham.ac.uk>
Date: Mon, 09 Jan 2006 10:34:40 +0000
Subject: [KJ] kernal compilation failing
Message-Id: <43C23C40.1000300@nottingham.ac.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi guys,

Sorry to bother you with this but I am stumped with this one. I have 
compiled dozens of kernels in the last 5 years and am a redhat certified 
engineer but this has got me. I download the source, do a make 
menuconfig ; make but its dying during the make, always at the same 
point. The following is the error output:

[snip]
  AS      arch/x86_64/lib/memcpy.o
  CC      arch/x86_64/lib/memmove.o
  AS      arch/x86_64/lib/memset.o
  AS      arch/x86_64/lib/putuser.o
  AS      arch/x86_64/lib/thunk.o
  CC      arch/x86_64/lib/usercopy.o
  AR      arch/x86_64/lib/lib.a
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
ld: kernel/built-in.o: No such file: No such file or directory
make: *** [.tmp_vmlinux1] Error 1


Or more quickly after already having done make, then do make immediately 
again without cleaning:

  CHK     include/linux/version.h
  CHK     include/linux/compile.h
  CHK     usr/initramfs_list
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
kernel/built-in.o: file not recognized: File truncated
make: *** [.tmp_vmlinux1] Error 1


OUTPUT of sh scripts/ver_linux:

Linux suigrid54 2.6.4-52-smp #1 SMP Wed Apr 7 01:58:54 UTC 2004 x86_64 
x86_64 x86_64 GNU/Linux

Gnu C                  3.3.3
Gnu make               3.80
binutils               2.15.90.0.1.1
util-linux             2.12
mount                  2.12
module-init-tools      3.0-pre10
e2fsprogs              1.34
jfsutils               1.1.5
reiserfsprogs          3.6.13
reiser4progs           line
xfsprogs               2.6.3
PPP                    2.4.2
isdn4k-utils           3.4
nfs-utils              1.0.6
Linux C Library        x  1 root root 1396772 Apr  6  2004 
/lib64/tls/libc.so.6
Dynamic linker (ldd)   2.3.3
Linux C++ Library      5.0.5
Procps                 3.2.1
Net-tools              1.60
Kbd                    1.12
Sh-utils               5.2.1
udev                   021_bk
Modules Loaded         snd_pcm_oss snd_pcm snd_page_alloc snd_timer 
snd_mixer_oss snd soundcore udf iptable_filter ip_tables nls_iso8859_1 
nls_cp437 vfat fat sg usb_storage joydev st sr_mod floppy usbserial 
parport_pc lp parport thermal processor fan button battery ac ipv6 
af_packet tg3 ohci_hcd usbcore hw_random evdev subfs dm_mod reiserfs 
mptscsih mptbase sd_mod scsi_mod

I am trying to install this on a dual core 4-way CPU Sun V40z. I 
successfully installed Susue 9.1 which went very nicely and the BIOS 
upon reboot sees all 8 cores. Example snip from cat /proc/cpuinfo:

processor       : 7
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 33
model name      : Dual Core AMD Opteron(tm) Processor 875
stepping        : 0
cpu MHz         : 2189.566
cache size      : 1024 KB
physical id     : 0
siblings        : 1
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext lm 
3dnowext 3dnow pni
bogomips        : 4374.52
TLB size        : 1088 4K pages
clflush size    : 64
address sizes   : 40 bits physical, 48 bits virtual
power management: ts fid vid ttp


I really hope you can help with this one.

Many thanks in advance,
Jason

-- 
Dr JJ Hogan-O'Neill			Network and Systems
Senior Systems Developer - HPC		Kings Meadow Campus
					University of Nottingham
Tel: 0115 951 3328			Lenton Lane
Fax: 0115 846 8244			Nottingham
					NG7 2NR





This message has been checked for viruses but the contents of an attachment
may still contain software viruses, which could damage your computer system:
you are advised to perform your own checks. Email communications with the
University of Nottingham may be monitored as permitted by UK legislation.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
