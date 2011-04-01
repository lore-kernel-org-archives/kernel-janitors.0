From: Julia Lawall <julia@diku.dk>
Date: Fri, 01 Apr 2011 14:23:43 +0000
Subject: [PATCH 2/6] drivers/crypto/caam/caamalg.c: introduce missing kfree
Message-Id: <1301667827-20056-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Kim Phillips <kim.phillips@freescale.com>, Steve Cornelius <sec@pobox.com>, Dan Carpenter <error27@gmail.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

Error handling code following a kmalloc should free the allocated data.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,f1,l;
position p1,p2;
expression *ptr != NULL;
@@

x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
<... when != x
     when != if (...) { <+...x...+> }
(
x->f1 = E
|
 (x->f1 = NULL || ...)
|
 f(...,x->f1,...)
)
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/crypto/caam/caamalg.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/caam/caamalg.c b/drivers/crypto/caam/caamalg.c
index dce44b2..20e1215 100644
--- a/drivers/crypto/caam/caamalg.c
+++ b/drivers/crypto/caam/caamalg.c
@@ -1120,6 +1120,7 @@ static int __init caam_algapi_init(void)
 	if (err < 0 && i = 0) {
 		dev_err(ctrldev, "algapi error in job ring registration: %d\n",
 			err);
+		kfree(jrdev);
 		return err;
 	}
 

