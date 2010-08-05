From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:18:18 +0000
Subject: [PATCH 5/42] arch/s390/kernel: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052218010.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux390@de.ibm.com, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Indent the branch of an if.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/s390/kernel/kprobes.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kernel/kprobes.c b/arch/s390/kernel/kprobes.c
index 2a3d2bf..5a7fccf 100644
--- a/arch/s390/kernel/kprobes.c
+++ b/arch/s390/kernel/kprobes.c
@@ -140,7 +140,7 @@ void __kprobes get_instruction_type(struct arch_specific_insn *ainsn)
 	case 0xc0:
 		if ((*ainsn->insn & 0x0f) = 0x00  /* larl  */
 			|| (*ainsn->insn & 0x0f) = 0x05) /* brasl */
-		ainsn->fixup |= FIXUP_RETURN_REGISTER;
+			ainsn->fixup |= FIXUP_RETURN_REGISTER;
 		break;
 	case 0xeb:
 		if (*(((__u8 *) ainsn->insn) + 5 ) = 0x44 ||	/* bxhg  */
