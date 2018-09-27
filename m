From: tip-bot for YueHaibing <tipbot@zytor.com>
Date: Thu, 27 Sep 2018 19:25:29 +0000
Subject: [tip:x86/hyperv] x86/hyperv: Remove unused include
Message-Id: <tip-5140a6f471137205687428b0b8f12f7187bffd18@git.kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537690822-97455-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537690822-97455-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-tip-commits@vger.kernel.org
Cc: yuehaibing@huawei.com, sthemmin@microsoft.com, linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, mikelley@microsoft.com, haiyangz@microsoft.com, kys@microsoft.com, mingo@kernel.org, tglx@linutronix.de, hpa@zytor.com

Commit-ID:  5140a6f471137205687428b0b8f12f7187bffd18
Gitweb:     https://git.kernel.org/tip/5140a6f471137205687428b0b8f12f7187bffd18
Author:     YueHaibing <yuehaibing@huawei.com>
AuthorDate: Sun, 23 Sep 2018 08:20:22 +0000
Committer:  Thomas Gleixner <tglx@linutronix.de>
CommitDate: Thu, 27 Sep 2018 21:21:00 +0200

x86/hyperv: Remove unused include

Remove including <linux/version.h>. It's not needed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Michael Kelley <mikelley@microsoft.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: <devel@linuxdriverproject.org>
Cc: <kernel-janitors@vger.kernel.org>
Link: https://lkml.kernel.org/r/1537690822-97455-1-git-send-email-yuehaibing@huawei.com

---
 arch/x86/hyperv/hv_apic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/hyperv/hv_apic.c b/arch/x86/hyperv/hv_apic.c
index 2c43e3055948..8eb6fbee8e13 100644
--- a/arch/x86/hyperv/hv_apic.c
+++ b/arch/x86/hyperv/hv_apic.c
@@ -20,7 +20,6 @@
  */
 
 #include <linux/types.h>
-#include <linux/version.h>
 #include <linux/vmalloc.h>
 #include <linux/mm.h>
 #include <linux/clockchips.h>
