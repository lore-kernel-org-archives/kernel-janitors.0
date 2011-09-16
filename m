From: Julia Lawall <julia@diku.dk>
Date: Fri, 16 Sep 2011 06:57:35 +0000
Subject: [PATCH 4/4] arch/xtensa/kernel/process.c: take size of pointed value, not pointer
Message-Id: <1316156255-19509-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Zankel <chris@zankel.net>
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Eric Dumazet <eric.dumazet@gmail.com>, Mike Frysinger <vapier@gentoo.org>, Arun Sharma <asharma@fb.com>, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Sizeof a pointer-typed expression returns the size of the pointer, not that
of the pointed data.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *e;
type T;
identifier f;
@@

f(...,(T)e,...,
-sizeof(e)
+sizeof(*e)
,...)
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

