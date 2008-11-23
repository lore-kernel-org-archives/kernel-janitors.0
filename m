From: "Hannes Eder" <hannes@hanneseder.net>
Date: Sun, 23 Nov 2008 19:19:33 +0000
Subject: [PATCH] x86: HPET: fix sparse warning
Message-Id: <154e089b0811231119s2c91de2md3144ff9ed2d73f7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix this sparse warning:

arch/x86/kernel/hpet.c:36:18: warning: symbol 'hpet_num_timers' was
not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 arch/x86/kernel/hpet.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 067d8de..15fcaac 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -33,7 +33,7 @@
  * HPET address is set in acpi/boot.c, when an ACPI entry exists
  */
 unsigned long				hpet_address;
-unsigned long				hpet_num_timers;
+static unsigned long			hpet_num_timers;
 static void __iomem			*hpet_virt_address;

 struct hpet_dev {
