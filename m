From: Colin King <colin.king@canonical.com>
Date: Wed, 06 Dec 2017 17:08:28 +0000
Subject: [PATCH] x86/platform/UV: make functions uv_handle_nmi and uv_nmi_setup_common static
Message-Id: <20171206170828.23524-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "maintainer:X86" <x86@kernel.org>, Mike Travis <mike.travis@hpe.com>, Russ Anderson <russ.anderson@hpe.com>, "travis @ sgi . com" <travis@sgi.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Functions uv_handle_nmi and uv_nmi_setup_common are local to the
source and do not need to be in global scope, so make them static.

Cleans up sparse warnings:
symbol 'uv_handle_nmi' was not declared. Should it be static?
symbol 'uv_nmi_setup_common' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/platform/uv/uv_nmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/uv/uv_nmi.c b/arch/x86/platform/uv/uv_nmi.c
index c34bd8233f7c..5f64f30873e2 100644
--- a/arch/x86/platform/uv/uv_nmi.c
+++ b/arch/x86/platform/uv/uv_nmi.c
@@ -905,7 +905,7 @@ static inline void uv_call_kgdb_kdb(int cpu, struct pt_regs *regs, int master)
 /*
  * UV NMI handler
  */
-int uv_handle_nmi(unsigned int reason, struct pt_regs *regs)
+static int uv_handle_nmi(unsigned int reason, struct pt_regs *regs)
 {
 	struct uv_hub_nmi_s *hub_nmi = uv_hub_nmi;
 	int cpu = smp_processor_id();
@@ -1013,7 +1013,7 @@ void uv_nmi_init(void)
 }
 
 /* Setup HUB NMI info */
-void __init uv_nmi_setup_common(bool hubbed)
+static void __init uv_nmi_setup_common(bool hubbed)
 {
 	int size = sizeof(void *) * (1 << NODES_SHIFT);
 	int cpu;
-- 
2.14.1

