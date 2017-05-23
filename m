From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 20:53:19 +0000
Subject: [PATCH 3/5] MIPS: VPE: Delete an error message for a failed memory allocation in vpe_open()
Message-Id: <94b1e14f-47c0-7f13-6158-700488d63c66@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e866716c-5ce4-3658-f944-e310007db127@users.sourceforge.net>
In-Reply-To: <e866716c-5ce4-3658-f944-e310007db127@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Ingo Molnar <mingo@kernel.org>, James Hogan <james.hogan@imgtec.com>, Kees Cook <keescook@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 21:54:42 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/kernel/vpe.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/vpe.c b/arch/mips/kernel/vpe.c
index 544ea21bfef9..721b1523b740 100644
--- a/arch/mips/kernel/vpe.c
+++ b/arch/mips/kernel/vpe.c
@@ -799,7 +799,6 @@ static int vpe_open(struct inode *inode, struct file *filp)
-	if (!v->pbuffer) {
-		pr_warn("VPE loader: unable to allocate memory\n");
+	if (!v->pbuffer)
 		return -ENOMEM;
-	}
+
 	v->plen = P_SIZE;
 	v->load_addr = NULL;
 	v->len = 0;
-- 
2.13.0

