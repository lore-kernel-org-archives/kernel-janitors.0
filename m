From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Oct 2017 10:19:42 +0000
Subject: [PATCH] [media] pt3: remove redundant assignment to mask
Message-Id: <20171031101942.19923-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable mask is being set to 0x80 and then set to this value again
in the following for-loop. Remove the extraneous first setting of mask.
Cleans up clang warning:

drivers/media/pci/pt3/pt3_i2c.c:88:2: warning: Value stored to 'mask'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/pt3/pt3_i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/pt3/pt3_i2c.c b/drivers/media/pci/pt3/pt3_i2c.c
index ec6a8a2e4744..b66138c7b364 100644
--- a/drivers/media/pci/pt3/pt3_i2c.c
+++ b/drivers/media/pci/pt3/pt3_i2c.c
@@ -85,7 +85,6 @@ static void put_byte_write(struct pt3_i2cbuf *cbuf, u8 val)
 {
 	u8 mask;
 
-	mask = 0x80;
 	for (mask = 0x80; mask > 0; mask >>= 1)
 		cmdbuf_add(cbuf, (val & mask) ? I_DATA_H_NOP : I_DATA_L_NOP);
 	cmdbuf_add(cbuf, I_DATA_H_ACK0);
-- 
2.14.1

