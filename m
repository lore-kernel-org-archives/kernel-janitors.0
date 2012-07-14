From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Jul 2012 16:43:08 +0000
Subject: [PATCH 6/6] arch/x86/kernel/kdebugfs.c: ensure a consistent return value in error case
Message-Id: <1342284188-19176-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1342284188-19176-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1342284188-19176-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Typically, the return value desired for the failure of a function with an
integer return value is a negative integer.  In these cases, the return
value is sometimes a negative integer and sometimes 0, due to a subsequent
initialization of the return variable within the loop.

A simplified version of the semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

//<smpl>
@r exists@
identifier ret;
position p;
constant C;
expression e1,e3,e4;
statement S;
@@

ret = -C
... when != ret = e3
    when any
if@p (...) S
... when any
if (\(ret != 0\|ret < 0\|ret > 0\) || ...) { ... return ...; }
... when != ret = e3
    when any
*if@p (...)
{
  ... when != ret = e4
  return ret;
}
//</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/x86/kernel/kdebugfs.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kdebugfs.c b/arch/x86/kernel/kdebugfs.c
index 1d5d31e..dc1404b 100644
--- a/arch/x86/kernel/kdebugfs.c
+++ b/arch/x86/kernel/kdebugfs.c
@@ -107,7 +107,7 @@ static int __init create_setup_data_nodes(struct dentry *parent)
 {
 	struct setup_data_node *node;
 	struct setup_data *data;
-	int error = -ENOMEM;
+	int error;
 	struct dentry *d;
 	struct page *pg;
 	u64 pa_data;
@@ -121,8 +121,10 @@ static int __init create_setup_data_nodes(struct dentry *parent)
 
 	while (pa_data) {
 		node = kmalloc(sizeof(*node), GFP_KERNEL);
-		if (!node)
+		if (!node) {
+			error = -ENOMEM;
 			goto err_dir;
+		}
 
 		pg = pfn_to_page((pa_data+sizeof(*data)-1) >> PAGE_SHIFT);
 		if (PageHighMem(pg)) {

