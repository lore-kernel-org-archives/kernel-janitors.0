From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 09 Feb 2009 20:39:32 +0000
Subject: [PATCH] h8300: Storage class should be before const qualifier
Message-Id: <20090209203932.GA5992@xenon.distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/h8300/kernel/timer/tpu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/h8300/kernel/timer/tpu.c b/arch/h8300/kernel/timer/tpu.c
index df7f453..79ae1db 100644
--- a/arch/h8300/kernel/timer/tpu.c
+++ b/arch/h8300/kernel/timer/tpu.c
@@ -68,7 +68,7 @@ static struct irqaction tpu_irq = {
 	.mask		= CPU_MASK_NONE,
 };
 
-const static int __initdata divide_rate[] = {
+static const int __initdata divide_rate[] = {
 #if CONFIG_H8300_TPU_CH = 0
 	1,4,16,64,0,0,0,0,
 #elif (CONFIG_H8300_TPU_CH = 1) || (CONFIG_H8300_TPU_CH = 5)
-- 
1.5.6.5

