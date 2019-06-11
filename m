From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Jun 2019 15:38:12 +0000
Subject: [PATCH][next] media: stv090x: fix double free on state object
Message-Id: <20190611153812.4789-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There two callers of stv090x_setup_compound manage the allocation and
freeing if state there is an error condition from stv090x_setup_compound.
Currently function stv090x_setup_compound also frees the state object
too, leading to a double free in the callers of this function.  Fix
this by removing the extraneous free in stv090x_setup_compound and just
leave the callers handle the allocation/free'ing.

Addresses-Coverity: ("Double free")
Fixes: eb5005df886b ("media: stv090x: Implement probe/remove for stv090x")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/stv090x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-frontends/stv090x.c
index 986e585e0103..90d24131d335 100644
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -4942,7 +4942,6 @@ static int stv090x_setup_compound(struct stv090x_state *state)
 	return 0;
 
 error:
-	kfree(state);
 	return -ENOMEM;
 err_remove:
 	remove_dev(state->internal);
-- 
2.20.1
