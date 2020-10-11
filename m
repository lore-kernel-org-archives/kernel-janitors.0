From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 11 Oct 2020 10:34:57 +0000
Subject: [PATCH 4/5] net/ipv6: use semicolons rather than commas to separate statements
Message-Id: <1602412498-32025-5-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Moore <paul@paul-moore.com>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 net/ipv6/calipso.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/calipso.c b/net/ipv6/calipso.c
index 8d3f66c310db..78f766019b7e 100644
--- a/net/ipv6/calipso.c
+++ b/net/ipv6/calipso.c
@@ -761,7 +761,7 @@ static int calipso_genopt(unsigned char *buf, u32 start, u32 buf_len,
 	calipso[1] = len - 2;
 	*(__be32 *)(calipso + 2) = htonl(doi_def->doi);
 	calipso[6] = (len - CALIPSO_HDR_LEN) / 4;
-	calipso[7] = secattr->attr.mls.lvl,
+	calipso[7] = secattr->attr.mls.lvl;
 	crc = ~crc_ccitt(0xffff, calipso, len);
 	calipso[8] = crc & 0xff;
 	calipso[9] = (crc >> 8) & 0xff;
