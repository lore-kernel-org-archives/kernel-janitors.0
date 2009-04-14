From: Diego Liziero <diegoliz@gmail.com>
Date: Tue, 14 Apr 2009 01:52:54 +0000
Subject: [PATCH] drivers/isdn boolean negation and bitwise operation in wrong
Message-Id: <49E3EC76.70908@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



From: Diego Liziero <diegoliz@gmail.com>


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
--- ./drivers/isdn/hisax/diva.c	2009-04-13 01:21:26.000000000 +0200
+++ /tmp/cocci-output-25237-f6bb7c-diva.c	2009-04-13 20:36:42.000000000 +0200
@@ -382,7 +382,7 @@ MemwaitforXFW(struct IsdnCardState *cs, 
 {
 	int to = 50;
 
-	while ((!(MemReadHSCX(cs, hscx, HSCX_STAR) & 0x44) = 0x40) && to) {
+	while (((MemReadHSCX(cs, hscx, HSCX_STAR) & 0x44) != 0x40) && to) {
 		udelay(1);
 		to--;
 	}
