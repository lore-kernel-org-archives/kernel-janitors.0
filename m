From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 Mar 2018 11:52:16 +0000
Subject: [PATCH] perf/x86/intel: Don't accidentally clear high bits in bdw_limit_period()
Message-Id: <20180317115216.GB4035@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We intended to clear the lowest 6 bits but because of a type bug we
clear the high 32 bits as well.  Andi says that periods are rarely more
than U32_MAX so this bug probably doesn't have a huge runtime impact.

Fixes: 294fe0f52a44 ("perf/x86/intel: Add INST_RETIRED.ALL workarounds")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 41c68d337e84..f23f52b9de8e 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3210,7 +3210,7 @@ static u64 bdw_limit_period(struct perf_event *event, u64 left)
 			X86_CONFIG(.event=0xc0, .umask=0x01)) {
 		if (left < 128)
 			left = 128;
-		left &= ~0x3fu;
+		left &= ~0x3fULL;
 	}
 	return left;
 }
