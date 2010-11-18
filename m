From: Vasiliy Kulikov <segoon@openwall.com>
Date: Thu, 18 Nov 2010 18:16:45 +0000
Subject: [PATCH 1/4] x86: platform: mrst: check platform_device_register() return code
Message-Id: <1290104207-31279-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Feng Tang <feng.tang@intel.com>, Alan Cox <alan@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-kernel@vger.kernel.org

platform_device_register() may fail, if so propagate the return
code from mrst_device_create().

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 I cannot compile this driver in next-20101117, so it is not tested at all.

 arch/x86/platform/mrst/vrtc.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/mrst/vrtc.c b/arch/x86/platform/mrst/vrtc.c
index 4d3f770..32cd7ed 100644
--- a/arch/x86/platform/mrst/vrtc.c
+++ b/arch/x86/platform/mrst/vrtc.c
@@ -159,8 +159,7 @@ static int __init mrst_device_create(void)
 	vrtc_resources[1].start = sfi_mrtc_array[0].irq;
 	vrtc_resources[1].end = sfi_mrtc_array[0].irq;
 
-	platform_device_register(&vrtc_device);
-	return 0;
+	return platform_device_register(&vrtc_device);
 }
 
 module_init(mrst_device_create);
-- 
1.7.0.4

