From: Colin King <colin.king@canonical.com>
Date: Sat, 25 Apr 2020 11:22:05 +0000
Subject: [PATCH] media: stv0900_core: remove redundant assignment to variable val
Message-Id: <20200425112205.137518-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable val is being initializeed with a value that is never read
and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/stv0900_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stv0900_core.c b/drivers/media/dvb-frontends/stv0900_core.c
index 7d93a1617e86..212312d20ff6 100644
--- a/drivers/media/dvb-frontends/stv0900_core.c
+++ b/drivers/media/dvb-frontends/stv0900_core.c
@@ -193,7 +193,7 @@ void stv0900_write_bits(struct stv0900_internal *intp, u32 label, u8 val)
 
 u8 stv0900_get_bits(struct stv0900_internal *intp, u32 label)
 {
-	u8 val = 0xff;
+	u8 val;
 	u8 mask, pos;
 
 	extract_mask_pos(label, &mask, &pos);
-- 
2.25.1
