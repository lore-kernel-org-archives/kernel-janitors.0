From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 27 Feb 2006 07:23:03 +0000
Subject: [KJ] kzalloc() conversion in drivers/isdn
Message-Id: <1141024983.6530.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95274084055892549=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95274084055892549==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/video to kzalloc usage.
Compile tested with allyes config, no new warnings
came up.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/drivers/isdn/hardware/avm/avm_cs.c.orig	2006-02-24 23:51:08.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hardware/avm/avm_cs.c	2006-02-24 23:51:24.000000000 +0100
@@ -105,10 +105,9 @@ static int avmcs_attach(struct pcmcia_de
     local_info_t *local;
 
     /* Initialize the dev_link_t structure */
-    link = kmalloc(sizeof(struct dev_link_t), GFP_KERNEL);
+    link = kzalloc(sizeof(struct dev_link_t), GFP_KERNEL);
     if (!link)
         goto err;
-    memset(link, 0, sizeof(struct dev_link_t));
 
     /* The io structure describes IO port mapping */
     link->io.NumPorts1 = 16;
@@ -129,10 +128,9 @@ static int avmcs_attach(struct pcmcia_de
     link->conf.Present = PRESENT_OPTION;
 
     /* Allocate space for private device-specific data */
-    local = kmalloc(sizeof(local_info_t), GFP_KERNEL);
+    local = kzalloc(sizeof(local_info_t), GFP_KERNEL);
     if (!local)
         goto err_kfree;
-    memset(local, 0, sizeof(local_info_t));
     link->priv = local;
 
     link->handle = p_dev;
--- linux-2.6.16-rc4/drivers/isdn/pcbit/layer2.c	2006-02-24 23:50:57.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/pcbit/layer2.c.orig	2006-02-24 23:50:44.000000000 +0100
@@ -368,12 +368,13 @@ pcbit_receive(struct pcbit_dev *dev)
 			kfree(dev->read_frame);
 			dev->read_frame = NULL;
 		}
-		frame = kzalloc(sizeof(struct frame_buf), GFP_ATOMIC);
+		frame = kmalloc(sizeof(struct frame_buf), GFP_ATOMIC);
 
 		if (frame == NULL) {
 			printk(KERN_WARNING "kmalloc failed\n");
 			return;
 		}
+		memset(frame, 0, sizeof(struct frame_buf));
 
 		cpu = pcbit_readb(dev);
 		proc = pcbit_readb(dev);
--- linux-2.6.16-rc4/drivers/isdn/hardware/avm/b1.c.orig	2006-02-24 23:52:20.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hardware/avm/b1.c	2006-02-24 23:53:02.000000000 +0100
@@ -65,18 +65,15 @@ avmcard *b1_alloc_card(int nr_controller
 	avmctrl_info *cinfo;
 	int i;
 
-	card = kmalloc(sizeof(*card), GFP_KERNEL);
+	card = kzalloc(sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return NULL;
 
-	memset(card, 0, sizeof(*card));
-
-        cinfo = kmalloc(sizeof(*cinfo) * nr_controllers, GFP_KERNEL);
+        cinfo = kcalloc(nr_controllers, sizeof(*cinfo), GFP_KERNEL);
 	if (!cinfo) {
 		kfree(card);
 		return NULL;
 	}
-	memset(cinfo, 0, sizeof(*cinfo) * nr_controllers);
 
 	card->ctrlinfo = cinfo;
 	for (i = 0; i < nr_controllers; i++) {
@@ -718,12 +715,11 @@ avmcard_dma_alloc(char *name, struct pci
 	avmcard_dmainfo *p;
 	void *buf;
 
-	p = kmalloc(sizeof(avmcard_dmainfo), GFP_KERNEL);
+	p = kzalloc(sizeof(avmcard_dmainfo), GFP_KERNEL);
 	if (!p) {
 		printk(KERN_WARNING "%s: no memory.\n", name);
 		goto err;
 	}
-	memset(p, 0, sizeof(avmcard_dmainfo));
 
 	p->recvbuf.size = rsize;
 	buf = pci_alloc_consistent(pdev, rsize, &p->recvbuf.dmaaddr);
--- linux-2.6.16-rc4/drivers/isdn/hisax/teles_cs.c.orig	2006-02-24 23:53:27.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hisax/teles_cs.c	2006-02-24 23:53:50.000000000 +0100
@@ -138,9 +138,9 @@ static int teles_attach(struct pcmcia_de
     DEBUG(0, "teles_attach()\n");
 
     /* Allocate space for private device-specific data */
-    local = kmalloc(sizeof(local_info_t), GFP_KERNEL);
-    if (!local) return -ENOMEM;
-    memset(local, 0, sizeof(local_info_t));
+    local = kzalloc(sizeof(local_info_t), GFP_KERNEL);
+    if (!local)
+	return -ENOMEM;
     local->cardnr = -1;
     link = &local->link; link->priv = local;
 
--- linux-2.6.16-rc4/drivers/isdn/hisax/hfc4s8s_l1.c.orig	2006-02-24 23:54:29.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hisax/hfc4s8s_l1.c	2006-02-24 23:54:43.000000000 +0100
@@ -1590,11 +1590,10 @@ hfc4s8s_probe(struct pci_dev *pdev, cons
 	hfc4s8s_param *driver_data = (hfc4s8s_param *) ent->driver_data;
 	hfc4s8s_hw *hw;
 
-	if (!(hw = kmalloc(sizeof(hfc4s8s_hw), GFP_ATOMIC))) {
+	if (!(hw = kzalloc(sizeof(hfc4s8s_hw), GFP_ATOMIC))) {
 		printk(KERN_ERR "No kmem for HFC-4S/8S card\n");
 		return (err);
 	}
-	memset(hw, 0, sizeof(hfc4s8s_hw));
 
 	hw->pdev = pdev;
 	err = pci_enable_device(pdev);
--- linux-2.6.16-rc4/drivers/isdn/hisax/hfc_usb.c.orig	2006-02-24 23:54:51.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hisax/hfc_usb.c	2006-02-24 23:55:21.000000000 +0100
@@ -1483,9 +1483,8 @@ hfc_usb_probe(struct usb_interface *intf
 			iface = iface_used;
 			if (!
 			    (context =
-			     kmalloc(sizeof(hfcusb_data), GFP_KERNEL)))
+			     kzalloc(sizeof(hfcusb_data), GFP_KERNEL)))
 				return (-ENOMEM);	/* got no mem */
-			memset(context, 0, sizeof(hfcusb_data));
 
 			ep = iface->endpoint;
 			vcf = validconf[small_match];
--- linux-2.6.16-rc4/drivers/isdn/hisax/avma1_cs.c.orig	2006-02-24 23:55:57.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hisax/avma1_cs.c	2006-02-24 23:56:17.000000000 +0100
@@ -124,18 +124,16 @@ static int avma1cs_attach(struct pcmcia_
     DEBUG(0, "avma1cs_attach()\n");
 
     /* Initialize the dev_link_t structure */
-    link = kmalloc(sizeof(struct dev_link_t), GFP_KERNEL);
+    link = kzalloc(sizeof(struct dev_link_t), GFP_KERNEL);
     if (!link)
 	return -ENOMEM;
-    memset(link, 0, sizeof(struct dev_link_t));
 
     /* Allocate space for private device-specific data */
-    local = kmalloc(sizeof(local_info_t), GFP_KERNEL);
+    local = kzalloc(sizeof(local_info_t), GFP_KERNEL);
     if (!local) {
 	kfree(link);
 	return -ENOMEM;
     }
-    memset(local, 0, sizeof(local_info_t));
     link->priv = local;
 
     /* The io structure describes IO port mapping */
--- linux-2.6.16-rc4/drivers/isdn/hisax/sedlbauer_cs.c.orig	2006-02-24 23:56:31.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hisax/sedlbauer_cs.c	2006-02-24 23:56:48.000000000 +0100
@@ -156,9 +156,9 @@ static int sedlbauer_attach(struct pcmci
     DEBUG(0, "sedlbauer_attach()\n");
 
     /* Allocate space for private device-specific data */
-    local = kmalloc(sizeof(local_info_t), GFP_KERNEL);
-    if (!local) return -ENOMEM;
-    memset(local, 0, sizeof(local_info_t));
+    local = kzalloc(sizeof(local_info_t), GFP_KERNEL);
+    if (!local)
+	return -ENOMEM;
     local->cardnr = -1;
     link = &local->link; link->priv = local;
     
--- linux-2.6.16-rc4/drivers/isdn/hisax/st5481_init.c.orig	2006-02-24 23:57:03.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hisax/st5481_init.c	2006-02-24 23:57:13.000000000 +0100
@@ -70,12 +70,10 @@ static int probe_st5481(struct usb_inter
 	     le16_to_cpu(dev->descriptor.idProduct),
 	     number_of_leds);
 
-	adapter = kmalloc(sizeof(struct st5481_adapter), GFP_KERNEL);
+	adapter = kzalloc(sizeof(struct st5481_adapter), GFP_KERNEL);
 	if (!adapter)
 		return -ENOMEM;
 
-	memset(adapter, 0, sizeof(struct st5481_adapter));
-
 	adapter->number_of_leds = number_of_leds;
 	adapter->usb_dev = dev;
 
--- linux-2.6.16-rc4/drivers/isdn/hisax/elsa_cs.c.orig	2006-02-24 23:57:26.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hisax/elsa_cs.c	2006-02-24 23:57:42.000000000 +0100
@@ -147,9 +147,9 @@ static int elsa_cs_attach(struct pcmcia_
     DEBUG(0, "elsa_cs_attach()\n");
 
     /* Allocate space for private device-specific data */
-    local = kmalloc(sizeof(local_info_t), GFP_KERNEL);
-    if (!local) return -ENOMEM;
-    memset(local, 0, sizeof(local_info_t));
+    local = kzalloc(sizeof(local_info_t), GFP_KERNEL);
+    if (!local)
+	return -ENOMEM;
     local->cardnr = -1;
     link = &local->link; link->priv = local;
 
--- linux-2.6.16-rc4/drivers/isdn/i4l/isdn_bsdcomp.c.orig	2006-02-24 23:57:55.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/i4l/isdn_bsdcomp.c	2006-02-24 23:58:10.000000000 +0100
@@ -331,12 +331,10 @@ static void *bsd_alloc (struct isdn_ppp_
 	 * Allocate the main control structure for this instance.
 	 */
 	maxmaxcode = MAXCODE(bits);
-	db = (struct bsd_db *) kmalloc (sizeof (struct bsd_db),GFP_KERNEL);
+	db = (struct bsd_db *) kzalloc (sizeof (struct bsd_db),GFP_KERNEL);
 	if (!db)
 		return NULL;
 
-	memset (db, 0, sizeof(struct bsd_db));
-
 	db->xmit = data->flags & IPPP_COMP_FLAG_XMIT;
 	decomp = db->xmit ? 0 : 1;
 
--- linux-2.6.16-rc4/drivers/isdn/i4l/isdn_ppp.c.orig	2006-02-24 23:58:17.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/i4l/isdn_ppp.c	2006-02-24 23:59:06.000000000 +0100
@@ -877,13 +877,12 @@ isdn_ppp_init(void)
 
 	for (i = 0; i < ISDN_MAX_CHANNELS; i++) {
 		if (!(ippp_table[i] = (struct ippp_struct *)
-		      kmalloc(sizeof(struct ippp_struct), GFP_KERNEL))) {
+		      kzalloc(sizeof(struct ippp_struct), GFP_KERNEL))) {
 			printk(KERN_WARNING "isdn_ppp_init: Could not alloc ippp_table\n");
 			for (j = 0; j < i; j++)
 				kfree(ippp_table[j]);
 			return -1;
 		}
-		memset((char *) ippp_table[i], 0, sizeof(struct ippp_struct));
 		spin_lock_init(&ippp_table[i]->buflock);
 		ippp_table[i]->state = 0;
 		ippp_table[i]->first = ippp_table[i]->rq + NUM_RCV_BUFFS - 1;
@@ -2247,13 +2246,12 @@ static void isdn_ppp_ccp_xmit_reset(stru
 static struct ippp_ccp_reset *isdn_ppp_ccp_reset_alloc(struct ippp_struct *is)
 {
 	struct ippp_ccp_reset *r;
-	r = kmalloc(sizeof(struct ippp_ccp_reset), GFP_KERNEL);
+	r = kzalloc(sizeof(struct ippp_ccp_reset), GFP_KERNEL);
 	if(!r) {
 		printk(KERN_ERR "ippp_ccp: failed to allocate reset data"
 		       " structure - no mem\n");
 		return NULL;
 	}
-	memset(r, 0, sizeof(struct ippp_ccp_reset));
 	printk(KERN_DEBUG "ippp_ccp: allocated reset data structure %p\n", r);
 	is->reset = r;
 	return r;
--- linux-2.6.16-rc4/drivers/isdn/i4l/isdn_net.c.orig	2006-02-24 23:59:13.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/i4l/isdn_net.c	2006-02-24 23:59:39.000000000 +0100
@@ -2543,17 +2543,15 @@ isdn_net_new(char *name, struct net_devi
 		printk(KERN_WARNING "isdn_net: interface %s already exists\n", name);
 		return NULL;
 	}
-	if (!(netdev = (isdn_net_dev *) kmalloc(sizeof(isdn_net_dev), GFP_KERNEL))) {
+	if (!(netdev = (isdn_net_dev *) kzalloc(sizeof(isdn_net_dev), GFP_KERNEL))) {
 		printk(KERN_WARNING "isdn_net: Could not allocate net-device\n");
 		return NULL;
 	}
-	memset(netdev, 0, sizeof(isdn_net_dev));
-	if (!(netdev->local = (isdn_net_local *) kmalloc(sizeof(isdn_net_local), GFP_KERNEL))) {
+	if (!(netdev->local = (isdn_net_local *) kzalloc(sizeof(isdn_net_local), GFP_KERNEL))) {
 		printk(KERN_WARNING "isdn_net: Could not allocate device locals\n");
 		kfree(netdev);
 		return NULL;
 	}
-	memset(netdev->local, 0, sizeof(isdn_net_local));
 	if (name == NULL)
 		strcpy(netdev->local->name, "         ");
 	else
--- linux-2.6.16-rc4/drivers/isdn/i4l/isdn_v110.c.orig	2006-02-24 23:59:44.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/i4l/isdn_v110.c	2006-02-24 23:59:56.000000000 +0100
@@ -92,9 +92,8 @@ isdn_v110_open(unsigned char key, int hd
 	int i;
 	isdn_v110_stream *v;
 
-	if ((v = kmalloc(sizeof(isdn_v110_stream), GFP_ATOMIC)) == NULL)
+	if ((v = kzalloc(sizeof(isdn_v110_stream), GFP_ATOMIC)) == NULL)
 		return NULL;
-	memset(v, 0, sizeof(isdn_v110_stream));
 	v->key = key;
 	v->nbits = 0;
 	for (i = 0; key & (1 << i); i++)
--- linux-2.6.16-rc4/drivers/isdn/i4l/isdn_common.c.orig	2006-02-25 00:00:07.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/i4l/isdn_common.c	2006-02-25 00:00:55.000000000 +0100
@@ -2054,21 +2054,19 @@ isdn_add_channels(isdn_driver_t *d, int 
 
 	if ((adding) && (d->rcverr))
 		kfree(d->rcverr);
-	if (!(d->rcverr = kmalloc(sizeof(int) * m, GFP_ATOMIC))) {
+	if (!(d->rcverr = kcalloc(m, sizeof(int), GFP_ATOMIC))) {
 		printk(KERN_WARNING "register_isdn: Could not alloc rcverr\n");
 		return -1;
 	}
-	memset((char *) d->rcverr, 0, sizeof(int) * m);
 
 	if ((adding) && (d->rcvcount))
 		kfree(d->rcvcount);
-	if (!(d->rcvcount = kmalloc(sizeof(int) * m, GFP_ATOMIC))) {
+	if (!(d->rcvcount = kcalloc(m, sizeof(int), GFP_ATOMIC))) {
 		printk(KERN_WARNING "register_isdn: Could not alloc rcvcount\n");
 		if (!adding)
 			kfree(d->rcverr);
 		return -1;
 	}
-	memset((char *) d->rcvcount, 0, sizeof(int) * m);
 
 	if ((adding) && (d->rpqueue)) {
 		for (j = 0; j < d->channels; j++)
--- linux-2.6.16-rc4/drivers/isdn/act2000/module.c.orig	2006-02-25 00:01:07.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/act2000/module.c	2006-02-25 00:01:21.000000000 +0100
@@ -567,12 +567,11 @@ act2000_alloccard(int bus, int port, int
 {
 	int i;
         act2000_card *card;
-        if (!(card = (act2000_card *) kmalloc(sizeof(act2000_card), GFP_KERNEL))) {
+        if (!(card = (act2000_card *) kzalloc(sizeof(act2000_card), GFP_KERNEL))) {
                 printk(KERN_WARNING
 		       "act2000: (%s) Could not allocate card-struct.\n", id);
                 return;
         }
-        memset((char *) card, 0, sizeof(act2000_card));
         spin_lock_init(&card->lock);
         spin_lock_init(&card->mnlock);
 	skb_queue_head_init(&card->sndq);
--- linux-2.6.16-rc4/drivers/isdn/icn/icn.c.orig	2006-02-25 00:01:30.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/icn/icn.c	2006-02-25 00:01:46.000000000 +0100
@@ -1518,12 +1518,11 @@ icn_initcard(int port, char *id)
 	icn_card *card;
 	int i;
 
-	if (!(card = (icn_card *) kmalloc(sizeof(icn_card), GFP_KERNEL))) {
+	if (!(card = (icn_card *) kzalloc(sizeof(icn_card), GFP_KERNEL))) {
 		printk(KERN_WARNING
 		       "icn: (%s) Could not allocate card-struct.\n", id);
 		return (icn_card *) 0;
 	}
-	memset((char *) card, 0, sizeof(icn_card));
 	spin_lock_init(&card->lock);
 	card->port = port;
 	card->interface.owner = THIS_MODULE;
--- linux-2.6.16-rc4/drivers/isdn/isdnloop/isdnloop.c.orig	2006-02-25 00:01:56.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/isdnloop/isdnloop.c	2006-02-25 00:02:09.000000000 +0100
@@ -1441,12 +1441,11 @@ isdnloop_initcard(char *id)
 	isdnloop_card *card;
 	int i;
 
-	if (!(card = (isdnloop_card *) kmalloc(sizeof(isdnloop_card), GFP_KERNEL))) {
+	if (!(card = (isdnloop_card *) kzalloc(sizeof(isdnloop_card), GFP_KERNEL))) {
 		printk(KERN_WARNING
 		 "isdnloop: (%s) Could not allocate card-struct.\n", id);
 		return (isdnloop_card *) 0;
 	}
-	memset((char *) card, 0, sizeof(isdnloop_card));
 	card->interface.owner = THIS_MODULE;
 	card->interface.channels = ISDNLOOP_BCH;
 	card->interface.hl_hdrlen  = 1; /* scratch area for storing ack flag*/ 
--- linux-2.6.16-rc4/drivers/isdn/hysdn/hysdn_net.c.orig	2006-02-25 00:02:24.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hysdn/hysdn_net.c	2006-02-25 00:02:38.000000000 +0100
@@ -278,11 +278,10 @@ hysdn_net_create(hysdn_card * card)
 		return (-ENOMEM);
 	}
 	hysdn_net_release(card);	/* release an existing net device */
-	if ((dev = kmalloc(sizeof(struct net_local), GFP_KERNEL)) == NULL) {
+	if ((dev = kzalloc(sizeof(struct net_local), GFP_KERNEL)) == NULL) {
 		printk(KERN_WARNING "HYSDN: unable to allocate mem\n");
 		return (-ENOMEM);
 	}
-	memset(dev, 0, sizeof(struct net_local));	/* clean the structure */
 
 	spin_lock_init(&((struct net_local *) dev)->lock);
 
--- linux-2.6.16-rc4/drivers/isdn/hysdn/hycapi.c.orig	2006-02-25 00:02:44.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hysdn/hycapi.c	2006-02-25 00:03:02.000000000 +0100
@@ -745,12 +745,11 @@ hycapi_capi_create(hysdn_card *card)
 		return 1;
 	}
 	if (!card->hyctrlinfo) {
-		cinfo = (hycapictrl_info *) kmalloc(sizeof(hycapictrl_info), GFP_ATOMIC);
+		cinfo = (hycapictrl_info *) kzalloc(sizeof(hycapictrl_info), GFP_ATOMIC);
 		if (!cinfo) {
 			printk(KERN_WARNING "HYSDN: no memory for capi-ctrl.\n");
 			return -ENOMEM;
 		}
-		memset(cinfo, 0, sizeof(hycapictrl_info));
 		card->hyctrlinfo = cinfo;
 		cinfo->card = card;
 		spin_lock_init(&cinfo->lock);
--- linux-2.6.16-rc4/drivers/isdn/hysdn/hysdn_proclog.c.orig	2006-02-25 00:03:14.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hysdn/hysdn_proclog.c	2006-02-25 00:03:32.000000000 +0100
@@ -408,8 +408,7 @@ hysdn_proclog_init(hysdn_card * card)
 
 	/* create a cardlog proc entry */
 
-	if ((pd = (struct procdata *) kmalloc(sizeof(struct procdata), GFP_KERNEL)) != NULL) {
-		memset(pd, 0, sizeof(struct procdata));
+	if ((pd = (struct procdata *) kzalloc(sizeof(struct procdata), GFP_KERNEL)) != NULL) {
 		sprintf(pd->log_name, "%s%d", PROC_LOG_BASENAME, card->myid);
 		if ((pd->log = create_proc_entry(pd->log_name, S_IFREG | S_IRUGO | S_IWUSR, hysdn_proc_entry)) != NULL) {
 		        pd->log->proc_fops = &log_fops; 
--- linux-2.6.16-rc4/drivers/isdn/hysdn/hysdn_init.c.orig	2006-02-25 00:03:42.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/hysdn/hysdn_init.c	2006-02-25 00:03:52.000000000 +0100
@@ -82,11 +82,10 @@ search_cards(void)
 		if (pci_enable_device(akt_pcidev))
 			continue;
 
-		if (!(card = kmalloc(sizeof(hysdn_card), GFP_KERNEL))) {
+		if (!(card = kzalloc(sizeof(hysdn_card), GFP_KERNEL))) {
 			printk(KERN_ERR "HYSDN: unable to alloc device mem \n");
 			return;
 		}
-		memset(card, 0, sizeof(hysdn_card));
 		card->myid = cardmax;	/* set own id */
 		card->bus = akt_pcidev->bus->number;
 		card->devfn = akt_pcidev->devfn;	/* slot + function */
--- linux-2.6.16-rc4/drivers/isdn/capi/capidrv.c.orig	2006-02-25 00:04:04.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/capi/capidrv.c	2006-02-25 00:04:41.000000000 +0100
@@ -334,12 +334,11 @@ static capidrv_plci *new_plci(capidrv_co
 {
 	capidrv_plci *plcip;
 
-	plcip = (capidrv_plci *) kmalloc(sizeof(capidrv_plci), GFP_ATOMIC);
+	plcip = (capidrv_plci *) kzalloc(sizeof(capidrv_plci), GFP_ATOMIC);
 
 	if (plcip == 0)
 		return NULL;
 
-	memset(plcip, 0, sizeof(capidrv_plci));
 	plcip->state = ST_PLCI_NONE;
 	plcip->plci = 0;
 	plcip->msgid = 0;
@@ -404,12 +403,11 @@ static inline capidrv_ncci *new_ncci(cap
 {
 	capidrv_ncci *nccip;
 
-	nccip = (capidrv_ncci *) kmalloc(sizeof(capidrv_ncci), GFP_ATOMIC);
+	nccip = (capidrv_ncci *) kzalloc(sizeof(capidrv_ncci), GFP_ATOMIC);
 
 	if (nccip == 0)
 		return NULL;
 
-	memset(nccip, 0, sizeof(capidrv_ncci));
 	nccip->ncci = ncci;
 	nccip->state = ST_NCCI_NONE;
 	nccip->plcip = plcip;
@@ -2004,12 +2002,11 @@ static int capidrv_addcontr(u16 contr, s
 		printk(KERN_WARNING "capidrv: (%s) Could not reserve module\n", id);
 		return -1;
 	}
-	if (!(card = (capidrv_contr *) kmalloc(sizeof(capidrv_contr), GFP_ATOMIC))) {
+	if (!(card = (capidrv_contr *) kzalloc(sizeof(capidrv_contr), GFP_ATOMIC))) {
 		printk(KERN_WARNING
 		 "capidrv: (%s) Could not allocate contr-struct.\n", id);
 		return -1;
 	}
-	memset(card, 0, sizeof(capidrv_contr));
 	card->owner = THIS_MODULE;
 	init_timer(&card->listentimer);
 	strcpy(card->name, id);
--- linux-2.6.16-rc4/drivers/isdn/capi/capi.c.orig	2006-02-25 00:04:47.000000000 +0100
+++ linux-2.6.16-rc4/drivers/isdn/capi/capi.c	2006-02-25 00:05:19.000000000 +0100
@@ -209,13 +209,12 @@ static struct capiminor *capiminor_alloc
 	unsigned int minor = 0;
 	unsigned long flags;
 
-	mp = kmalloc(sizeof(*mp), GFP_ATOMIC);
+	mp = kzalloc(sizeof(*mp), GFP_ATOMIC);
   	if (!mp) {
   		printk(KERN_ERR "capi: can't alloc capiminor\n");
 		return NULL;
 	}
 
-	memset(mp, 0, sizeof(struct capiminor));
 	mp->ap = ap;
 	mp->ncci = ncci;
 	mp->msgid = 0;
@@ -296,10 +295,9 @@ static struct capincci *capincci_alloc(s
 	struct capiminor *mp = NULL;
 #endif /* CONFIG_ISDN_CAPI_MIDDLEWARE */
 
-	np = kmalloc(sizeof(*np), GFP_ATOMIC);
+	np = kzalloc(sizeof(*np), GFP_ATOMIC);
 	if (!np)
 		return NULL;
-	memset(np, 0, sizeof(struct capincci));
 	np->ncci = ncci;
 	np->cdev = cdev;
 #ifdef CONFIG_ISDN_CAPI_MIDDLEWARE
@@ -376,10 +374,9 @@ static struct capidev *capidev_alloc(voi
 	struct capidev *cdev;
 	unsigned long flags;
 
-	cdev = kmalloc(sizeof(*cdev), GFP_KERNEL);
+	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
 	if (!cdev)
 		return NULL;
-	memset(cdev, 0, sizeof(struct capidev));
 
 	init_MUTEX(&cdev->ncci_list_sem);
 	skb_queue_head_init(&cdev->recvqueue);



--===============95274084055892549==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95274084055892549==--
