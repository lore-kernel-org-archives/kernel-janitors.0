From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 27 Feb 2006 11:16:21 +0000
Subject: Re: [KJ] [Patch] kzalloc() conversion in drivers/atm
Message-Id: <1141038982.26882.0.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87483293494635017=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============87483293494635017==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2006-02-27 at 10:43 +0100, Tobias Klauser wrote:
> On 2006-02-27 at 10:22:36 +0100, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> > --- linux-2.6.16-rc4/drivers/atm/adummy.c.orig	2006-02-27 09:02:51.000000000 +0100
> > +++ linux-2.6.16-rc4/drivers/atm/adummy.c	2006-02-27 09:03:09.000000000 +0100
> > @@ -114,14 +114,13 @@ static int __init adummy_init(void)
> >  
> >  	printk(KERN_ERR "adummy: version %s\n", DRV_VERSION);
> >  
> > -	adummy_dev = (struct adummy_dev *) kmalloc(sizeof(struct adummy_dev),
> > +	adummy_dev = (struct adummy_dev *) kzalloc(sizeof(struct adummy_dev),
> >  						   GFP_KERNEL);
> 
> Casting kmalloc/kzalloc return values is not necessary.

here is an updated patch. Also compile tested with allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/drivers/atm/adummy.c.orig	2006-02-27 09:02:51.000000000 +0100
+++ linux-2.6.16-rc4/drivers/atm/adummy.c	2006-02-27 11:33:33.000000000 +0100
@@ -114,14 +114,12 @@ static int __init adummy_init(void)
 
 	printk(KERN_ERR "adummy: version %s\n", DRV_VERSION);
 
-	adummy_dev = (struct adummy_dev *) kmalloc(sizeof(struct adummy_dev),
-						   GFP_KERNEL);
+	adummy_dev = kzalloc(sizeof(struct adummy_dev), GFP_KERNEL);
 	if (!adummy_dev) {
-		printk(KERN_ERR DEV_LABEL ": kmalloc() failed\n");
+		printk(KERN_ERR DEV_LABEL ": kzalloc() failed\n");
 		err = -ENOMEM;
 		goto out;
 	}
-	memset(adummy_dev, 0, sizeof(struct adummy_dev));
 
 	atm_dev = atm_dev_register(DEV_LABEL, &adummy_ops, -1, NULL);
 	if (!atm_dev) {
--- linux-2.6.16-rc4/drivers/atm/he.c.orig	2006-02-27 09:03:20.000000000 +0100
+++ linux-2.6.16-rc4/drivers/atm/he.c	2006-02-27 11:34:34.000000000 +0100
@@ -384,13 +384,11 @@ he_init_one(struct pci_dev *pci_dev, con
 	}
 	pci_set_drvdata(pci_dev, atm_dev);
 
-	he_dev = (struct he_dev *) kmalloc(sizeof(struct he_dev),
-							GFP_KERNEL);
+	he_dev = kzalloc(sizeof(struct he_dev), GFP_KERNEL);
 	if (!he_dev) {
 		err = -ENOMEM;
 		goto init_one_failure;
 	}
-	memset(he_dev, 0, sizeof(struct he_dev));
 
 	he_dev->pci_dev = pci_dev;
 	he_dev->atm_dev = atm_dev;
--- linux-2.6.16-rc4/drivers/atm/idt77252.c.orig	2006-02-27 09:13:10.000000000 +0100
+++ linux-2.6.16-rc4/drivers/atm/idt77252.c	2006-02-27 11:35:35.000000000 +0100
@@ -642,10 +642,9 @@ alloc_scq(struct idt77252_dev *card, int
 {
 	struct scq_info *scq;
 
-	scq = (struct scq_info *) kmalloc(sizeof(struct scq_info), GFP_KERNEL);
+	scq = kzalloc(sizeof(struct scq_info), GFP_KERNEL);
 	if (!scq)
 		return NULL;
-	memset(scq, 0, sizeof(struct scq_info));
 
 	scq->base = pci_alloc_consistent(card->pcidev, SCQ_SIZE,
 					 &scq->paddr);
@@ -2142,10 +2141,9 @@ idt77252_init_est(struct vc_map *vc, int
 {
 	struct rate_estimator *est;
 
-	est = kmalloc(sizeof(struct rate_estimator), GFP_KERNEL);
+	est = kzalloc(sizeof(struct rate_estimator), GFP_KERNEL);
 	if (!est)
 		return NULL;
-	memset(est, 0, sizeof(*est));
 
 	est->maxcps = pcr < 0 ? -pcr : pcr;
 	est->cps = est->maxcps;
@@ -2451,13 +2449,12 @@ idt77252_open(struct atm_vcc *vcc)
 
 	index = VPCI2VC(card, vpi, vci);
 	if (!card->vcs[index]) {
-		card->vcs[index] = kmalloc(sizeof(struct vc_map), GFP_KERNEL);
+		card->vcs[index] = kzalloc(sizeof(struct vc_map), GFP_KERNEL);
 		if (!card->vcs[index]) {
 			printk("%s: can't alloc vc in open()\n", card->name);
 			up(&card->mutex);
 			return -ENOMEM;
 		}
-		memset(card->vcs[index], 0, sizeof(struct vc_map));
 
 		card->vcs[index]->card = card;
 		card->vcs[index]->index = index;
@@ -2926,12 +2923,11 @@ open_card_oam(struct idt77252_dev *card)
 		for (vci = 3; vci < 5; vci++) {
 			index = VPCI2VC(card, vpi, vci);
 
-			vc = kmalloc(sizeof(struct vc_map), GFP_KERNEL);
+			vc = kzalloc(sizeof(struct vc_map), GFP_KERNEL);
 			if (!vc) {
 				printk("%s: can't alloc vc\n", card->name);
 				return -ENOMEM;
 			}
-			memset(vc, 0, sizeof(struct vc_map));
 
 			vc->index = index;
 			card->vcs[index] = vc;
@@ -2995,12 +2991,11 @@ open_card_ubr0(struct idt77252_dev *card
 {
 	struct vc_map *vc;
 
-	vc = kmalloc(sizeof(struct vc_map), GFP_KERNEL);
+	vc = kzalloc(sizeof(struct vc_map), GFP_KERNEL);
 	if (!vc) {
 		printk("%s: can't alloc vc\n", card->name);
 		return -ENOMEM;
 	}
-	memset(vc, 0, sizeof(struct vc_map));
 	card->vcs[0] = vc;
 	vc->class = SCHED_UBR0;
 
@@ -3695,13 +3690,12 @@ idt77252_init_one(struct pci_dev *pcidev
 		goto err_out_disable_pdev;
 	}
 
-	card = kmalloc(sizeof(struct idt77252_dev), GFP_KERNEL);
+	card = kzalloc(sizeof(struct idt77252_dev), GFP_KERNEL);
 	if (!card) {
 		printk("idt77252-%d: can't allocate private data\n", index);
 		err = -ENOMEM;
 		goto err_out_disable_pdev;
 	}
-	memset(card, 0, sizeof(struct idt77252_dev));
 
 	card->revision = revision;
 	card->index = index;
--- linux-2.6.16-rc4/drivers/atm/iphase.c.orig	2006-02-27 09:14:41.000000000 +0100
+++ linux-2.6.16-rc4/drivers/atm/iphase.c	2006-02-27 09:16:20.000000000 +0100
@@ -1601,14 +1601,13 @@ static int rx_init(struct atm_dev *dev) 
   
 	skb_queue_head_init(&iadev->rx_dma_q);  
 	iadev->rx_free_desc_qhead = NULL;   
-	iadev->rx_open = kmalloc(4*iadev->num_vc,GFP_KERNEL);
+	iadev->rx_open = kzalloc(4*iadev->num_vc,GFP_KERNEL);
 	if (!iadev->rx_open)  
 	{  
 		printk(KERN_ERR DEV_LABEL "itf %d couldn't get free page\n",
 		dev->number);  
 		goto err_free_dle;
 	}  
-	memset(iadev->rx_open, 0, 4*iadev->num_vc);  
         iadev->rxing = 1;
         iadev->rx_pkt_cnt = 0;
 	/* Mode Register */  
@@ -3174,12 +3173,11 @@ static int __devinit ia_init_one(struct 
         unsigned long flags;
 	int ret;
 
-	iadev = kmalloc(sizeof(*iadev), GFP_KERNEL); 
+	iadev = kzalloc(sizeof(*iadev), GFP_KERNEL); 
 	if (!iadev) {
 		ret = -ENOMEM;
 		goto err_out;
 	}
-	memset(iadev, 0, sizeof(*iadev));
 	iadev->pci = pdev;
 
 	IF_INIT(printk("ia detected at bus:%d dev: %d function:%d\n",
--- linux-2.6.16-rc4/drivers/atm/firestream.c.orig	2006-02-27 09:16:29.000000000 +0100
+++ linux-2.6.16-rc4/drivers/atm/firestream.c	2006-02-27 09:17:37.000000000 +0100
@@ -1782,7 +1782,7 @@ static int __devinit fs_init (struct fs_
 		write_fs (dev, RAM, (1 << (28 - FS155_VPI_BITS - FS155_VCI_BITS)) - 1);
 		dev->nchannels = FS155_NR_CHANNELS;
 	}
-	dev->atm_vccs = kmalloc (dev->nchannels * sizeof (struct atm_vcc *), 
+	dev->atm_vccs = kcalloc(dev->nchannels, sizeof (struct atm_vcc *), 
 				 GFP_KERNEL);
 	fs_dprintk (FS_DEBUG_ALLOC, "Alloc atmvccs: %p(%Zd)\n",
 		    dev->atm_vccs, dev->nchannels * sizeof (struct atm_vcc *));
@@ -1792,9 +1792,8 @@ static int __devinit fs_init (struct fs_
 		/* XXX Clean up..... */
 		return 1;
 	}
-	memset (dev->atm_vccs, 0, dev->nchannels * sizeof (struct atm_vcc *));
 
-	dev->tx_inuse = kmalloc (dev->nchannels / 8 /* bits/byte */ , GFP_KERNEL);
+	dev->tx_inuse = kzalloc (dev->nchannels / 8 /* bits/byte */ , GFP_KERNEL);
 	fs_dprintk (FS_DEBUG_ALLOC, "Alloc tx_inuse: %p(%d)\n", 
 		    dev->atm_vccs, dev->nchannels / 8);
 
@@ -1803,7 +1802,6 @@ static int __devinit fs_init (struct fs_
 		/* XXX Clean up..... */
 		return 1;
 	}
-	memset (dev->tx_inuse, 0, dev->nchannels / 8);
 
 	/* -- RAS1 : FS155 and 50 differ. Default (0) should be OK for both */
 	/* -- RAS2 : FS50 only: Default is OK. */
@@ -1891,14 +1889,12 @@ static int __devinit firestream_init_one
 	if (pci_enable_device(pci_dev)) 
 		goto err_out;
 
-	fs_dev = kmalloc (sizeof (struct fs_dev), GFP_KERNEL);
+	fs_dev = kzalloc (sizeof (struct fs_dev), GFP_KERNEL);
 	fs_dprintk (FS_DEBUG_ALLOC, "Alloc fs-dev: %p(%Zd)\n",
 		    fs_dev, sizeof (struct fs_dev));
 	if (!fs_dev)
 		goto err_out;
 
-	memset (fs_dev, 0, sizeof (struct fs_dev));
-  
 	atm_dev = atm_dev_register("fs", &ops, -1, NULL);
 	if (!atm_dev)
 		goto err_out_free_fs_dev;
--- linux-2.6.16-rc4/drivers/atm/zatm.c.orig	2006-02-27 09:17:47.000000000 +0100
+++ linux-2.6.16-rc4/drivers/atm/zatm.c	2006-02-27 09:18:24.000000000 +0100
@@ -604,9 +604,9 @@ static int start_rx(struct atm_dev *dev)
 DPRINTK("start_rx\n");
 	zatm_dev = ZATM_DEV(dev);
 	size = sizeof(struct atm_vcc *)*zatm_dev->chans;
-	zatm_dev->rx_map = (struct atm_vcc **) kmalloc(size,GFP_KERNEL);
-	if (!zatm_dev->rx_map) return -ENOMEM;
-	memset(zatm_dev->rx_map,0,size);
+	zatm_dev->rx_map = (struct atm_vcc **) kzalloc(size, GFP_KERNEL);
+	if (!zatm_dev->rx_map)
+		return -ENOMEM;
 	/* set VPI/VCI split (use all VCIs and give what's left to VPIs) */
 	zpokel(zatm_dev,(1 << dev->ci_range.vci_bits)-1,uPD98401_VRR);
 	/* prepare free buffer pools */
@@ -952,9 +952,9 @@ static int open_tx_first(struct atm_vcc 
 	skb_queue_head_init(&zatm_vcc->tx_queue);
 	init_waitqueue_head(&zatm_vcc->tx_wait);
 	/* initialize ring */
-	zatm_vcc->ring = kmalloc(RING_SIZE,GFP_KERNEL);
-	if (!zatm_vcc->ring) return -ENOMEM;
-	memset(zatm_vcc->ring,0,RING_SIZE);
+	zatm_vcc->ring = kzalloc(RING_SIZE, GFP_KERNEL);
+	if (!zatm_vcc->ring)
+		return -ENOMEM;
 	loop = zatm_vcc->ring+RING_ENTRIES*RING_WORDS;
 	loop[0] = uPD98401_TXPD_V;
 	loop[1] = loop[2] = 0;



--===============87483293494635017==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87483293494635017==--
