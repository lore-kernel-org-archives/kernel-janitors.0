From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:08:02 +0000
Subject: [KJ] [PATCH 0/53] Clean up printk()'s in drivers/video/*
Message-Id: <20050125230756.10418.22972.52869@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58157211799708475=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58157211799708475==

This series of patches adds KERN_ constants to all of the printk()'s that need
them in drivers/video.  There's quite a few of them, so be prepared :)

Diffstat:
 drivers/video/S3triofb.c             |    8 -
 drivers/video/acornfb.c              |    4
 drivers/video/amifb.c                |    6 -
 drivers/video/atafb.c                |    6 -
 drivers/video/aty/atyfb_base.c       |   42 ++++++---
 drivers/video/aty/mach64_ct.c        |   22 +----
 drivers/video/aty/radeon_base.c      |    8 -
 drivers/video/aty/radeon_monitor.c   |    6 -
 drivers/video/aty/radeon_pm.c        |    6 -
 drivers/video/bw2.c                  |    2
 drivers/video/cg14.c                 |    2
 drivers/video/cg3.c                  |    2
 drivers/video/cg6.c                  |    2
 drivers/video/cirrusfb.c             |   21 ++--
 drivers/video/clps711xfb.c           |    2
 drivers/video/console/fbcon.c        |    2
 drivers/video/console/mdacon.c       |    4
 drivers/video/console/newport_con.c  |    4
 drivers/video/cyber2000fb.c          |    2
 drivers/video/cyberfb.c              |    4
 drivers/video/dnfb.c                 |    2
 drivers/video/fbmem.c                |    2
 drivers/video/fbmon.c                |   10 +-
 drivers/video/ffb.c                  |    6 -
 drivers/video/fm2fb.c                |    2
 drivers/video/i810/i810_accel.c      |    9 +-
 drivers/video/i810/i810_main.c       |   47 +++++-----
 drivers/video/igafb.c                |   12 +-
 drivers/video/imsttfb.c              |    5 -
 drivers/video/intelfb/intelfbhw.c    |  152 +++++++++++++++++------------------
 drivers/video/kyro/fbdev.c           |    2
 drivers/video/leo.c                  |    2
 drivers/video/macfb.c                |   14 +--
 drivers/video/matrox/matroxfb_base.c |    2
 drivers/video/modedb.c               |    2
 drivers/video/neofb.c                |   10 +-
 drivers/video/p9100.c                |    2
 drivers/video/platinumfb.c           |    6 -
 drivers/video/pm3fb.c                |    2
 drivers/video/pmag-ba-fb.c           |    2
 drivers/video/pmagb-b-fb.c           |    2
 drivers/video/pvr2fb.c               |    4
 drivers/video/radeonfb.c             |   63 ++++++--------
 drivers/video/retz3fb.c              |   84 +++++++++----------
 drivers/video/riva/fbdev.c           |   13 +-
 drivers/video/savage/savagefb.c      |   35 ++++----
 drivers/video/sstfb.c                |    2
 drivers/video/sun3fb.c               |    6 -
 drivers/video/tcx.c                  |    2
 drivers/video/tdfxfb.c               |   12 +-
 drivers/video/virgefb.c              |   46 +++++-----
 drivers/video/w100fb.c               |    8 -
 include/video/trident.h              |    2
 53 files changed, 370 insertions(+), 355 deletions(-)

--===============58157211799708475==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58157211799708475==--
