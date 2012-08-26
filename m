From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 26 Aug 2012 08:18:34 +0000
Subject: [PATCH 1/2] tools/power/x86/turbostat/turbostat.c: delete double assignment
Message-Id: <1345969115-12977-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete successive assignments to the same location.
Change the second assignment to the corresponding size variable, analogous
to the code below.

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
 tools/power/x86/turbostat/turbostat.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/turbostat/turbostat.c b/tools/power/x86/turbostat/turbostat.c
index 861d771..fc9b2b0 100644
--- a/tools/power/x86/turbostat/turbostat.c
+++ b/tools/power/x86/turbostat/turbostat.c
@@ -719,7 +719,7 @@ void free_all_buffers(void)
 {
 	CPU_FREE(cpu_present_set);
 	cpu_present_set = NULL;
-	cpu_present_set = 0;
+	cpu_present_setsize = 0;
 
 	CPU_FREE(cpu_affinity_set);
 	cpu_affinity_set = NULL;

