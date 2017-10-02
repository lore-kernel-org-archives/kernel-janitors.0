From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Oct 2017 14:59:31 +0000
Subject: [PATCH] x86/intel_rdt/cqm: make integer rmid_limbo_count static
Message-Id: <20171002145931.27479-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The unsigned int rmid_limbo_count is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'rmid_limbo_count' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/cpu/intel_rdt_monitor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/intel_rdt_monitor.c b/arch/x86/kernel/cpu/intel_rdt_monitor.c
index 30827510094b..681450eee428 100644
--- a/arch/x86/kernel/cpu/intel_rdt_monitor.c
+++ b/arch/x86/kernel/cpu/intel_rdt_monitor.c
@@ -51,7 +51,7 @@ static LIST_HEAD(rmid_free_lru);
  *     may have a occupancy value > intel_cqm_threshold. User can change
  *     the threshold occupancy value.
  */
-unsigned int rmid_limbo_count;
+static unsigned int rmid_limbo_count;
 
 /**
  * @rmid_entry - The entry in the limbo and free lists.
-- 
2.14.1

