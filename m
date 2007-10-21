From: Roel Kluin <12o3l@tiscali.nl>
Date: Sun, 21 Oct 2007 17:39:25 +0000
Subject: [PATCH] parport pc and amiga debugging
Message-Id: <471B8ECD.4050605@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

    parport pc and amiga debugging
    
    Signed-off-by: Roel Kluin <12o3l@tiscali.nl>

---
diff --git a/drivers/parport/Kconfig b/drivers/parport/Kconfig
index d449b15..ee678e9 100644
--- a/drivers/parport/Kconfig
+++ b/drivers/parport/Kconfig
@@ -31,6 +31,11 @@ menuconfig PARPORT
 
 	  If unsure, say Y.
 
+config PARPORT_DEBUG
+	bool "Parallel port debugging"
+	depends on PARPORT
+	default n
+
 if PARPORT
 
 config PARPORT_PC
@@ -101,6 +106,11 @@ config PARPORT_AMIGA
 	  Amiga machines. This code is also available as a module (say M),
 	  called parport_amiga. If in doubt, saying N is the safe plan.
 
+config PARPORT_AMIGA_DEBUG
+	bool "Amiga builtin port debugging"
+	depends on PARPORT_AMIGA
+	default n
+
 config PARPORT_MFC3
 	tristate "Multiface III parallel port"
 	depends on ZORRO
diff --git a/drivers/parport/parport_amiga.c b/drivers/parport/parport_amiga.c
index a0afaee..55f6cf4 100644
--- a/drivers/parport/parport_amiga.c
+++ b/drivers/parport/parport_amiga.c
@@ -23,19 +23,18 @@
 #include <asm/irq.h>
 #include <asm/io.h>
 #include <asm/amigaints.h>
+#ifdef PARPORT_AMIGA_DEBUG
+	#define DEBUG 1
+#endif
+#include <linux/kernel.h>
 
 #undef DEBUG
