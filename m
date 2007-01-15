From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 15 Jan 2007 17:15:22 +0000
Subject: [KJ] possibly dead config variables
Message-Id: <Pine.LNX.4.64.0701151207480.5724@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  based on a script i whipped together, there is a strong possibility
that the following kernel config variables are useless.

X86_XADD
IPDDP_DECAP
PARIDE_PARPORT
AIC7XXX_PROBE_EISA_VL
AIC79XX_ENABLE_RD_STRM
SCSI_NCR53C8XX_PROFILE
53C700_IO_MAPPED
DLCI_COUNT
MOUSE_ATIXL
VIDEO_BT848_DVB
VIDEO_ZORAN_BUZ
VIDEO_ZORAN_DC10
VIDEO_ZORAN_LML33
VIDEO_ZORAN_LML33R10
VIDEO_ZORAN_AVS6EYES
VIDEO_PVRUSB2_29XXX
VIDEO_PVRUSB2_24XXX
VIDEO_VIDEOBUF
LCD_DEVICE
SND_AD1848_LIB
SND_CS4231_LIB
AEDSP16_MPU401
USB_USBNET_MII
USB_SERIAL_SAFE_PADDED
JBD2_DEBUG
ZISOFS_FS
DEBUG_RWSEMS

  to elucidate, what i mean by "useless" is that they exist in some
Kconfig file and may even be selectable, but appear to have no effect
on the build whatsoever.  that is, they don't affect any other config
variable, they are not part of any Makefile, they are not examined by
any source file, etc.

  as one example, consider searching for the variable X86_XADD:

$ grep -r X86_XADD .
./arch/i386/defconfig:CONFIG_X86_XADD=y
./arch/i386/Kconfig.cpu:config X86_XADD
./arch/um/defconfig:CONFIG_X86_XADD=y

  ignoring any "defconfig" files, you can see that the only place this
variable occurs is once in a Kconfig.cpu file.  unless i'm missing
something obvious, i don't see how this variable can effect any kernel
build.

  do the same with MOUSE_ATIXL:

$ grep -r MOUSE_ATIXL .
./drivers/input/mouse/Kconfig:config MOUSE_ATIXL

i'm guessing that is one dead variable, no?

  anyway, does this seem like reasonable logic?  feel free to poke at
some of the others.  i'm not guaranteeing that the list is perfect,
but it's a set of strong candidates for further examination and
possible removal.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
