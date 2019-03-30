From: Colin King <colin.king@canonical.com>
Date: Sat, 30 Mar 2019 15:25:03 +0000
Subject: [PATCH] media: dvb: clean up redundant break statements
Message-Id: <20190330152503.9923-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Aditya Pakki <pakki001@umn.edu>, Sean Young <sean@mess.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several places where a break statement occurs before
a following break statement; these are unnecessary and can be
removed to clean up the code a little.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/drxd_hard.c | 30 +++++--------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxd_hard.c b/drivers/media/dvb-frontends/drxd_hard.c
index 0a5b15bee1d7..c597d6fc3046 100644
--- a/drivers/media/dvb-frontends/drxd_hard.c
+++ b/drivers/media/dvb-frontends/drxd_hard.c
@@ -2263,61 +2263,41 @@ static int DRX_Start(struct drxd_state *state, s32 off)
 		case DRX_CHANNEL_LOW:
 			transmissionParams |= SC_RA_RAM_OP_PARAM_PRIO_LO;
 			status = Write16(state, EC_SB_REG_PRIOR__A, EC_SB_REG_PRIOR_LO, 0x0000);
-			if (status < 0)
-				break;
 			break;
 		case DRX_CHANNEL_HIGH:
 			transmissionParams |= SC_RA_RAM_OP_PARAM_PRIO_HI;
 			status = Write16(state, EC_SB_REG_PRIOR__A, EC_SB_REG_PRIOR_HI, 0x0000);
-			if (status < 0)
-				break;
 			break;
-
 		}
 
 		switch (p->code_rate_HP) {
 		case FEC_1_2:
 			transmissionParams |= SC_RA_RAM_OP_PARAM_RATE_1_2;
-			if (state->type_A) {
+			if (state->type_A)
 				status = Write16(state, EC_VD_REG_SET_CODERATE__A, EC_VD_REG_SET_CODERATE_C1_2, 0x0000);
-				if (status < 0)
-					break;
-			}
 			break;
 		default:
 			operationMode |= SC_RA_RAM_OP_AUTO_RATE__M;
 			/* fall through */
 		case FEC_2_3:
 			transmissionParams |= SC_RA_RAM_OP_PARAM_RATE_2_3;
-			if (state->type_A) {
+			if (state->type_A)
 				status = Write16(state, EC_VD_REG_SET_CODERATE__A, EC_VD_REG_SET_CODERATE_C2_3, 0x0000);
-				if (status < 0)
-					break;
-			}
 			break;
 		case FEC_3_4:
 			transmissionParams |= SC_RA_RAM_OP_PARAM_RATE_3_4;
-			if (state->type_A) {
+			if (state->type_A)
 				status = Write16(state, EC_VD_REG_SET_CODERATE__A, EC_VD_REG_SET_CODERATE_C3_4, 0x0000);
-				if (status < 0)
-					break;
-			}
 			break;
 		case FEC_5_6:
 			transmissionParams |= SC_RA_RAM_OP_PARAM_RATE_5_6;
-			if (state->type_A) {
+			if (state->type_A)
 				status = Write16(state, EC_VD_REG_SET_CODERATE__A, EC_VD_REG_SET_CODERATE_C5_6, 0x0000);
-				if (status < 0)
-					break;
-			}
 			break;
 		case FEC_7_8:
 			transmissionParams |= SC_RA_RAM_OP_PARAM_RATE_7_8;
-			if (state->type_A) {
+			if (state->type_A)
 				status = Write16(state, EC_VD_REG_SET_CODERATE__A, EC_VD_REG_SET_CODERATE_C7_8, 0x0000);
-				if (status < 0)
-					break;
-			}
 			break;
 		}
 		if (status < 0)
-- 
2.20.1
