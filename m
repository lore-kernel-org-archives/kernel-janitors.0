From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 07 Mar 2006 20:36:38 +0000
Subject: [KJ] [Patch] kzalloc() conversion in arch/x86_64
Message-Id: <1141763798.8321.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5165658829588109=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141499387.30193.18.camel@alice>
In-Reply-To: <1141499387.30193.18.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============5165658829588109==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this patch converts arch/x86_64 to kzalloc usage.
Crosscompile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/x86_64/kernel/mce_amd.c.orig	2006-03-07 12:31:44.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/x86_64/kernel/mce_amd.c	2006-03-07 12:31:54.000000000 +0100
@@ -342,12 +342,11 @@ static __cpuinit int threshold_create_ba
 	}
 #endif
 
-	b = kmalloc(sizeof(struct threshold_bank), GFP_KERNEL);
+	b = kzalloc(sizeof(struct threshold_bank), GFP_KERNEL);
 	if (!b) {
 		err = -ENOMEM;
 		goto out;
 	}
-	memset(b, 0, sizeof(struct threshold_bank));
 
 	b->cpu = cpu;
 	b->bank = bank;
--- linux-2.6.16-rc5-mm1/arch/x86_64/kernel/io_apic.c.orig	2006-03-07 12:32:03.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/x86_64/kernel/io_apic.c	2006-03-07 12:32:35.000000000 +0100
@@ -2006,12 +2006,11 @@ static int __init ioapic_init_sysfs(void
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



--===============5165658829588109==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5165658829588109==--
