From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Nov 2017 10:19:19 +0000
Subject: [PATCH] [media] dvb_frontend: remove redundant status self assignment
Message-Id: <20171123101919.16844-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment status to itself is redundant and can be removed.
Detected with Coccinelle.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/drxd_hard.c    | 3 ---
 drivers/media/dvb-frontends/tda18271c2dd.c | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxd_hard.c b/drivers/media/dvb-frontends/drxd_hard.c
index 0696bc62dcc9..ff18a0f7dc41 100644
--- a/drivers/media/dvb-frontends/drxd_hard.c
+++ b/drivers/media/dvb-frontends/drxd_hard.c
@@ -2140,7 +2140,6 @@ static int DRX_Start(struct drxd_state *state, s32 off)
 			}
 			break;
 		}
-		status = status;
 		if (status < 0)
 			break;
 
@@ -2251,7 +2250,6 @@ static int DRX_Start(struct drxd_state *state, s32 off)
 			break;
 
 		}
-		status = status;
 		if (status < 0)
 			break;
 
@@ -2318,7 +2316,6 @@ static int DRX_Start(struct drxd_state *state, s32 off)
 			}
 			break;
 		}
-		status = status;
 		if (status < 0)
 			break;
 
diff --git a/drivers/media/dvb-frontends/tda18271c2dd.c b/drivers/media/dvb-frontends/tda18271c2dd.c
index 2d2778be2d2f..45cd5ba0cf8a 100644
--- a/drivers/media/dvb-frontends/tda18271c2dd.c
+++ b/drivers/media/dvb-frontends/tda18271c2dd.c
@@ -674,7 +674,6 @@ static int PowerScan(struct tda_state *state,
 			Count = 200000;
 			wait = true;
 		}
-		status = status;
 		if (status < 0)
 			break;
 		if (CID_Gain >= CID_Target) {
-- 
2.14.1

