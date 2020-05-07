From: Colin King <colin.king@canonical.com>
Date: Thu, 07 May 2020 22:00:40 +0000
Subject: [PATCH] media: dvb-frontends: remove redundant initialization of variable status
Message-Id: <20200507220040.66476-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable status is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/drxk_hard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 0a4875b391d9..7e8e5c308d1c 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -1093,7 +1093,7 @@ static int init_hi(struct drxk_state *state)
 
 static int mpegts_configure_pins(struct drxk_state *state, bool mpeg_enable)
 {
-	int status = -1;
+	int status;
 	u16 sio_pdr_mclk_cfg = 0;
 	u16 sio_pdr_mdx_cfg = 0;
 	u16 err_cfg = 0;
-- 
2.25.1
