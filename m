From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 12 Oct 2018 10:40:22 +0000
Subject: [PATCH -next] x86/cpu: Drop pointless static qualifier in punit_dev_state_show()
Message-Id: <1539340822-117563-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: YueHaibing <yuehaibing@huawei.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to have the 'struct dentry *dev_state' variable static
since new value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/x86/platform/atom/punit_atom_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/atom/punit_atom_debug.c b/arch/x86/platform/atom/punit_atom_debug.c
index 41dae0f..6cb6076 100644
--- a/arch/x86/platform/atom/punit_atom_debug.c
+++ b/arch/x86/platform/atom/punit_atom_debug.c
@@ -115,7 +115,7 @@ static int punit_dev_state_show(struct seq_file *seq_file, void *unused)
 
 static int punit_dbgfs_register(struct punit_device *punit_device)
 {
-	static struct dentry *dev_state;
+	struct dentry *dev_state;
 
 	punit_dbg_file = debugfs_create_dir("punit_atom", NULL);
 	if (!punit_dbg_file)
