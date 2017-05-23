From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 20:55:04 +0000
Subject: [PATCH 5/5] MIPS: VPE: Adjust 13 checks for null pointers
Message-Id: <44ff74fa-07c9-3f9c-6cda-050296400c72@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e866716c-5ce4-3658-f944-e310007db127@users.sourceforge.net>
In-Reply-To: <e866716c-5ce4-3658-f944-e310007db127@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-mips@linux-mips.org, Ingo Molnar <mingo@kernel.org>, James Hogan <james.hogan@imgtec.com>, Kees Cook <keescook@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 22:16:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/kernel/vpe.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/arch/mips/kernel/vpe.c b/arch/mips/kernel/vpe.c
index ed019218496b..0ef7654e67e4 100644
--- a/arch/mips/kernel/vpe.c
+++ b/arch/mips/kernel/vpe.c
@@ -97,4 +97,4 @@ struct vpe *alloc_vpe(int minor)
-	if (v = NULL)
+	if (!v)
 		goto out;
 
 	INIT_LIST_HEAD(&v->tc);
@@ -118,4 +118,4 @@ struct tc *alloc_tc(int index)
-	if (tc = NULL)
+	if (!tc)
 		goto out;
 
 	INIT_LIST_HEAD(&tc->tc);
@@ -340,10 +340,9 @@ static int apply_r_mips_lo16(struct module *me, uint32_t *location,
 	/* Sign extend the addend we extract from the lo insn.	*/
 	vallo = ((insnlo & 0xffff) ^ 0x8000) - 0x8000;
 
-	if (mips_hi16_list != NULL) {
-
+	if (mips_hi16_list) {
 		l = mips_hi16_list;
-		while (l != NULL) {
+		while (l) {
 			unsigned long insn;
 
 			/*
@@ -391,7 +390,7 @@ static int apply_r_mips_lo16(struct module *me, uint32_t *location,
 	return 0;
 
 out_free:
-	while (l != NULL) {
+	while (l) {
 		next = l->next;
 		kfree(l);
 		l = next;
@@ -562,7 +561,7 @@ static int find_vpe_symbols(struct vpe *v, Elf_Shdr *sechdrs,
 			v->shared_ptr = (void *)sym[i].st_value;
 	}
 
-	if ((v->__start = 0) || (v->shared_ptr = NULL))
+	if ((v->__start = 0) || !v->shared_ptr)
 		return -1;
 
 	return 0;
@@ -737,7 +736,7 @@ static int vpe_elfload(struct vpe *v)
 			return -ENOEXEC;
 		}
 
-		if (v->shared_ptr = NULL)
+		if (!v->shared_ptr)
 			pr_warn("VPE loader: program does not contain vpe_shared symbol.\n"
 				" Unable to use AMVP (AP/SP) facilities.\n");
 	}
@@ -777,7 +776,7 @@ static int vpe_open(struct inode *inode, struct file *filp)
 	}
 
 	v = get_vpe(aprp_cpu_index());
-	if (v = NULL) {
+	if (!v) {
 		pr_warn("VPE loader: unable to get vpe\n");
 
 		return -ENODEV;
@@ -822,7 +821,7 @@ static int vpe_release(struct inode *inode, struct file *filp)
 	int ret = 0;
 
 	v = get_vpe(aprp_cpu_index());
-	if (v = NULL)
+	if (!v)
 		return -ENODEV;
 
 	hdr = (Elf_Ehdr *) v->pbuffer;
@@ -866,8 +865,7 @@ static ssize_t vpe_write(struct file *file, const char __user *buffer,
 		return -ENODEV;
 
 	v = get_vpe(aprp_cpu_index());
-
-	if (v = NULL)
+	if (!v)
 		return -ENODEV;
 
 	if ((count + v->len) > v->plen) {
@@ -895,7 +893,7 @@ void *vpe_get_shared(int index)
 {
 	struct vpe *v = get_vpe(index);
 
-	if (v = NULL)
+	if (!v)
 		return NULL;
 
 	return v->shared_ptr;
@@ -906,7 +904,7 @@ int vpe_notify(int index, struct vpe_notifications *notify)
 {
 	struct vpe *v = get_vpe(index);
 
-	if (v = NULL)
+	if (!v)
 		return -1;
 
 	list_add(&notify->list, &v->notify);
@@ -918,7 +916,7 @@ char *vpe_getcwd(int index)
 {
 	struct vpe *v = get_vpe(index);
 
-	if (v = NULL)
+	if (!v)
 		return NULL;
 
 	return v->cwd;
-- 
2.13.0

