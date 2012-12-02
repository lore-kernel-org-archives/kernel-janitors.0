From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sun, 02 Dec 2012 02:40:16 +0000
Subject: [PATCH 0/6] Remove useless calls to memset().
Message-Id: <1354416022-20189-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>

The following six patches remove useless calls to memset(). They have been found
with this Coccinelle script:

<spml>
@@
expression E;
expression S;
@@
-memset(E, 0, S);
 memcpy(E, ..., S);
</spml>

They have only been tested by compilation.

WBR,
Cyril Roelandt.


Cyril Roelandt (6):
  bna: remove useless calls to memset().
  scsi: bfa: remove useless calls to memset().
  scsi: bnx2fc: remove useless calls to memset().
  scsi: megaraid: remove a useless call to memset().
  rtl8712: remove useless calls to memset().
  vt6656: remove a useless call to memset().

 drivers/net/ethernet/brocade/bna/bfa_ioc.c  |    4 ----
 drivers/scsi/bfa/bfa_ioc.c                  |    1 -
 drivers/scsi/bfa/bfad_bsg.c                 |    1 -
 drivers/scsi/bnx2fc/bnx2fc_hwi.c            |    4 ----
 drivers/scsi/megaraid/megaraid_sas_fusion.c |    2 --
 drivers/staging/rtl8712/mlme_linux.c        |    2 --
 drivers/staging/rtl8712/rtl871x_cmd.c       |    1 -
 drivers/staging/rtl8712/rtl871x_ioctl_set.c |    2 --
 drivers/staging/rtl8712/rtl871x_mlme.c      |    5 -----
 drivers/staging/vt6656/bssdb.c              |    1 -
 10 files changed, 23 deletions(-)

-- 
1.7.10.4

