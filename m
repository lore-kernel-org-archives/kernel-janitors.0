From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 02 Mar 2006 11:58:58 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/serial
Message-Id: <1141300738.8380.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24255937179909437=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============24255937179909437==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/serial to kzalloc usage.
Compile tested with allyes config.

ip22zilog.c and sunzilog.c contained their own kzalloc() variant
alloc_one_table() which i removed, and replaced the callers with kzalloc()

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/serial/ioc4_serial.c.orig	2006-03-02 10:00:24.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/serial/ioc4_serial.c	2006-03-02 10:01:03.000000000 +0100
@@ -1034,13 +1034,12 @@ static int inline ioc4_attach_local(stru
 	/* Create port structures for each port */
 	for (port_number = 0; port_number < IOC4_NUM_SERIAL_PORTS;
 							port_number++) {
-		port = kmalloc(sizeof(struct ioc4_port), GFP_KERNEL);
+		port = kzalloc(sizeof(struct ioc4_port), GFP_KERNEL);
 		if (!port) {
 			printk(KERN_WARNING
 				"IOC4 serial memory not available for port\n");
 			return -ENOMEM;
 		}
-		memset(port, 0, sizeof(struct ioc4_port));
 		spin_lock_init(&port->ip_lock);
 
 		/* we need to remember the previous ones, to point back to
@@ -2671,7 +2670,7 @@ ioc4_serial_attach_one(struct ioc4_drive
 	idd->idd_serial_data = control;
 
 	/* Allocate the soft structure */
-	soft = kmalloc(sizeof(struct ioc4_soft), GFP_KERNEL);
+	soft = kzalloc(sizeof(struct ioc4_soft), GFP_KERNEL);
 	if (!soft) {
 		printk(KERN_WARNING
 		       "ioc4 (%p): unable to get memory for the soft struct\n",
@@ -2679,7 +2678,6 @@ ioc4_serial_attach_one(struct ioc4_drive
 		ret = -ENOMEM;
 		goto out3;
 	}
-	memset(soft, 0, sizeof(struct ioc4_soft));
 
 	spin_lock_init(&soft->is_ir_lock);
 	soft->is_ioc4_misc_addr = idd->idd_misc_regs;
--- linux-2.6.16-rc5-mm1/drivers/serial/serial_cs.c.orig	2006-03-02 10:01:12.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/serial/serial_cs.c	2006-03-02 10:01:21.000000000 +0100
@@ -212,10 +212,9 @@ static int serial_probe(struct pcmcia_de
 	DEBUG(0, "serial_attach()\n");
 
 	/* Create new serial device */
-	info = kmalloc(sizeof (*info), GFP_KERNEL);
+	info = kzalloc(sizeof (*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-	memset(info, 0, sizeof (*info));
 	info->p_dev = link;
 	link->priv = info;
 
--- linux-2.6.16-rc5-mm1/drivers/serial/8250_acorn.c.orig	2006-03-02 10:01:32.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/serial/8250_acorn.c	2006-03-02 10:01:44.000000000 +0100
@@ -47,11 +47,10 @@ serial_card_probe(struct expansion_card 
 	unsigned char __iomem *virt_addr;
 	unsigned int i;
 
-	info = kmalloc(sizeof(struct serial_card_info), GFP_KERNEL);
+	info = kzalloc(sizeof(struct serial_card_info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
-	memset(info, 0, sizeof(struct serial_card_info));
 	info->num_ports = type->num_ports;
 
 	bus_addr = ecard_resource_start(ec, type->type);
--- linux-2.6.16-rc5-mm1/drivers/serial/8250_acpi.c.orig	2006-03-02 10:01:49.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/serial/8250_acpi.c	2006-03-02 10:01:59.000000000 +0100
@@ -104,12 +104,11 @@ static int acpi_serial_add(struct acpi_d
 	port.uartclk = 1843200;
 	port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF;
 
-	priv = kmalloc(sizeof(struct serial_private), GFP_KERNEL);
+	priv = kzalloc(sizeof(struct serial_private), GFP_KERNEL);
 	if (!priv) {
 		result = -ENOMEM;
 		goto fail;
 	}
-	memset(priv, 0, sizeof(*priv));
 
 	status = acpi_walk_resources(device->handle, METHOD_NAME__CRS,
 				     acpi_serial_resource, &port);
--- linux-2.6.16-rc5-mm1/drivers/serial/sunsu.c.orig	2006-03-02 10:02:36.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/serial/sunsu.c	2006-03-02 10:02:48.000000000 +0100
@@ -1303,10 +1303,8 @@ static int __init sunsu_kbd_ms_init(stru
 	       sunsu_type(&up->port));
 
 #ifdef CONFIG_SERIO
-	up->serio = serio = kmalloc(sizeof(struct serio), GFP_KERNEL);
+	up->serio = serio = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	if (serio) {
-		memset(serio, 0, sizeof(*serio));
-
 		serio->port_data = up;
 
 		serio->id.type = SERIO_RS232;
--- linux-2.6.16-rc5-mm1/drivers/serial/sunzilog.c.orig	2006-03-02 10:02:59.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/serial/sunzilog.c	2006-03-02 10:04:45.000000000 +0100
@@ -1022,23 +1022,12 @@ static struct uart_driver sunzilog_reg =
 	.major		=	TTY_MAJOR,
 };
 
-static void * __init alloc_one_table(unsigned long size)
-{
-	void *ret;
-
-	ret = kmalloc(size, GFP_KERNEL);
-	if (ret != NULL)
-		memset(ret, 0, size);
-
-	return ret;
-}
-
 static void __init sunzilog_alloc_tables(void)
 {
 	sunzilog_port_table = 
-		alloc_one_table(NUM_CHANNELS * sizeof(struct uart_sunzilog_port));
+		kzalloc(NUM_CHANNELS * sizeof(struct uart_sunzilog_port), GFP_KERNEL);
 	sunzilog_chip_regs = 
-		alloc_one_table(NUM_SUNZILOG * sizeof(struct zilog_layout __iomem *));
+		kzalloc(NUM_SUNZILOG * sizeof(struct zilog_layout __iomem *), GFP_KERNEL);
 
 	if (sunzilog_port_table == NULL || sunzilog_chip_regs == NULL) {
 		prom_printf("SunZilog: Cannot allocate tables.\n");
@@ -1555,10 +1544,8 @@ static void __init sunzilog_register_ser
 {
 	struct serio *serio;
 
-	up->serio = serio = kmalloc(sizeof(struct serio), GFP_KERNEL);
+	up->serio = serio = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	if (serio) {
-		memset(serio, 0, sizeof(*serio));
-
 		serio->port_data = up;
 
 		serio->id.type = SERIO_RS232;
--- linux-2.6.16-rc5-mm1/drivers/serial/ip22zilog.c.orig	2006-03-02 10:04:54.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/serial/ip22zilog.c	2006-03-02 10:05:51.000000000 +0100
@@ -925,23 +925,12 @@ static struct zilog_layout **ip22zilog_c
 static struct uart_ip22zilog_port *ip22zilog_irq_chain;
 static int zilog_irq = -1;
 
-static void * __init alloc_one_table(unsigned long size)
-{
-	void *ret;
-
-	ret = kmalloc(size, GFP_KERNEL);
-	if (ret != NULL)
-		memset(ret, 0, size);
-
-	return ret;
-}
-
 static void __init ip22zilog_alloc_tables(void)
 {
-	ip22zilog_port_table = (struct uart_ip22zilog_port *)
-		alloc_one_table(NUM_CHANNELS * sizeof(struct uart_ip22zilog_port));
-	ip22zilog_chip_regs = (struct zilog_layout **)
-		alloc_one_table(NUM_IP22ZILOG * sizeof(struct zilog_layout *));
+	ip22zilog_port_table =
+		kzalloc(NUM_CHANNELS * sizeof(struct uart_ip22zilog_port), GFP_KERNEL);
+	ip22zilog_chip_regs =
+		kzalloc(NUM_IP22ZILOG * sizeof(struct zilog_layout *), GFP_KERNEL);
 
 	if (ip22zilog_port_table == NULL || ip22zilog_chip_regs == NULL) {
 		panic("IP22-Zilog: Cannot allocate IP22-Zilog tables.");
--- linux-2.6.16-rc5-mm1/drivers/serial/serial_core.c.orig	2006-03-02 10:06:01.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/serial/serial_core.c	2006-03-02 10:06:36.000000000 +0100
@@ -1492,9 +1492,8 @@ static struct uart_state *uart_get(struc
 	}
 
 	if (!state->info) {
-		state->info = kmalloc(sizeof(struct uart_info), GFP_KERNEL);
+		state->info = kzalloc(sizeof(struct uart_info), GFP_KERNEL);
 		if (state->info) {
-			memset(state->info, 0, sizeof(struct uart_info));
 			init_waitqueue_head(&state->info->open_wait);
 			init_waitqueue_head(&state->info->delta_msr_wait);
 
@@ -2152,13 +2151,11 @@ int uart_register_driver(struct uart_dri
 	 * Maybe we should be using a slab cache for this, especially if
 	 * we have a large number of ports to handle.
 	 */
-	drv->state = kmalloc(sizeof(struct uart_state) * drv->nr, GFP_KERNEL);
+	drv->state = kcalloc(drv->nr, sizeof(struct uart_state), GFP_KERNEL);
 	retval = -ENOMEM;
 	if (!drv->state)
 		goto out;
 
-	memset(drv->state, 0, sizeof(struct uart_state) * drv->nr);
-
 	normal  = alloc_tty_driver(drv->nr);
 	if (!normal)
 		goto out;
--- linux-2.6.16-rc5-mm1/drivers/serial/jsm/jsm_tty.c.orig	2006-03-02 10:07:15.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/serial/jsm/jsm_tty.c	2006-03-02 10:08:01.000000000 +0100
@@ -194,31 +194,28 @@ static int jsm_tty_open(struct uart_port
 	/* Drop locks, as malloc with GFP_KERNEL can sleep */
 
 	if (!channel->ch_rqueue) {
-		channel->ch_rqueue = (u8 *) kmalloc(RQUEUESIZE, GFP_KERNEL);
+		channel->ch_rqueue = kzalloc(RQUEUESIZE, GFP_KERNEL);
 		if (!channel->ch_rqueue) {
 			jsm_printk(INIT, ERR, &channel->ch_bd->pci_dev,
 				"unable to allocate read queue buf");
 			return -ENOMEM;
 		}
-		memset(channel->ch_rqueue, 0, RQUEUESIZE);
 	}
 	if (!channel->ch_equeue) {
-		channel->ch_equeue = (u8 *) kmalloc(EQUEUESIZE, GFP_KERNEL);
+		channel->ch_equeue = kzalloc(EQUEUESIZE, GFP_KERNEL);
 		if (!channel->ch_equeue) {
 			jsm_printk(INIT, ERR, &channel->ch_bd->pci_dev,
 				"unable to allocate error queue buf");
 			return -ENOMEM;
 		}
-		memset(channel->ch_equeue, 0, EQUEUESIZE);
 	}
 	if (!channel->ch_wqueue) {
-		channel->ch_wqueue = (u8 *) kmalloc(WQUEUESIZE, GFP_KERNEL);
+		channel->ch_wqueue = kzalloc(WQUEUESIZE, GFP_KERNEL);
 		if (!channel->ch_wqueue) {
 			jsm_printk(INIT, ERR, &channel->ch_bd->pci_dev,
 				"unable to allocate write queue buf");
 			return -ENOMEM;
 		}
-		memset(channel->ch_wqueue, 0, WQUEUESIZE);
 	}
 
 	channel->ch_flags &= ~(CH_OPENING);
@@ -392,13 +389,12 @@ int jsm_tty_init(struct jsm_board *brd)
 			 * Okay to malloc with GFP_KERNEL, we are not at
 			 * interrupt context, and there are no locks held.
 			 */
-			brd->channels[i] = kmalloc(sizeof(struct jsm_channel), GFP_KERNEL);
+			brd->channels[i] = kzalloc(sizeof(struct jsm_channel), GFP_KERNEL);
 			if (!brd->channels[i]) {
 				jsm_printk(CORE, ERR, &brd->pci_dev,
 					"%s:%d Unable to allocate memory for channel struct\n",
 							 __FILE__, __LINE__);
 			}
-			memset(brd->channels[i], 0, sizeof(struct jsm_channel));
 		}
 	}
 



--===============24255937179909437==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24255937179909437==--