-#ifdef DEBUG
-#define DPRINTK printk
-#else
-#define DPRINTK(x...)	do { } while (0)
-#endif
 
 static struct parport *this_port = NULL;
 
 static void amiga_write_data(struct parport *p, unsigned char data)
 {
-	DPRINTK(KERN_DEBUG "write_data %c\n",data);
+	printk(KERN_DEBUG "write_data %c\n", data);
 	/* Triggers also /STROBE. This behavior cannot be changed */
 	ciaa.prb = data;
 	mb();
@@ -74,13 +73,13 @@ static unsigned char control_amiga_to_pc(unsigned char control)
 
 static void amiga_write_control(struct parport *p, unsigned char control)
 {
-	DPRINTK(KERN_DEBUG "write_control %02x\n",control);
+	printk(KERN_DEBUG "write_control %02x\n", control);
 	/* No implementation possible */
 }
 	
 static unsigned char amiga_read_control( struct parport *p)
 {
-	DPRINTK(KERN_DEBUG "read_control \n");
+	printk(KERN_DEBUG "read_control \n");
 	return control_amiga_to_pc(0);
 }
 
@@ -88,7 +87,7 @@ static unsigned char amiga_frob_control( struct parport *p, unsigned char mask,
 {
 	unsigned char old;
 
-	DPRINTK(KERN_DEBUG "frob_control mask %02x, value %02x\n",mask,val);
+	printk(KERN_DEBUG "frob_control mask %02x, value %02x\n", mask, val);
 	old = amiga_read_control(p);
 	amiga_write_control(p, (old & ~mask) ^ val);
 	return old;
@@ -133,7 +132,7 @@ static unsigned char amiga_read_status(struct parport *p)
 	unsigned char status;
 
 	status = status_amiga_to_pc(ciab.pra & 7);
-	DPRINTK(KERN_DEBUG "read_status %02x\n", status);
+	printk(KERN_DEBUG "read_status %02x\n", status);
 	return status;
 }
 
@@ -156,14 +155,14 @@ static void amiga_disable_irq(struct parport *p)
 
 static void amiga_data_forward(struct parport *p)
 {
-	DPRINTK(KERN_DEBUG "forward\n");
+	printk(KERN_DEBUG "forward\n");
 	ciaa.ddrb = 0xff; /* all pins output */
 	mb();
 }
 
 static void amiga_data_reverse(struct parport *p)
 {
-	DPRINTK(KERN_DEBUG "reverse\n");
+	printk(KERN_DEBUG "reverse\n");
 	ciaa.ddrb = 0; /* all pins input */
 	mb();
 }
diff --git a/drivers/parport/parport_pc.c b/drivers/parport/parport_pc.c
index e2be840..28d73fa 100644
--- a/drivers/parport/parport_pc.c
+++ b/drivers/parport/parport_pc.c
@@ -49,7 +49,6 @@
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
-#include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
 #include <linux/pci.h>
@@ -66,6 +65,10 @@
 #include <linux/via.h>
 #include <asm/parport.h>
 
+#ifdef PARPORT_DEBUG
+	#define DEBUG 1
+#endif
+#include <linux/kernel.h>
 #define PARPORT_PC_MAX_PORTS PARPORT_MAX
 
 #ifdef CONFIG_ISA_DMA_API
@@ -86,11 +89,6 @@
 
 #undef DEBUG
 
-#ifdef DEBUG
-#define DPRINTK  printk
-#else
-#define DPRINTK(stuff...)
-#endif
 
 
 #define NR_SUPERIOS 3
@@ -117,7 +115,7 @@ static void frob_econtrol (struct parport *pb, unsigned char m,
 	if (m != 0xff)
 		ectr = inb (ECONTROL (pb));
 
-	DPRINTK (KERN_DEBUG "frob_econtrol(%02x,%02x): %02x -> %02x\n",
+	printk (KERN_DEBUG "frob_econtrol(%02x,%02x): %02x -> %02x\n",
 		m, v, ectr, (ectr & ~m) ^ v);
 
 	outb ((ectr & ~m) ^ v, ECONTROL (pb));
@@ -141,7 +139,7 @@ static int change_mode(struct parport *p, int m)
 	unsigned char oecr;
 	int mode;
 
-	DPRINTK(KERN_INFO "parport change_mode ECP-ISA to mode 0x%02x\n",m);
+	printk(KERN_INFO "parport change_mode ECP-ISA to mode 0x%02x\n", m);
 
 	if (!priv->ecr) {
 		printk (KERN_DEBUG "change_mode: but there's no ECR!\n");
@@ -235,7 +233,7 @@ static int get_fifo_residue (struct parport *p)
 	/* Back to PS2 mode. */
 	frob_set_mode (p, ECR_PS2);
 
-	DPRINTK (KERN_DEBUG "*** get_fifo_residue: done residue collecting (ecr = 0x%2.2x)\n", inb (ECONTROL (p)));
+	printk (KERN_DEBUG "*** get_fifo_residue: done residue collecting (ecr = 0x%2.2x)\n", inb (ECONTROL (p)));
 	return residue;
 }
 #endif  /*  0 */
@@ -951,7 +949,7 @@ static size_t parport_pc_ecp_read_block_pio (struct parport *port,
 	char *bufp = buf;
 
 	port = port->physport;
-DPRINTK (KERN_DEBUG "parport_pc: parport_pc_ecp_read_block_pio\n");
+printk (KERN_DEBUG "parport_pc: parport_pc_ecp_read_block_pio\n");
 dump_parport_state ("enter fcn", port);
 
 	/* Special case: a timeout of zero means we cannot call schedule().
@@ -1076,7 +1074,7 @@ dump_parport_state ("FIFO empty", port);
 		false_alarm:
 dump_parport_state ("waiting", port);
 			ret = parport_wait_event (port, HZ);
-DPRINTK (KERN_DEBUG "parport_wait_event returned %d\n", ret);
+printk (KERN_DEBUG "parport_wait_event returned %d\n", ret);
 			if (ret < 0)
 				break;
 			ret = 0;
@@ -1111,7 +1109,7 @@ dump_parport_state ("FIFO full", port);
 			continue;
 		}
 
-DPRINTK (KERN_DEBUG "*** ecp_read_block_pio: reading one byte from the FIFO\n");
+printk (KERN_DEBUG "*** ecp_read_block_pio: reading one byte from the FIFO\n");
 
 		/* FIFO not filled.  We will cycle this loop for a while
                  * and either the peripheral will fill it faster,
@@ -2427,7 +2425,7 @@ static int __devinit sio_ite_8872_probe (struct pci_dev *pdev, int autoirq,
 	int irq;
 	int i;
 
-	DPRINTK (KERN_DEBUG "sio_ite_8872_probe()\n");
+	printk (KERN_DEBUG "sio_ite_8872_probe()\n");
 	
 	// make sure which one chip
 	for(i = 0; i < 5; i++) {
@@ -2468,7 +2466,7 @@ static int __devinit sio_ite_8872_probe (struct pci_dev *pdev, int autoirq,
 		printk (KERN_INFO "parport_pc: ITE8873 found (1S)\n");
 		return 0;
 	case 0x8:
-		DPRINTK (KERN_DEBUG "parport_pc: ITE8874 found (2S)\n");
+		printk (KERN_DEBUG "parport_pc: ITE8874 found (2S)\n");
 		return 0;
 	default:
 		printk (KERN_INFO "parport_pc: unknown ITE887x\n");
@@ -2490,10 +2488,10 @@ static int __devinit sio_ite_8872_probe (struct pci_dev *pdev, int autoirq,
 	pci_write_config_dword (pdev, 0x9c,
 				ite8872set | (ite8872_irq * 0x11111));
 
-	DPRINTK (KERN_DEBUG "ITE887x: The IRQ is %d.\n", ite8872_irq);
-	DPRINTK (KERN_DEBUG "ITE887x: The PARALLEL I/O port is 0x%x.\n",
+	printk (KERN_DEBUG "ITE887x: The IRQ is %d.\n", ite8872_irq);
+	printk (KERN_DEBUG "ITE887x: The PARALLEL I/O port is 0x%x.\n",
 		 ite8872_lpt);
-	DPRINTK (KERN_DEBUG "ITE887x: The PARALLEL I/O porthi is 0x%x.\n",
+	printk (KERN_DEBUG "ITE887x: The PARALLEL I/O porthi is 0x%x.\n",
 		 ite8872_lpthi);
 
 	/* Let the user (or defaults) steer us away from interrupts */
