From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 07:19:18 +0000
Subject: [PATCH 1/6] [media] cx24116: Delete an error message for a failed memory allocation in cx24116_write
Message-Id: <c91b8364-f54f-294a-cf89-1fe09c0a4ea6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d01b4a11-6e93-bc40-72de-dab9ce7b997a@users.sourceforge.net>
In-Reply-To: <d01b4a11-6e93-bc40-72de-dab9ce7b997a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Aug 2017 22:56:29 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/cx24116.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cx24116.c b/drivers/media/dvb-frontends/cx24116.c
index e105532bfba8..96af4ffba0f9 100644
--- a/drivers/media/dvb-frontends/cx24116.c
+++ b/drivers/media/dvb-frontends/cx24116.c
@@ -227,7 +227,6 @@ static int cx24116_writeregN(struct cx24116_state *state, int reg,
 
 	buf = kmalloc(len + 1, GFP_KERNEL);
 	if (buf = NULL) {
-		printk("Unable to kmalloc\n");
 		ret = -ENOMEM;
 		goto error;
 	}
-- 
2.14.1

