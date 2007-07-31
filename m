From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 18:09:36 +0000
Subject: [PATCH 37] arch/i386/kernel/io_apic.c: kmalloc + memset conversion to k[cz]alloc
Message-Id: <200707312009.36316.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, mingo@redhat.com

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 arch/i386/kernel/io_apic.c | 70761 -> 70562 (-199 bytes)
 arch/i386/kernel/io_apic.o | 197654 -> 197030 (-624 bytes)

 arch/i386/kernel/io_apic.c |   13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

--- linux-2.6.23-rc1-mm1-a/arch/i386/kernel/io_apic.c	2007-07-26 13:07:46.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/arch/i386/kernel/io_apic.c	2007-07-31 12:53:55.000000000 +0200
@@ -690,14 +690,12 @@ static int __init balanced_irq_init(void
 		physical_balance = 1;

 	for_each_online_cpu(i) {
-		irq_cpu_data[i].irq_delta = kmalloc(sizeof(unsigned long) * NR_IRQS, GFP_KERNEL);
-		irq_cpu_data[i].last_irq = kmalloc(sizeof(unsigned long) * NR_IRQS, GFP_KERNEL);
-		if (irq_cpu_data[i].irq_delta = NULL || irq_cpu_data[i].last_irq = NULL) {
+		irq_cpu_data[i].irq_delta = kcalloc(NR_IRQS, sizeof(unsigned long), GFP_KERNEL);
+		irq_cpu_data[i].last_irq = kcalloc(NR_IRQS, sizeof(unsigned long), GFP_KERNEL);
+		if (!irq_cpu_data[i].irq_delta || !irq_cpu_data[i].last_irq) {
 			printk(KERN_ERR "balanced_irq_init: out of memory");
 			goto failed;
 		}
-		memset(irq_cpu_data[i].irq_delta,0,sizeof(unsigned long) * NR_IRQS);
-		memset(irq_cpu_data[i].last_irq,0,sizeof(unsigned long) * NR_IRQS);
 	}

 	printk(KERN_INFO "Starting balanced_irq\n");
@@ -2398,7 +2396,7 @@ static struct sysdev_class ioapic_sysdev
 static int __init ioapic_init_sysfs(void)
 {
 	struct sys_device * dev;
-	int i, size, error = 0;
+	int i, size, error;

 	error = sysdev_class_register(&ioapic_sysdev_class);
 	if (error)
@@ -2407,12 +2405,11 @@ static int __init ioapic_init_sysfs(void
 	for (i = 0; i < nr_ioapics; i++ ) {
 		size = sizeof(struct sys_device) + nr_ioapic_registers[i]
 			* sizeof(struct IO_APIC_route_entry);
-		mp_ioapic_data[i] = kmalloc(size, GFP_KERNEL);
+		mp_ioapic_data[i] = kzalloc(size, GFP_KERNEL);
 		if (!mp_ioapic_data[i]) {
 			printk(KERN_ERR "Can't suspend/resume IOAPIC %d\n", i);
 			continue;
 		}
-		memset(mp_ioapic_data[i], 0, size);
 		dev = &mp_ioapic_data[i]->dev;
 		dev->id = i;
 		dev->cls = &ioapic_sysdev_class;
