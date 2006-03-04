From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sat, 04 Mar 2006 19:09:47 +0000
Subject: [KJ] [Patch] kzalloc() conversion in arch/ia64
Message-Id: <1141499387.30193.18.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92517238203247398=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92517238203247398==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts arch/ia64 to kzalloc usage.
Not tested.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/ia64/kernel/perfmon.c.orig	2006-03-04 19:36:05.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/ia64/kernel/perfmon.c	2006-03-04 19:36:28.000000000 +0100
@@ -847,11 +847,9 @@ pfm_context_alloc(void)
 	 * allocate context descriptor 
 	 * must be able to free with interrupts disabled
 	 */
-	ctx = kmalloc(sizeof(pfm_context_t), GFP_KERNEL);
-	if (ctx) {
-		memset(ctx, 0, sizeof(pfm_context_t));
+	ctx = kzalloc(sizeof(pfm_context_t), GFP_KERNEL);
+	if (ctx)
 		DPRINT(("alloc ctx @%p\n", ctx));
-	}
 	return ctx;
 }
 
--- linux-2.6.16-rc5-mm1/arch/ia64/kernel/cpufreq/acpi-cpufreq.c.orig	2006-03-04 19:36:37.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/ia64/kernel/cpufreq/acpi-cpufreq.c	2006-03-04 19:36:47.000000000 +0100
@@ -280,12 +280,10 @@ acpi_cpufreq_cpu_init (
 
 	dprintk("acpi_cpufreq_cpu_init\n");
 
-	data = kmalloc(sizeof(struct cpufreq_acpi_io), GFP_KERNEL);
+	data = kzalloc(sizeof(struct cpufreq_acpi_io), GFP_KERNEL);
 	if (!data)
 		return (-ENOMEM);
 
-	memset(data, 0, sizeof(struct cpufreq_acpi_io));
-
 	acpi_io_data[cpu] = data;
 
 	result = acpi_processor_register_performance(&data->acpi_data, cpu);
--- linux-2.6.16-rc5-mm1/arch/ia64/hp/sim/simserial.c.orig	2006-03-04 19:37:02.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/ia64/hp/sim/simserial.c	2006-03-04 19:37:12.000000000 +0100
@@ -685,12 +685,11 @@ static int get_async_struct(int line, st
 		*ret_info = sstate->info;
 		return 0;
 	}
-	info = kmalloc(sizeof(struct async_struct), GFP_KERNEL);
+	info = kzalloc(sizeof(struct async_struct), GFP_KERNEL);
 	if (!info) {
 		sstate->count--;
 		return -ENOMEM;
 	}
-	memset(info, 0, sizeof(struct async_struct));
 	init_waitqueue_head(&info->open_wait);
 	init_waitqueue_head(&info->close_wait);
 	init_waitqueue_head(&info->delta_msr_wait);
--- linux-2.6.16-rc5-mm1/arch/ia64/hp/common/sba_iommu.c.orig	2006-03-04 19:37:21.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/ia64/hp/common/sba_iommu.c	2006-03-04 19:37:56.000000000 +0100
@@ -1673,15 +1673,13 @@ ioc_sac_init(struct ioc *ioc)
 	 * SAC (single address cycle) addressable, so allocate a
 	 * pseudo-device to enforce that.
 	 */
-	sac = kmalloc(sizeof(*sac), GFP_KERNEL);
+	sac = kzalloc(sizeof(*sac), GFP_KERNEL);
 	if (!sac)
 		panic(PFX "Couldn't allocate struct pci_dev");
-	memset(sac, 0, sizeof(*sac));
 
-	controller = kmalloc(sizeof(*controller), GFP_KERNEL);
+	controller = kzalloc(sizeof(*controller), GFP_KERNEL);
 	if (!controller)
 		panic(PFX "Couldn't allocate struct pci_controller");
-	memset(controller, 0, sizeof(*controller));
 
 	controller->iommu = ioc;
 	sac->sysdata = controller;
@@ -1738,12 +1736,10 @@ ioc_init(u64 hpa, void *handle)
 	struct ioc *ioc;
 	struct ioc_iommu *info;
 
-	ioc = kmalloc(sizeof(*ioc), GFP_KERNEL);
+	ioc = kzalloc(sizeof(*ioc), GFP_KERNEL);
 	if (!ioc)
 		return NULL;
 
-	memset(ioc, 0, sizeof(*ioc));
-
 	ioc->next = ioc_list;
 	ioc_list = ioc;
 
--- linux-2.6.16-rc5-mm1/arch/ia64/sn/kernel/xpc_channel.c.orig	2006-03-04 19:38:27.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/ia64/sn/kernel/xpc_channel.c	2006-03-04 19:39:19.000000000 +0100
@@ -93,13 +93,12 @@ xpc_setup_infrastructure(struct xpc_part
 	 * Allocate all of the channel structures as a contiguous chunk of
 	 * memory.
 	 */
-	part->channels = kmalloc(sizeof(struct xpc_channel) * XPC_NCHANNELS,
+	part->channels = kzalloc(sizeof(struct xpc_channel) * XPC_NCHANNELS,
 								GFP_KERNEL);
 	if (part->channels == NULL) {
 		dev_err(xpc_chan, "can't get memory for channels\n");
 		return xpcNoMemory;
 	}
-	memset(part->channels, 0, sizeof(struct xpc_channel) * XPC_NCHANNELS);
 
 	part->nchannels = XPC_NCHANNELS;
 
@@ -455,13 +454,12 @@ xpc_allocate_local_msgqueue(struct xpc_c
 		memset(ch->local_msgqueue, 0, nbytes);
 
 		nbytes = nentries * sizeof(struct xpc_notify);
-		ch->notify_queue = kmalloc(nbytes, GFP_KERNEL);
+		ch->notify_queue = kzalloc(nbytes, GFP_KERNEL);
 		if (ch->notify_queue == NULL) {
 			kfree(ch->local_msgqueue_base);
 			ch->local_msgqueue = NULL;
 			continue;
 		}
-		memset(ch->notify_queue, 0, nbytes);
 
 		spin_lock_irqsave(&ch->lock, irq_flags);
 		if (nentries < ch->local_nentries) {
--- linux-2.6.16-rc5-mm1/arch/ia64/pci/pci.c.orig	2006-03-04 19:40:09.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/ia64/pci/pci.c	2006-03-04 19:40:18.000000000 +0100
@@ -127,11 +127,10 @@ alloc_pci_controller (int seg)
 {
 	struct pci_controller *controller;
 
-	controller = kmalloc(sizeof(*controller), GFP_KERNEL);
+	controller = kzalloc(sizeof(*controller), GFP_KERNEL);
 	if (!controller)
 		return NULL;
 
-	memset(controller, 0, sizeof(*controller));
 	controller->segment = seg;
 	controller->node = -1;
 	return controller;



--===============92517238203247398==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92517238203247398==--
