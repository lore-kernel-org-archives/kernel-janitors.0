From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:56:36 +0000
Subject: [KJ] [PATCH 02/72] arm: add KERN_ constants to
Message-Id: <20060908015636.10114.14544.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-footbridge/netwinder-hw.c b/arch/arm/mach-footbridge/netwinder-hw.c
index a1f381c..e0486d1 100644
--- a/arch/arm/mach-footbridge/netwinder-hw.c
+++ b/arch/arm/mach-footbridge/netwinder-hw.c
@@ -394,10 +394,10 @@ static unsigned char rwa_unlock[] __init
   0x0d, 0x86, 0xc3, 0x61, 0xb0, 0x58, 0x2c, 0x16, 0x8b, 0x45, 0xa2, 0xd1, 0xe8, 0x74,
   0x3a, 0x9d, 0xce, 0xe7, 0x73, 0x39 };
 
-#ifndef DEBUG
-#define dprintk(x...)
+#ifdef DEBUG
+#define DPRINTK(fmt, args...) printk(KERN_DEBUG fmt, ## args)
 #else
-#define dprintk(x...) printk(x)
+#define DPRINTK(fmt, args...)
 #endif
 
 #define WRITE_RWA(r,v) do { outb((r), 0x279); udelay(10); outb((v), 0xa79); } while (0)
@@ -427,7 +427,7 @@ static inline void rwa010_read_ident(voi
 
 	mdelay(1);
 
-	dprintk("Identifier: ");
+	DPRINTK("Identifier: ");
 	for (i = 0; i < 9; i++) {
 		si[i] = 0;
 		for (j = 0; j < 8; j++) {
@@ -436,20 +436,20 @@ static inline void rwa010_read_ident(voi
 			inb(0x203);
 			udelay(250);
 			bit = inb(0x203);
-			dprintk("%02X ", bit);
+			DPRINTK("%02X ", bit);
 			bit = (bit = 0xaa) ? 1 : 0;
 			si[i] |= bit << j;
 		}
-		dprintk("(%02X) ", si[i]);
+		DPRINTK("(%02X) ", si[i]);
 	}
-	dprintk("\n");
+	DPRINTK("\n");
 }
 
 static inline void rwa010_global_init(void)
 {
 	WRITE_RWA(6, 2);	// Assign a card no = 2
 
-	dprintk("Card no = %d\n", inb(0x203));
+	DPRINTK("Card no = %d\n", inb(0x203));
 
 	/* disable the modem section of the chip */
 	WRITE_RWA(7, 3);
@@ -470,12 +470,12 @@ static inline void rwa010_game_port_init
 
 	WRITE_RWA(7, 5);
 
-	dprintk("Slider base: ");
+	DPRINTK("Slider base: ");
 	WRITE_RWA(0x61, 1);
 	i = inb(0x203);
 
 	WRITE_RWA(0x60, 2);
-	dprintk("%02X%02X (201)\n", inb(0x203), i);
+	DPRINTK("%02X%02X (201)\n", inb(0x203), i);
 
 	WRITE_RWA(0x30, 1);
 }
@@ -486,18 +486,18 @@ static inline void rwa010_waveartist_ini
 
 	WRITE_RWA(7, 0);
 
-	dprintk("WaveArtist base: ");
+	DPRINTK("WaveArtist base: ");
 	WRITE_RWA(0x61, base & 255);
 	i = inb(0x203);
 
 	WRITE_RWA(0x60, base >> 8);
-	dprintk("%02X%02X (%X),", inb(0x203), i, base);
+	DPRINTK("%02X%02X (%X),", inb(0x203), i, base);
 
 	WRITE_RWA(0x70, irq);
-	dprintk(" irq: %d (%d),", inb(0x203), irq);
+	DPRINTK(" irq: %d (%d),", inb(0x203), irq);
 
 	WRITE_RWA(0x74, dma);
-	dprintk(" dma: %d (%d)\n", inb(0x203), dma);
+	DPRINTK(" dma: %d (%d)\n", inb(0x203), dma);
 
 	WRITE_RWA(0x30, 1);
 }
@@ -508,27 +508,27 @@ static inline void rwa010_soundblaster_i
 
 	WRITE_RWA(7, 1);
 
-	dprintk("SoundBlaster base: ");
+	DPRINTK("SoundBlaster base: ");
 	WRITE_RWA(0x61, sb_base & 255);
 	i = inb(0x203);
 
 	WRITE_RWA(0x60, sb_base >> 8);
-	dprintk("%02X%02X (%X),", inb(0x203), i, sb_base);
+	DPRINTK("%02X%02X (%X),", inb(0x203), i, sb_base);
 
-	dprintk(" irq: ");
+	DPRINTK(" irq: ");
 	WRITE_RWA(0x70, irq);
-	dprintk("%d (%d),", inb(0x203), irq);
+	DPRINTK("%d (%d),", inb(0x203), irq);
 
-	dprintk(" 8-bit DMA: ");
+	DPRINTK(" 8-bit DMA: ");
 	WRITE_RWA(0x74, dma);
-	dprintk("%d (%d)\n", inb(0x203), dma);
+	DPRINTK("%d (%d)\n", inb(0x203), dma);
 
-	dprintk("AdLib base: ");
+	DPRINTK("AdLib base: ");
 	WRITE_RWA(0x63, al_base & 255);
 	i = inb(0x203);
 
 	WRITE_RWA(0x62, al_base >> 8);
-	dprintk("%02X%02X (%X)\n", inb(0x203), i, al_base);
+	DPRINTK("%02X%02X (%X)\n", inb(0x203), i, al_base);
 
 	WRITE_RWA(0x30, 1);
 }
@@ -547,9 +547,9 @@ static void rwa010_soundblaster_reset(vo
 		mdelay(1);
 	}
 	if (i = 5)
-		printk("SoundBlaster: DSP reset failed\n");
+		pr_info("SoundBlaster: DSP reset failed\n");
 
-	dprintk("SoundBlaster DSP reset: %02X (AA)\n", inb(0x22a));
+	DPRINTK("SoundBlaster DSP reset: %02X (AA)\n", inb(0x22a));
 
 	for (i = 0; i < 5; i++) {
 		if ((inb(0x22c) & 0x80) = 0)
@@ -558,15 +558,15 @@ static void rwa010_soundblaster_reset(vo
 	}
 
 	if (i = 5)
-		printk("SoundBlaster: DSP not ready\n");
+		pr_info("SoundBlaster: DSP not ready\n");
 	else {
 		outb(0xe1, 0x22c);
 
-		dprintk("SoundBlaster DSP id: ");
+		DPRINTK("SoundBlaster DSP id: ");
 		i = inb(0x22a);
 		udelay(1);
 		i |= inb(0x22a) << 8;
-		dprintk("%04X\n", i);
+		DPRINTK("%04X\n", i);
 
 		for (i = 0; i < 5; i++) {
 			if ((inb(0x22c) & 0x80) = 0)
@@ -575,7 +575,7 @@ static void rwa010_soundblaster_reset(vo
 		}
 
 		if (i = 5)
-			printk("SoundBlaster: could not turn speaker off\n");
+			pr_info("SoundBlaster: could not turn speaker off\n");
 
 		outb(0xd3, 0x22c);
 	}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
