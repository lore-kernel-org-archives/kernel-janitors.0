From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 27 Jul 2007 09:45:05 +0000
Subject: [PATCH 11/68] 0 -> NULL, for arch/parisc
Message-Id: <200707270945.LAA17250@ifs.emn.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: matthew@wil.cx, grundler@parisc-linux.org, kyle@parisc-linux.org, parisc-linux@parisc-linux.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


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
Cc: matthew@wil.cx
Cc: grundler@parisc-linux.org
Cc: kyle@parisc-linux.org
Cc: parisc-linux@parisc-linux.org
Cc: akpm@linux-foundation.org
---

 smp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 04c7e1d..16fccbe 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -333,7 +333,7 @@ smp_call_function (void (*func) (void *i
 
 	if (retry) {
 		spin_lock (&lock);
-		while (smp_call_function_data != 0)
+		while (smp_call_function_data != NULL)
 			barrier();
 	}
 	else {

