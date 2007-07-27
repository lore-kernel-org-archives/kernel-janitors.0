From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 27 Jul 2007 09:45:56 +0000
Subject: [PATCH 18/68] 0 -> NULL, for arch/um
Message-Id: <200707270945.LAA17372@ifs.emn.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: jdike@karaya.com, user-mode-linux-devel@lists.sourceforge.net, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


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
Cc: jdike@karaya.com
Cc: user-mode-linux-devel@lists.sourceforge.net
Cc: akpm@linux-foundation.org
---

 sys-i386/fault.c   |    2 +-
 sys-x86_64/fault.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/um/sys-i386/fault.c b/arch/um/sys-i386/fault.c
index 745b4fd..8004023 100644
--- a/arch/um/sys-i386/fault.c
+++ b/arch/um/sys-i386/fault.c
@@ -20,7 +20,7 @@ int arch_fixup(unsigned long address, un
 	const struct exception_table_entry *fixup;
 
 	fixup = search_exception_tables(address);
-	if(fixup != 0){
+	if(fixup != NULL){
 		UPT_IP(regs) = fixup->fixup;
 		return(1);
 	}
diff --git a/arch/um/sys-x86_64/fault.c b/arch/um/sys-x86_64/fault.c
index 4636b14..67d4a19 100644
--- a/arch/um/sys-x86_64/fault.c
+++ b/arch/um/sys-x86_64/fault.c
@@ -19,7 +19,7 @@ int arch_fixup(unsigned long address, un
 	const struct exception_table_entry *fixup;
 
 	fixup = search_exception_tables(address);
-	if(fixup != 0){
+	if(fixup != NULL){
 		UPT_IP(regs) = fixup->fixup;
 		return(1);
 	}

