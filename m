From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Aug 2017 20:44:54 +0000
Subject: [PATCH] x86/microcode/intel: Silence a static checker warning
Message-Id: <20170822204454.mtpqqcgqibhmwfrm@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains that we could dereference a "p" when it's an error
pointer.  It's seems unlikely, but it's easy enough to make the checker
happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 59edbe9d4ccb..c9c46a138e0e 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -208,7 +208,7 @@ static void save_microcode_patch(void *data, unsigned int size)
 	 * address as the APs are running from physical addresses, before
 	 * paging has been enabled.
 	 */
-	if (p) {
+	if (!IS_ERR_OR_NULL(p)) {
 		if (IS_ENABLED(CONFIG_X86_32))
 			intel_ucode_patch = (struct microcode_intel *)__pa_nodebug(p->data);
 		else
