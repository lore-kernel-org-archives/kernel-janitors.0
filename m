From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 15 Jun 2007 20:45:28 +0000
Subject: [KJ] another project: removing dead content from
Message-Id: <Pine.LNX.4.64.0706151632070.20018@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


  as another potential project, there appears to be a good deal of
obsolete content in the documentation file
"Documentation/kernel-parameters.txt", which lists the available
boot-time kernel parameters.

  it's obvious that some of those entries simply don't exist anymore.
for example, consider this entry:

	tmc8xx=3D         [HW,SCSI]
                        See header of drivers/scsi/seagate.c.

a quick search of the entire tree shows:

$ grep -rw tmc8xx *
Documentation/kernel-parameters.txt:    tmc8xx=3D         [HW,SCSI]
drivers/scsi/seagate.c: *     tmc8xx=ADDRESS,IRQ              (for a TMC-8x=
x or TMC-950 controller)
drivers/scsi/seagate.c: *     tmc8xx=3D0xC8000,15
$

unless i'm misreading something, it seems fairly clear that that
boot-time parameter is no longer supported, right?

  do the same for, say, "st0x" in the doc file:

	st0x=3D           [HW,SCSI]
                        See header of drivers/scsi/seagate.c.

and, again, search the tree:

$ grep -rw st0x *
Documentation/kernel-parameters.txt:    st0x=3D           [HW,SCSI]
drivers/scsi/seagate.c: *     st0x=ADDRESS,IRQ                (for a Seagat=
e controller)

  and for "gvp11":

        gvp11=3D          [HW,SCSI]

for which the output is a bit more complicated but, still, it doesn't
look like it's a boot-time parameter anywhere, right?

$ grep -rw gvp11 *
Documentation/kernel-parameters.txt:    gvp11=3D          [HW,SCSI]
Documentation/m68k/kernel-options.txt:5.4) gvp11Documentation/m68k/kernel-o=
ptions.txt:Syntax: gvp11=3D<addr-mask>
drivers/scsi/gvp11.h:/* $Id: gvp11.h,v 1.4 1997/01/19 23:07:12 davem Exp $
drivers/scsi/gvp11.h: * Written and (C) 1993, Ralf Baechle, see gvp11.c for=
 more info
drivers/scsi/Makefile:obj-$(CONFIG_GVP11_SCSI)  +=3D gvp11.o      wd33c93.o
drivers/scsi/gvp11.c:#include "gvp11.h"
drivers/scsi/gvp11.c:#include "gvp11.h"
drivers/scsi/Kconfig:     module will be called gvp11.

anyway, you get the idea.  if you're keen, feel free to start digging
through the doc file and locating dead kernel parms, and add them to
the following page:

http://fsdev.net/wiki/index.php?title=DEfunct_kernel_parameters

rday
--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=3DMain_Page
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
