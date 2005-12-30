From: Kees Cook <kees@outflux.net>
Date: Fri, 30 Dec 2005 00:52:35 +0000
Subject: [KJ] [PATCH] various: fixes size_t args in some printks
Message-Id: <20051230005235.GT18040@outflux.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54280609440938732=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54280609440938732==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Compiling with gcc-3.3.6, I get some printf format warnings.  This patch 
against linux-2.6.15-rc7-git3, fixes a few %d's that need to be %zu's in 
various printk's.

Signed-off-by: Kees Cook <kees@outflux.net>

---
diff -urp linux-2.6.15-rc7-git3-clean/drivers/media/dvb/frontends/bcm3510.c linux-2.6.15-rc7-git3-kees/drivers/media/dvb/frontends/bcm3510.c
--- linux-2.6.15-rc7-git3-clean/drivers/media/dvb/frontends/bcm3510.c	2005-12-25 17:01:19.000000000 +0000
+++ linux-2.6.15-rc7-git3-kees/drivers/media/dvb/frontends/bcm3510.c	2005-12-30 00:43:46.000000000 +0000
@@ -623,13 +623,13 @@ static int bcm3510_download_firmware(str
 		err("could not load firmware (%s): %d",BCM3510_DEFAULT_FIRMWARE,ret);
 		return ret;
 	}
-	deb_info("got firmware: %d\n",fw->size);
+	deb_info("got firmware: %zu\n",fw->size);
 
 	b = fw->data;
 	for (i = 0; i < fw->size;) {
 		addr = le16_to_cpu( *( (u16 *)&b[i] ) );
 		len  = le16_to_cpu( *( (u16 *)&b[i+2] ) );
-		deb_info("firmware chunk, addr: 0x%04x, len: 0x%04x, total length: 0x%04x\n",addr,len,fw->size);
+		deb_info("firmware chunk, addr: 0x%04x, len: 0x%04x, total length: 0x%04zx\n",addr,len,fw->size);
 		if ((ret = bcm3510_write_ram(st,addr,&b[i+4],len)) < 0) {
 			err("firmware download failed: %d\n",ret);
 			return ret;
diff -urp linux-2.6.15-rc7-git3-clean/drivers/media/dvb/frontends/or51211.c linux-2.6.15-rc7-git3-kees/drivers/media/dvb/frontends/or51211.c
--- linux-2.6.15-rc7-git3-clean/drivers/media/dvb/frontends/or51211.c	2005-12-25 17:01:19.000000000 +0000
+++ linux-2.6.15-rc7-git3-kees/drivers/media/dvb/frontends/or51211.c	2005-12-30 00:44:33.000000000 +0000
@@ -112,7 +112,7 @@ static int or51211_load_firmware (struct
 	u8 tudata[585];
 	int i;
 
-	dprintk("Firmware is %d bytes\n",fw->size);
+	dprintk("Firmware is %zu bytes\n",fw->size);
 
 	/* Get eprom data */
 	tudata[0] = 17;
diff -urp linux-2.6.15-rc7-git3-clean/drivers/parport/parport_serial.c linux-2.6.15-rc7-git3-kees/drivers/parport/parport_serial.c
--- linux-2.6.15-rc7-git3-clean/drivers/parport/parport_serial.c	2005-10-28 00:02:08.000000000 +0000
+++ linux-2.6.15-rc7-git3-kees/drivers/parport/parport_serial.c	2005-12-30 00:42:30.000000000 +0000
@@ -329,7 +329,7 @@ static int __devinit parport_register (s
 
 		if (priv->num_par == ARRAY_SIZE (priv->port)) {
 			printk (KERN_WARNING
-				"parport_serial: %s: only %u parallel ports "
+				"parport_serial: %s: only %zu parallel ports "
 				"supported (%d reported)\n", pci_name (dev),
 				ARRAY_SIZE (priv->port), card->numports);
 			break;
diff -urp linux-2.6.15-rc7-git3-clean/fs/jffs2/readinode.c linux-2.6.15-rc7-git3-kees/fs/jffs2/readinode.c
--- linux-2.6.15-rc7-git3-clean/fs/jffs2/readinode.c	2005-12-25 17:01:24.000000000 +0000
+++ linux-2.6.15-rc7-git3-kees/fs/jffs2/readinode.c	2005-12-30 00:40:32.000000000 +0000
@@ -204,7 +204,7 @@ static inline int read_dnode(struct jffs
 
 	tn = jffs2_alloc_tmp_dnode_info();
 	if (!tn) {
-		JFFS2_ERROR("failed to allocate tn (%d bytes).\n", sizeof(*tn));
+		JFFS2_ERROR("failed to allocate tn (%zu bytes).\n", sizeof(*tn));
 		return -ENOMEM;
 	}
 
@@ -434,7 +434,7 @@ static int read_more(struct jffs2_sb_inf
 	}
 
 	if (retlen < len) {
-		JFFS2_ERROR("short read at %#08x: %d instead of %d.\n",
+		JFFS2_ERROR("short read at %#08x: %zu instead of %d.\n",
 				offs, retlen, len);
 		return -EIO;
 	}
@@ -542,7 +542,7 @@ static int jffs2_get_inode_nodes(struct 
 		}
 
 		if (retlen < len) {
-			JFFS2_ERROR("short read at %#08x: %d instead of %d.\n", ref_offset(ref), retlen, len);
+			JFFS2_ERROR("short read at %#08x: %zu instead of %d.\n", ref_offset(ref), retlen, len);
 			err = -EIO;
 			goto free_out;
 		}
diff -urp linux-2.6.15-rc7-git3-clean/sound/pci/rme9652/hdspm.c linux-2.6.15-rc7-git3-kees/sound/pci/rme9652/hdspm.c
--- linux-2.6.15-rc7-git3-clean/sound/pci/rme9652/hdspm.c	2005-12-25 17:01:27.000000000 +0000
+++ linux-2.6.15-rc7-git3-kees/sound/pci/rme9652/hdspm.c	2005-12-30 00:35:11.000000000 +0000
@@ -3327,11 +3327,11 @@ static int __devinit snd_hdspm_prealloca
 						   snd_dma_pci_data(hdspm->pci),
 						   wanted,
 						   wanted)) < 0) {
-		snd_printdd("Could not preallocate %d  Bytes\n", wanted);
+		snd_printdd("Could not preallocate %zu  Bytes\n", wanted);
 
 		return err;
 	} else
-		snd_printdd(" Preallocated %d  Bytes\n", wanted);
+		snd_printdd(" Preallocated %zu  Bytes\n", wanted);
 
 	return 0;
 }
@@ -3522,7 +3522,7 @@ static int __devinit snd_hdspm_create(sn
 
 	hdspm->monitor_outs = enable_monitor;
 
-	snd_printdd("kmalloc Mixer memory of %d Bytes\n",
+	snd_printdd("kmalloc Mixer memory of %zu Bytes\n",
 		   sizeof(hdspm_mixer_t));
 	if ((hdspm->mixer =
 	     (hdspm_mixer_t *) kmalloc(sizeof(hdspm_mixer_t), GFP_KERNEL))


-- 
Kees Cook                                            @outflux.net

--===============54280609440938732==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54280609440938732==--
