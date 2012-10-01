From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Date: Mon, 01 Oct 2012 13:22:25 +0000
Subject: Re: [tip:sched/numa 20/35] mm/mempolicy.c:2426 mpol_parse_str() error: buffer overflow 'policy_modes
Message-Id: <1349097745.7780.13.camel@twins>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2012-09-28 at 19:14 +0800, Fengguang Wu wrote:
> + mm/mempolicy.c:2426 mpol_parse_str() error: buffer overflow 'policy_modes' 5 <= 5


---
Subject: mm, mpol: Fix buffer overflow in mpol_parse_str()
From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Date: Mon Oct 01 15:12:16 CEST 2012

Wu reported a smatch error:

+ mm/mempolicy.c:2426 mpol_parse_str() error: buffer overflow 'policy_modes' 5 <= 5

Fix it by growing the array to the right size, but avoid it being a
valid string for mpol_parse_str() because its not an effective policy.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
---
 mm/mempolicy.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2514,7 +2514,8 @@ static const char * const policy_modes[]
 	[MPOL_PREFERRED]  = "prefer",
 	[MPOL_BIND]       = "bind",
 	[MPOL_INTERLEAVE] = "interleave",
-	[MPOL_LOCAL]      = "local"
+	[MPOL_LOCAL]      = "local",
+	[MPOL_NOOP]	  = "noop",	/* should not actually be used */
 };
 
 
@@ -2565,7 +2566,7 @@ int mpol_parse_str(char *str, struct mem
 			break;
 		}
 	}
-	if (mode >= MPOL_MAX)
+	if (mode >= MPOL_MAX || mode = MPOL_NOOP)
 		goto out;
 
 	switch (mode) {

