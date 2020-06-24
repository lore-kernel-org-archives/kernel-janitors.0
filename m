From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jun 2020 13:19:21 +0000
Subject: [PATCH] intel_idle: Fix uninitialized variable bug
Message-Id: <20200624131921.GB9972@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacob Pan <jacob.jun.pan@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Kees Cook <keescook@chromium.org>

The "tick" variable isn't initialized if "lapic_timer_always_reliable"
is true.

Fixes: 40ab82e08d78 ("intel_idle: Simplify LAPIC timer reliability checks")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/idle/intel_idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
index aae53e650638..6c9152f303a6 100644
--- a/drivers/idle/intel_idle.c
+++ b/drivers/idle/intel_idle.c
@@ -132,7 +132,7 @@ static __cpuidle int intel_idle(struct cpuidle_device *dev,
 	struct cpuidle_state *state = &drv->states[index];
 	unsigned long eax = flg2MWAIT(state->flags);
 	unsigned long ecx = 1; /* break on interrupt flag */
-	bool tick;
+	bool tick = false;
 	int cpu = smp_processor_id();
 
 	/*
-- 
2.27.0
