From: Julia Lawall <julia@diku.dk>
Date: Wed, 09 Dec 2009 19:22:49 +0000
Subject: [PATCH 2/12] arch/xtensa: Correct size given to memset
Message-Id: <Pine.LNX.4.64.0912092022260.1870@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Memset should be given the size of the structure, not the size of the pointer.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
T *x;
expression E;
@@

memset(x, E, sizeof(
+ *
 x))
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/xtensa/kernel/process.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/arch/xtensa/kernel/process.c b/arch/xtensa/kernel/process.c
--- a/arch/xtensa/kernel/process.c
+++ b/arch/xtensa/kernel/process.c
@@ -277,7 +277,7 @@ void xtensa_elf_core_copy_regs (xtensa_g
 
 	/* Don't leak any random bits. */
 
-	memset(elfregs, 0, sizeof (elfregs));
+	memset(elfregs, 0, sizeof(*elfregs));
 
 	/* Note:  PS.EXCM is not set while user task is running; its
 	 * being set in regs->ps is for exception handling convenience.
