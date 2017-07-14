From: Colin King <colin.king@canonical.com>
Date: Fri, 14 Jul 2017 11:13:16 +0000
Subject: [PATCH] perf/x86/intel/cqm: make variable mbm_socket_max static
Message-Id: <20170714111316.26021-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Fenghua Yu <fenghua.yu@intel.com>, Jiri Olsa <jolsa@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable mbm_socket_max does not need to be in global scope as
it is only used in this source, so make it static.

Cleans up sparse warning:
symbol 'mbm_socket_max' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/events/intel/cqm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/cqm.c b/arch/x86/events/intel/cqm.c
index 2521f771f2f5..b47d0768ec0d 100644
--- a/arch/x86/events/intel/cqm.c
+++ b/arch/x86/events/intel/cqm.c
@@ -22,7 +22,7 @@
 static u32 cqm_max_rmid = -1;
 static unsigned int cqm_l3_scale; /* supposedly cacheline size */
 static bool cqm_enabled, mbm_enabled;
-unsigned int mbm_socket_max;
+static unsigned int mbm_socket_max;
 
 /*
  * The cached intel_pqr_state is strictly per CPU and can never be
-- 
2.11.0

