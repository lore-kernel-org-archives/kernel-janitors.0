From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 27 Jul 2007 09:44:25 +0000
Subject: [PATCH 05/68] 0 -> NULL, for arch/cris
Message-Id: <200707270944.LAA17140@ifs.emn.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: starvik@axis.com, dev-etrax@axis.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


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
Cc: starvik@axis.com
Cc: dev-etrax@axis.com
Cc: akpm@linux-foundation.org
---

 fault.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/cris/mm/fault.c b/arch/cris/mm/fault.c
index 8672ab7..d5b1e3d 100644
--- a/arch/cris/mm/fault.c
+++ b/arch/cris/mm/fault.c
@@ -448,7 +448,7 @@ find_fixup_code(struct pt_regs *regs)
 {
 	const struct exception_table_entry *fixup;
 
-	if ((fixup = search_exception_tables(instruction_pointer(regs))) != 0) {
+	if ((fixup = search_exception_tables(instruction_pointer(regs))) != NULL) {
 		/* Adjust the instruction pointer in the stackframe. */
 		instruction_pointer(regs) = fixup->fixup;
 		arch_fixup(regs);

