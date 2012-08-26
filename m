From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 26 Aug 2012 16:15:51 +0000
Subject: [PATCH] drivers/media/dvb-frontends/rtl2830.c: correct double assignment
Message-Id: <1345997751-340-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, crope@iki.fi, awalls@md.metrocast.net

From: Julia Lawall <Julia.Lawall@lip6.fr>

The double assignment is meant to be a bit-or to combine two values.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/dvb-frontends/rtl2830.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/rtl2830.c b/drivers/media/dvb-frontends/rtl2830.c
index 8fa8b08..b6ab858 100644
--- a/drivers/media/dvb-frontends/rtl2830.c
+++ b/drivers/media/dvb-frontends/rtl2830.c
@@ -254,7 +254,7 @@ static int rtl2830_init(struct dvb_frontend *fe)
 		goto err;
 
 	buf[0] = tmp << 6;
-	buf[0] = (if_ctl >> 16) & 0x3f;
+	buf[0] |= (if_ctl >> 16) & 0x3f;
 	buf[1] = (if_ctl >>  8) & 0xff;
 	buf[2] = (if_ctl >>  0) & 0xff;
 

