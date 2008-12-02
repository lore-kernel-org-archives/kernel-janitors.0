From: Nicolas Palix <npalix@diku.dk>
Date: Tue, 02 Dec 2008 13:50:49 +0000
Subject: [PATCH linux-next] framebuffer: Add missing of_node_put in drivers/video/valkyriefb.c
Message-Id: <200812021450.49276.npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>, Nicolas Palix <npalix@diku.dk>


of_node_put is needed before discarding a value received from
of_find_node_by_name, eg in error handling code or when the device
node is no longer used.

The semantic match that catches the bug is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression struct device_node *n;
position p1, p2;
statement S1,S2;
expression E,E1;
expression *ptr != NULL;
@@

(
if (!(n@p1 = of_find_node_by_name(...))) S1
|
n@p1 = of_find_node_by_name(...)
)
<... when != of_node_put(n)
    when != if (...) { <+... of_node_put(n) ...+> }
    when != true !n  || ...
    when != n = E
    when != E = n
if (!n || ...) S2
...>
(
  return \(0\|<+...n...+>\|ptr\);
|
return@p2 ...;
|
n = E1
|
E1 = n
)
@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s of_find_node_by_name %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Nicolas Palix <npalix@diku.dk>
Signed-off-by: Julia Lawall <julia@diku.dk>
---
 drivers/video/valkyriefb.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/video/valkyriefb.c b/drivers/video/valkyriefb.c
index 7b0cef9..62fba43 100644
--- a/drivers/video/valkyriefb.c
+++ b/drivers/video/valkyriefb.c
@@ -346,10 +346,12 @@ int __init valkyriefb_init(void)
 			return 0;
 
 		if (of_address_to_resource(dp, 0, &r)) {
+			of_node_put(dp);
 			printk(KERN_ERR "can't find address for valkyrie\n");
 			return 0;
 		}
 
+		of_node_put(dp);
 		frame_buffer_phys = r.start;
 		cmap_regs_phys = r.start + 0x304000;
 		flags = _PAGE_WRITETHRU;
-- 
Nicolas Palix
