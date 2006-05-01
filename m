From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 01 May 2006 17:00:24 +0000
Subject: [KJ] [PATCH] drivers/scsi: Use ARRAY_SIZE macro
Message-Id: <20060501170024.GA1284@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15536250564142429=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============15536250564142429==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

As the patch is quite big you can find it on
http://distanz.ch/patches/kj/array_size-drivers_scsi-2.6.17-rc3.diff

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]) and remove
duplicates of the macro.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 drivers/scsi/3w-xxxx.c              |    6 +++---
 drivers/scsi/53c700.c               |   19 ++++++++-----------
 drivers/scsi/53c7xx.c               |   14 +++++++-------
 drivers/scsi/NCR53c406a.c           |    8 ++++----
 drivers/scsi/aacraid/aachba.c       |   18 ++++++++----------
 drivers/scsi/aacraid/commctrl.c     |    2 +-
 drivers/scsi/aha1542.c              |   31 ++++++++++++++-----------------
 drivers/scsi/aic7xxx/aic7770.c      |    2 +-
 drivers/scsi/aic7xxx/aic79xx.h      |    2 --
 drivers/scsi/aic7xxx/aic79xx_core.c |   10 +++++-----
 drivers/scsi/aic7xxx/aic79xx_osm.c  |   20 ++++++++++----------
 drivers/scsi/aic7xxx/aic79xx_pci.c  |    4 ++--
 drivers/scsi/aic7xxx/aic79xx_proc.c |    4 +---
 drivers/scsi/aic7xxx/aic7xxx.h      |    2 --
 drivers/scsi/aic7xxx/aic7xxx_core.c |    8 ++++----
 drivers/scsi/aic7xxx/aic7xxx_osm.c  |   12 ++++++------
 drivers/scsi/aic7xxx/aic7xxx_pci.c  |    4 ++--
 drivers/scsi/aic7xxx/aic7xxx_proc.c |    4 +---
 drivers/scsi/aic7xxx_old.c          |    2 +-
 drivers/scsi/constants.c            |   33 +++++++++++++--------------------
 drivers/scsi/dtc.c                  |   18 +++++++++---------
 drivers/scsi/fd_mcs.c               |    2 +-
 drivers/scsi/fdomain.c              |   10 +++++-----
 drivers/scsi/g_NCR5380.c            |   19 +++++++++----------
 drivers/scsi/gdth.c                 |    4 ++--
 drivers/scsi/ibmmca.c               |   16 +++++++---------
 drivers/scsi/in2000.c               |    2 +-
 drivers/scsi/initio.c               |    3 +--
 drivers/scsi/ips.c                  |    2 +-
 drivers/scsi/osst.c                 |    4 ++--
 drivers/scsi/pas16.c                |    8 ++++----
 drivers/scsi/qla1280.c              |    7 ++-----
 drivers/scsi/qlogicpti.c            |    2 +-
 drivers/scsi/raid_class.c           |    4 ++--
 drivers/scsi/scsi_lib.c             |    2 +-
 drivers/scsi/scsi_sysfs.c           |    8 ++++----
 drivers/scsi/scsi_transport_fc.c    |    6 +++---
 drivers/scsi/scsi_transport_sas.c   |    4 ++--
 drivers/scsi/scsi_transport_spi.c   |    4 ++--
 drivers/scsi/sd.c                   |    2 +-
 drivers/scsi/seagate.c              |    4 ++--
 drivers/scsi/sg.c                   |    6 ++----
 drivers/scsi/st.c                   |    2 +-
 drivers/scsi/sym53c8xx_2/sym_hipd.c |    3 +--
 drivers/scsi/t128.c                 |   10 +++++-----
 drivers/scsi/wd33c93.c              |    2 +-
 drivers/scsi/wd7000.c               |   12 ++++++------
 47 files changed, 169 insertions(+), 202 deletions(-)


--===============15536250564142429==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15536250564142429==--
