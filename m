From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 20:54:18 +0000
Subject: [PATCH 4/5] MIPS: VPE: Improve a size determination in two functions
Message-Id: <cf85a732-6901-4eca-2848-71e35e7ce95d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e866716c-5ce4-3658-f944-e310007db127@users.sourceforge.net>
In-Reply-To: <e866716c-5ce4-3658-f944-e310007db127@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Ingo Molnar <mingo@kernel.org>, James Hogan <james.hogan@imgtec.com>, Kees Cook <keescook@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 22:04:17 +0200

Replace the specification of two data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/kernel/vpe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/vpe.c b/arch/mips/kernel/vpe.c
index 721b1523b740..ed019218496b 100644
--- a/arch/mips/kernel/vpe.c
+++ b/arch/mips/kernel/vpe.c
@@ -93,7 +93,7 @@ struct vpe *alloc_vpe(int minor)
 {
 	struct vpe *v;
 
-	v = kzalloc(sizeof(struct vpe), GFP_KERNEL);
+	v = kzalloc(sizeof(*v), GFP_KERNEL);
 	if (v = NULL)
 		goto out;
 
@@ -114,7 +114,7 @@ struct tc *alloc_tc(int index)
 {
 	struct tc *tc;
 
-	tc = kzalloc(sizeof(struct tc), GFP_KERNEL);
+	tc = kzalloc(sizeof(*tc), GFP_KERNEL);
 	if (tc = NULL)
 		goto out;
 
-- 
2.13.0

