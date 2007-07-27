From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 27 Jul 2007 09:45:38 +0000
Subject: [PATCH 15/68] 0 -> NULL, for arch/sh64
Message-Id: <200707270945.LAA17342@ifs.emn.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: lethal@linux-sh.org, linuxsh-shmedia-dev@lists.sourceforge.net, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


When comparing a pointer, it's clearer to compare it to NULL than to 0.

Here is an excerpt of the semantic patch: 

@@
expression *E;
@@

  E =
- 0
+ NULL

@@
expression *E;
@@

  E !- 0
+ NULL

Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
Cc: lethal@linux-sh.org
Cc: linuxsh-shmedia-dev@lists.sourceforge.net
Cc: akpm@linux-foundation.org
---

 ioremap.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh64/mm/ioremap.c b/arch/sh64/mm/ioremap.c
index 9908577..b335849 100644
--- a/arch/sh64/mm/ioremap.c
+++ b/arch/sh64/mm/ioremap.c
@@ -167,7 +167,7 @@ static unsigned long shmedia_alloc_io(un
 
         if (name = NULL) name = "???";
 
-        if ((xres = xres_alloc()) != 0) {
+        if ((xres = xres_alloc()) != NULL) {
                 tack = xres->xname;
                 res = &xres->xres;
         } else {
@@ -364,7 +364,7 @@ ioremap_proc_info(char *buf, char **star
 	for (r = ((struct resource *)data)->child; r != NULL; r = r->sibling) {
 		if (p + 32 >= e)        /* Better than nothing */
 			break;
-		if ((nm = r->name) = 0) nm = "???";
+		if ((nm = r->name) = NULL) nm = "???";
 		p += sprintf(p, "%08lx-%08lx: %s\n",
 			     (unsigned long)r->start,
 			     (unsigned long)r->end, nm);

