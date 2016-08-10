From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 10 Aug 2016 05:54:41 +0000
Subject: [PATCH] [media] drxd_hard: Add missing error code assignment before test
Message-Id: <1470808481-17534-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

It is likely that checking the result of the 2nd 'read16' is expected here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/dvb-frontends/drxk_hard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index b975da099929..c595adc61c6f 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -6448,7 +6448,7 @@ static int get_strength(struct drxk_state *state, u64 *strength)
 			return status;
 
 		/* SCU c.o.c. */
-		read16(state, SCU_RAM_AGC_RF_IACCU_HI_CO__A, &scu_coc);
+		status = read16(state, SCU_RAM_AGC_RF_IACCU_HI_CO__A, &scu_coc);
 		if (status < 0)
 			return status;
 
-- 
2.7.4


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

