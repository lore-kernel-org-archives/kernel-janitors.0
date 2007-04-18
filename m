From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Wed, 18 Apr 2007 16:59:00 +0000
Subject: [KJ] [PATCH]SPIN_LOCK_UNLOCKED cleanup in arch/m68k
Message-Id: <20070418165238.GA13918@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070411175434.GA9110@arun.site>
In-Reply-To: <20070411175434.GA9110@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@lists.osdl.org>, M68K <linux-m68k@vger.kernel.org>, M68K-Mac <linux-mac68k@mac.linux-m68k.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrw Morton <akpm@linux-foundation.org>, geert@linux-m68k.org, funaho@jurai.org

SPIN_LOCK_UNLOCKED cleanup,use __SPIN_LOCK_UNLOCKED instead 

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>
---

 amiga/amiints.c  |    2 +-
 amiga/cia.c      |    4 ++--
 apollo/dn_ints.c |    2 +-
 atari/ataints.c  |    2 +-
 kernel/ints.c    |    4 ++--
 mac/macints.c    |    2 +-
 q40/q40ints.c    |    2 +-
 sun3/sun3ints.c  |    2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)


diff --git a/arch/m68k/amiga/amiints.c b/arch/m68k/amiga/amiints.c
index 28d95cf..907a553 100644
--- a/arch/m68k/amiga/amiints.c
+++ b/arch/m68k/amiga/amiints.c
@@ -54,7 +54,7 @@ static irqreturn_t ami_int5(int irq, void *dev_id);
 
 static struct irq_controller amiga_irq_controller = {
 	.name		= "amiga",
-	.lock		= SPIN_LOCK_UNLOCKED,
+	.lock		= __SPIN_LOCK_UNLOCKED(amiga_irq_controller.lock),
 	.enable		= amiga_enable_irq,
 	.disable	= amiga_disable_irq,
 };
diff --git a/arch/m68k/amiga/cia.c b/arch/m68k/amiga/cia.c
index 7a20058..c4a4ffd 100644
--- a/arch/m68k/amiga/cia.c
+++ b/arch/m68k/amiga/cia.c
@@ -123,7 +123,7 @@ static void cia_disable_irq(unsigned int irq)
 
 static struct irq_controller cia_irq_controller = {
 	.name		= "cia",
-	.lock		= SPIN_LOCK_UNLOCKED,
+	.lock		= __SPIN_LOCK_UNLOCKED(cia_irq_controller.lock),
 	.enable		= cia_enable_irq,
 	.disable	= cia_disable_irq,
 };
@@ -160,7 +160,7 @@ static void auto_disable_irq(unsigned int irq)
 
 static struct irq_controller auto_irq_controller = {
 	.name		= "auto",
-	.lock		= SPIN_LOCK_UNLOCKED,
+	.lock		= __SPIN_LOCK_UNLOCKED(auto_irq_controller.lock),
 	.enable		= auto_enable_irq,
 	.disable	= auto_disable_irq,
 };
diff --git a/arch/m68k/apollo/dn_ints.c b/arch/m68k/apollo/dn_ints.c
index 4274af1..13bd41b 100644
--- a/arch/m68k/apollo/dn_ints.c
+++ b/arch/m68k/apollo/dn_ints.c
@@ -31,7 +31,7 @@ void apollo_irq_shutdown(unsigned int irq)
 
 static struct irq_controller apollo_irq_controller = {
 	.name           = "apollo",
-	.lock           = SPIN_LOCK_UNLOCKED,
+	.lock           = __SPIN_LOCK_UNLOCKED(apollo_irq_controller.lock),
 	.startup        = apollo_irq_startup,
 	.shutdown       = apollo_irq_shutdown,
 };
diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
index 7f81264..b85ca22 100644
--- a/arch/m68k/atari/ataints.c
+++ b/arch/m68k/atari/ataints.c
@@ -339,7 +339,7 @@ static void atari_shutdown_irq(unsigned int irq)
 
 static struct irq_controller atari_irq_controller = {
 	.name		= "atari",
-	.lock		= SPIN_LOCK_UNLOCKED,
+	.lock		= __SPIN_LOCK_UNLOCKED(atari_irq_controller.lock),
 	.startup	= atari_startup_irq,
 	.shutdown	= atari_shutdown_irq,
 	.enable		= atari_enable_irq,
diff --git a/arch/m68k/kernel/ints.c b/arch/m68k/kernel/ints.c
index b66c97c..60d4d75 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -59,14 +59,14 @@ static int m68k_first_user_vec;
 
 static struct irq_controller auto_irq_controller = {
 	.name		= "auto",
-	.lock		= SPIN_LOCK_UNLOCKED,
+	.lock		= __SPIN_LOCK_UNLOCKED(auto_irq_controller.lock),
 	.startup	= m68k_irq_startup,
 	.shutdown	= m68k_irq_shutdown,
 };
 
 static struct irq_controller user_irq_controller = {
 	.name		= "user",
-	.lock		= SPIN_LOCK_UNLOCKED,
+	.lock		= __SPIN_LOCK_UNLOCKED(user_irq_controller.lock),
 	.startup	= m68k_irq_startup,
 	.shutdown	= m68k_irq_shutdown,
 };
diff --git a/arch/m68k/mac/macints.c b/arch/m68k/mac/macints.c
index f6fcd75..0fc72d8 100644
--- a/arch/m68k/mac/macints.c
+++ b/arch/m68k/mac/macints.c
@@ -219,7 +219,7 @@ static void mac_disable_irq(unsigned int irq);
 
 static struct irq_controller mac_irq_controller = {
 	.name		= "mac",
-	.lock		= SPIN_LOCK_UNLOCKED,
+	.lock		= __SPIN_LOCK_UNLOCKED(mac_irq_controller.lock),
 	.enable		= mac_enable_irq,
 	.disable	= mac_disable_irq,
 };
diff --git a/arch/m68k/q40/q40ints.c b/arch/m68k/q40/q40ints.c
index 31cc07d..2fb25ae 100644
--- a/arch/m68k/q40/q40ints.c
+++ b/arch/m68k/q40/q40ints.c
@@ -59,7 +59,7 @@ static void q40_irq_shutdown(unsigned int irq)
 
 static struct irq_controller q40_irq_controller = {
 	.name		= "q40",
-	.lock		= SPIN_LOCK_UNLOCKED,
+	.lock		= __SPIN_LOCK_UNLOCKED(q40_irq_controller.lock),
 	.startup	= q40_irq_startup,
 	.shutdown	= q40_irq_shutdown,
 	.enable		= q40_enable_irq,
diff --git a/arch/m68k/sun3/sun3ints.c b/arch/m68k/sun3/sun3ints.c
index baf74e8..9a3621d 100644
--- a/arch/m68k/sun3/sun3ints.c
+++ b/arch/m68k/sun3/sun3ints.c
@@ -90,7 +90,7 @@ static void sun3_inthandle(unsigned int irq, struct pt_regs *fp)
 
 static struct irq_controller sun3_irq_controller = {
 	.name		= "sun3",
-	.lock		= SPIN_LOCK_UNLOCKED,
+	.lock		= __SPIN_LOCK_UNLOCKED(sun3_irq_controller.lock),
 	.startup	= m68k_irq_startup,
 	.shutdown	= m68k_irq_shutdown,
 	.enable		= sun3_enable_irq,

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
