From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Sep 2014 16:18:34 +0000
Subject: [PATCH 6/7] staging: lustre: obdclass: expand the GOTO macro + break
Message-Id: <1410106715-9573-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, "Dilger, Andreas" <andreas.dilger@intel.com>, "Drokin, Oleg" <oleg.drokin@intel.com>, Peng Tao <bergwolf@gmail.com>

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier lbl,rc,f;
constant c;
@@

- GOTO(lbl,\(rc\|rc->f\|c\));
- break;
+ goto lbl;

@@
identifier lbl;
expression rc;
@@

- GOTO(lbl,rc);
- break;
+ rc;
+ goto lbl;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdclass/obd_config.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/obd_config.c b/drivers/staging/lustre/lustre/obdclass/obd_config.c
index f41695d..8a9752f 100644
--- a/drivers/staging/lustre/lustre/obdclass/obd_config.c
+++ b/drivers/staging/lustre/lustre/obdclass/obd_config.c
@@ -1226,25 +1226,25 @@ int class_process_config(struct lustre_cfg *lcfg)
 	}
 	case LCFG_POOL_NEW: {
 		err = obd_pool_new(obd, lustre_cfg_string(lcfg, 2));
-		GOTO(out, err = 0);
-		break;
+		err = 0;
+		goto out;
 	}
 	case LCFG_POOL_ADD: {
 		err = obd_pool_add(obd, lustre_cfg_string(lcfg, 2),
 				   lustre_cfg_string(lcfg, 3));
-		GOTO(out, err = 0);
-		break;
+		err = 0;
+		goto out;
 	}
 	case LCFG_POOL_REM: {
 		err = obd_pool_rem(obd, lustre_cfg_string(lcfg, 2),
 				   lustre_cfg_string(lcfg, 3));
-		GOTO(out, err = 0);
-		break;
+		err = 0;
+		goto out;
 	}
 	case LCFG_POOL_DEL: {
 		err = obd_pool_del(obd, lustre_cfg_string(lcfg, 2));
-		GOTO(out, err = 0);
-		break;
+		err = 0;
+		goto out;
 	}
 	default: {
 		err = obd_process_config(obd, sizeof(*lcfg), lcfg);
