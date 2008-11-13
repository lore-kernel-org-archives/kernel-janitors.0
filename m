From: Julia Lawall <julia@diku.dk>
Date: Thu, 13 Nov 2008 10:33:54 +0000
Subject: [PATCH] drivers/pcmcia/cistpl.c: introduce missing braces
Message-Id: <Pine.LNX.4.64.0811131133010.9563@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The indentation and behavior of the code below suggests that braces are
intended around the if branch.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,l;
position p1,p2;
expression *ptr != NULL;
@@

(
if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) = NULL) S
|
x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
)
<... when != x
     when != if (...) { <+...x...+> }
x->f = E
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
 drivers/pcmcia/cistpl.c       |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/pcmcia/cistpl.c b/drivers/pcmcia/cistpl.c
index dcce9f5..4a110b7 100644
--- a/drivers/pcmcia/cistpl.c
+++ b/drivers/pcmcia/cistpl.c
@@ -351,10 +351,11 @@ int verify_cis_cache(struct pcmcia_socket *s)
 	char *buf;
 
 	buf = kmalloc(256, GFP_KERNEL);
-	if (buf = NULL)
+	if (buf = NULL) {
 		dev_printk(KERN_WARNING, &s->dev,
 			   "no memory for verifying CIS\n");
 		return -ENOMEM;
+	}
 	list_for_each_entry(cis, &s->cis_cache, node) {
 		int len = cis->len;
 
