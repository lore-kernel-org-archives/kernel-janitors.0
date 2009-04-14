From: Diego Liziero <diegoliz@gmail.com>
Date: Tue, 14 Apr 2009 02:14:10 +0000
Subject: [PATCH 2/2] drivers/isdn boolean negation and bitwise operation in
Message-Id: <49E3F172.7090800@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From: Diego Liziero <diegoliz@gmail.com>

(Sorry, I forgot to put [1/2] in the previous mail subject)

The semantic patch that makes this change is:
(http://www.emn.fr/x-info/coccinelle/)

@@ expression E; constant C; @@
(
- !E = C
+ E != C
)

Signed-off-by: Diego Liziero <diegoliz@gmail.com>

---
diff = 
--- ./drivers/isdn/hisax/hscx_irq.c	2009-04-13 01:21:26.000000000 +0200
+++ /tmp/cocci-output-25310-4eeefc-hscx_irq.c	2009-04-13 20:36:49.000000000 +0200
@@ -32,7 +32,7 @@ waitforXFW(struct IsdnCardState *cs, int
 {
 	int to = 50;
 
-	while ((!(READHSCX(cs, hscx, HSCX_STAR) & 0x44) = 0x40) && to) {
+	while (((READHSCX(cs, hscx, HSCX_STAR) & 0x44) != 0x40) && to) {
 		udelay(1);
 		to--;
 	}
