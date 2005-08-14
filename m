From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 14 Aug 2005 13:44:38 +0000
Subject: [KJ] [PATCH] dvb: fmt warning fixes for 64-bit platforms
Message-Id: <20050814134438.GE15052@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42347245618152174=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42347245618152174==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix

drivers/media/dvb/frontends/or51211.c: In function `or51211_load_firmware':
drivers/media/dvb/frontends/or51211.c:113: warning: int format, different type arg (arg 2)
drivers/media/dvb/frontends/bcm3510.c: In function `bcm3510_download_firmware':
drivers/media/dvb/frontends/bcm3510.c:623: warning: int format, different type arg (arg 2)
drivers/media/dvb/frontends/bcm3510.c:629: warning: unsigned int format, different type arg (arg 4)
drivers/media/dvb/b2c2/flexcop-pci.c: In function `flexcop_pci_isr':
drivers/media/dvb/b2c2/flexcop-pci.c:164: warning: unsigned int format, different type arg (arg 4)
drivers/media/dvb/dvb-usb/dvb-usb-urb.c: In function `dvb_usb_allocate_stream_buffers':
drivers/media/dvb/dvb-usb/dvb-usb-urb.c:199: warning: int format, different type arg (arg 4)

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/media/dvb/b2c2/flexcop-pci.c    |    7 +++++--
 drivers/media/dvb/dvb-usb/dvb-usb-urb.c |    4 +++-
 drivers/media/dvb/frontends/bcm3510.c   |    4 ++--
 drivers/media/dvb/frontends/or51211.c   |    2 +-
 4 files changed, 11 insertions(+), 6 deletions(-)

--- linux-fmt.orig/drivers/media/dvb/b2c2/flexcop-pci.c
+++ linux-fmt/drivers/media/dvb/b2c2/flexcop-pci.c
@@ -161,8 +161,11 @@ static irqreturn_t flexcop_pci_isr(int i
 			fc->read_ibi_reg(fc,dma1_008).dma_0x8.dma_cur_addr << 2;
 		u32 cur_pos = cur_addr - fc_pci->dma[0].dma_addr0;
 
-		deb_irq("%u irq: %08x cur_addr: %08x: cur_pos: %08x, last_cur_pos: %08x ",
-				jiffies_to_usecs(jiffies - fc_pci->last_irq),v.raw,cur_addr,cur_pos,fc_pci->last_dma1_cur_pos);
+		deb_irq("%u irq: %08x cur_addr: %08llx: cur_pos: %08x, "
+				"last_cur_pos: %08x ",
+				jiffies_to_usecs(jiffies - fc_pci->last_irq),
+				v.raw,(unsigned long long)cur_addr,
+				cur_pos,fc_pci->last_dma1_cur_pos);
 		fc_pci->last_irq = jiffies;
 
 		/* buffer end was reached, restarted from the beginning
--- linux-fmt.orig/drivers/media/dvb/frontends/bcm3510.c
+++ linux-fmt/drivers/media/dvb/frontends/bcm3510.c
@@ -620,13 +620,13 @@ static int bcm3510_download_firmware(str
 		err("could not load firmware (%s): %d",BCM3510_DEFAULT_FIRMWARE,ret);
 		return ret;
 	}
-	deb_info("got firmware: %d\n",fw->size);
+	deb_info("got firmware: %zd\n",fw->size);
 
 	b = fw->data;
 	for (i = 0; i < fw->size;) {
 		addr = le16_to_cpu( *( (u16 *)&b[i] ) );
 		len  = le16_to_cpu( *( (u16 *)&b[i+2] ) );
-		deb_info("firmware chunk, addr: 0x%04x, len: 0x%04x, total length: 0x%04x\n",addr,len,fw->size);
+		deb_info("firmware chunk, addr: 0x%04x, len: 0x%04x, total length: 0x%04zx\n",addr,len,fw->size);
 		if ((ret = bcm3510_write_ram(st,addr,&b[i+4],len)) < 0) {
 			err("firmware download failed: %d\n",ret);
 			return ret;
--- linux-fmt.orig/drivers/media/dvb/frontends/or51211.c
+++ linux-fmt/drivers/media/dvb/frontends/or51211.c
@@ -110,7 +110,7 @@ static int or51211_load_firmware (struct
 	u8 tudata[585];
 	int i;
 
-	dprintk("Firmware is %d bytes\n",fw->size);
+	dprintk("Firmware is %zd bytes\n",fw->size);
 
 	/* Get eprom data */
 	tudata[0] = 17;
--- linux-fmt.orig/drivers/media/dvb/dvb-usb/dvb-usb-urb.c
+++ linux-fmt/drivers/media/dvb/dvb-usb/dvb-usb-urb.c
@@ -196,7 +196,9 @@ static int dvb_usb_allocate_stream_buffe
 			dvb_usb_free_stream_buffers(d);
 			return -ENOMEM;
 		}
-		deb_mem("buffer %d: %p (dma: %d)\n",d->buf_num,d->buf_list[d->buf_num],d->dma_addr[d->buf_num]);
+		deb_mem("buffer %d: %p (dma: %llu)\n",
+				d->buf_num,d->buf_list[d->buf_num],
+				(unsigned long long)d->dma_addr[d->buf_num]);
 		memset(d->buf_list[d->buf_num],0,size);
 	}
 	deb_mem("allocation successful\n");


--===============42347245618152174==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42347245618152174==--
