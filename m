From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 07:20:12 +0000
Subject: [PATCH 2/6] [media] cx24116: Return directly after a failed kmalloc() in cx24116_writeregN()
Message-Id: <cf4109fe-9994-470a-88a1-c7a7a030f1e6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d01b4a11-6e93-bc40-72de-dab9ce7b997a@users.sourceforge.net>
In-Reply-To: <d01b4a11-6e93-bc40-72de-dab9ce7b997a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 07:55:49 +0200

* Return directly after a call of the function "kmalloc" failed
  at the beginning.

* Delete the jump target "error" which became unnecessary
  with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/cx24116.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/cx24116.c b/drivers/media/dvb-frontends/cx24116.c
index 96af4ffba0f9..69c156443b50 100644
--- a/drivers/media/dvb-frontends/cx24116.c
+++ b/drivers/media/dvb-frontends/cx24116.c
@@ -226,10 +226,8 @@ static int cx24116_writeregN(struct cx24116_state *state, int reg,
 	u8 *buf;
 
 	buf = kmalloc(len + 1, GFP_KERNEL);
-	if (buf = NULL) {
-		ret = -ENOMEM;
-		goto error;
-	}
+	if (!buf)
+		return -ENOMEM;
 
 	*(buf) = reg;
 	memcpy(buf + 1, data, len);
@@ -250,7 +248,6 @@ static int cx24116_writeregN(struct cx24116_state *state, int reg,
 		ret = -EREMOTEIO;
 	}
 
-error:
 	kfree(buf);
 
 	return ret;
-- 
2.14.1

