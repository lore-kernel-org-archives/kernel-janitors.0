From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 03 Aug 2007 17:37:09 +0000
Subject: [PATCH 12/13] dev->priv to netdev_priv(dev), for drivers/net/wan
Message-Id: <200708031737.TAA00878@ifs.emn.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org
Cc: jeff@garzik.org, netdev@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


Replacing accesses to dev->priv to netdev_priv(dev). The replacment
is safe when netdev_priv is used to access a private structure that is
right next to the net_device structure in memory. Cf
http://groups.google.com/group/comp.os.linux.development.system/browse_thre=
ad/thread/de19321bcd94dbb8/0d74a4adcd6177bd
This is the case when the net_device structure was allocated with
a call to alloc_netdev or one of its derivative.

Here is an excerpt of the semantic patch that performs the transformation

@ rule1 @
type T;
struct net_device *dev;
@@

 dev =3D=20
(
        alloc_netdev
|        =20
        alloc_etherdev
|
        alloc_trdev
)
   (sizeof(T), ...)

@ rule1bis @
struct net_device *dev;
expression E;
@@
 dev->priv =3D E

@ rule2 depends on rule1 && !rule1bis  @
struct net_device *dev;
type rule1.T;
@@

- (T*) dev->priv
+ netdev_priv(dev)

Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
Cc: jeff@garzik.org
Cc: netdev@vger.kernel.org
Cc: akpm@linux-foundation.org
---

 drivers/net/wan/dlci.c         |   30 +++++++++++++-------------
 drivers/net/wan/lmc/lmc_main.c |   26 +++++++++++------------
 drivers/net/wan/sdla.c         |   46 ++++++++++++++++++++----------------=
-----
 drivers/net/wan/sealevel.c     |   12 +++++-----
 drivers/net/wan/x25_asy.c      |   28 ++++++++++++------------
 5 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/drivers/net/wan/dlci.c b/drivers/net/wan/dlci.c
index 66be20c..d988161 100644
--- a/drivers/net/wan/dlci.c
+++ b/drivers/net/wan/dlci.c
@@ -74,7 +74,7 @@ static int dlci_header(struct sk_buff *s
 	unsigned int		hlen;
 	char			*dest;
=20
-	dlp =3D dev->priv;
+	dlp =3D netdev_priv(dev);
=20
 	hdr.control =3D FRAD_I_UI;
 	switch(type)
@@ -110,7 +110,7 @@ static void dlci_receive(struct sk_buff=20
 	struct frhdr		*hdr;
 	int					process, header;
=20
-	dlp =3D dev->priv;
+	dlp =3D netdev_priv(dev);
 	if (!pskb_may_pull(skb, sizeof(*hdr))) {
 		printk(KERN_NOTICE "%s: invalid data no header\n",
 		       dev->name);
@@ -197,7 +197,7 @@ static int dlci_transmit(struct sk_buff=20
 	if (!skb || !dev)
 		return(0);
=20
-	dlp =3D dev->priv;
+	dlp =3D netdev_priv(dev);
=20
 	netif_stop_queue(dev);
 =09
@@ -235,7 +235,7 @@ static int dlci_config(struct net_device
 	struct frad_local	*flp;
 	int			err;
=20
-	dlp =3D dev->priv;
+	dlp =3D netdev_priv(dev);
=20
 	flp =3D dlp->slave->priv;
=20
@@ -269,7 +269,7 @@ static int dlci_dev_ioctl(struct net_dev
 	if (!capable(CAP_NET_ADMIN))
 		return(-EPERM);
=20
-	dlp =3D dev->priv;
+	dlp =3D netdev_priv(dev);
=20
 	switch(cmd)
 	{
@@ -298,7 +298,7 @@ static int dlci_change_mtu(struct net_de
 {
 	struct dlci_local *dlp;
=20
-	dlp =3D dev->priv;
+	dlp =3D netdev_priv(dev);
=20
 	return((*dlp->slave->change_mtu)(dlp->slave, new_mtu));
 }
@@ -309,7 +309,7 @@ static int dlci_open(struct net_device *
 	struct frad_local	*flp;
 	int			err;
=20
-	dlp =3D dev->priv;
+	dlp =3D netdev_priv(dev);
=20
 	if (!*(short *)(dev->dev_addr))
 		return(-EINVAL);
@@ -335,7 +335,7 @@ static int dlci_close(struct net_device=20
=20
 	netif_stop_queue(dev);
=20
-	dlp =3D dev->priv;
+	dlp =3D netdev_priv(dev);
=20
 	flp =3D dlp->slave->priv;
 	err =3D (*flp->deactivate)(dlp->slave, dev);
@@ -347,7 +347,7 @@ static struct net_device_stats *dlci_get
 {
 	struct dlci_local *dlp;
=20
-	dlp =3D dev->priv;
+	dlp =3D netdev_priv(dev);
=20
 	return(&dlp->stats);
 }
@@ -365,7 +365,7 @@ static int dlci_add(struct dlci_add *dlc
 	if (!slave)
 		return -ENODEV;
=20
-	if (slave->type !=3D ARPHRD_FRAD || slave->priv =3D NULL)
+	if (slave->type !=3D ARPHRD_FRAD || netdev_priv(slave) =3D NULL)
 		goto err1;
=20
 	/* create device name */
@@ -391,11 +391,11 @@ static int dlci_add(struct dlci_add *dlc
=20
 	*(short *)(master->dev_addr) =3D dlci->dlci;
=20
-	dlp =3D (struct dlci_local *) master->priv;
+	dlp =3D netdev_priv(master);
 	dlp->slave =3D slave;
 	dlp->master =3D master;
=20
-	flp =3D slave->priv;
+	flp =3D netdev_priv(slave);
 	err =3D (*flp->assoc)(slave, master);
 	if (err < 0)
 		goto err2;
@@ -435,9 +435,9 @@ static int dlci_del(struct dlci_add *dlc
 		return(-EBUSY);
 	}
=20
-	dlp =3D master->priv;
+	dlp =3D netdev_priv(master);
 	slave =3D dlp->slave;
-	flp =3D slave->priv;
+	flp =3D netdev_priv(slave);
=20
 	rtnl_lock();
 	err =3D (*flp->deassoc)(slave, master);
@@ -487,7 +487,7 @@ static int dlci_ioctl(unsigned int cmd,=20
=20
 static void dlci_setup(struct net_device *dev)
 {
-	struct dlci_local *dlp =3D dev->priv;
+	struct dlci_local *dlp =3D netdev_priv(dev);
=20
 	dev->flags		=3D 0;
 	dev->open		=3D dlci_open;
diff --git a/drivers/net/wan/lmc/lmc_main.c b/drivers/net/wan/lmc/lmc_main.c
index ae132c1..9aa04a6 100644
--- a/drivers/net/wan/lmc/lmc_main.c
+++ b/drivers/net/wan/lmc/lmc_main.c
@@ -126,7 +126,7 @@ int lmc_ioctl (struct net_device *dev, s
=20
     ret =3D -EOPNOTSUPP;
=20
-    sc =3D dev->priv;
+    sc =3D netdev_priv(dev);
=20
     lmc_trace(dev, "lmc_ioctl in");
=20
@@ -634,7 +634,7 @@ static void lmc_watchdog (unsigned long=20
     u_int32_t ticks;
     unsigned long flags;
=20
-    sc =3D dev->priv;
+    sc =3D netdev_priv(dev);
=20
     lmc_trace(dev, "lmc_watchdog in");
=20
@@ -872,7 +872,7 @@ #endif
         lmc_first_load =3D 1;
     }
    =20
-    sc =3D dev->priv;
+    sc =3D netdev_priv(dev);
     sc->lmc_device =3D dev;
     sc->name =3D dev->name;
=20
@@ -1018,7 +1018,7 @@ static void __devexit lmc_remove_one (st
     struct net_device *dev =3D pci_get_drvdata(pdev);
    =20
     if (dev) {
-	    lmc_softc_t *sc =3D dev->priv;
+	    lmc_softc_t *sc =3D netdev_priv(dev);
 	   =20
 	    printk("%s: removing...\n", dev->name);
 	    lmc_proto_detach(sc);
@@ -1035,7 +1035,7 @@ static void __devexit lmc_remove_one (st
  */
 static int lmc_open (struct net_device *dev) /*fold00*/
 {
-    lmc_softc_t *sc =3D dev->priv;
+    lmc_softc_t *sc =3D netdev_priv(dev);
=20
     lmc_trace(dev, "lmc_open in");
=20
@@ -1153,7 +1153,7 @@ static int lmc_open (struct net_device *
 static void lmc_running_reset (struct net_device *dev) /*fold00*/
 {
=20
-    lmc_softc_t *sc =3D (lmc_softc_t *) dev->priv;
+    lmc_softc_t *sc =3D netdev_priv(dev);
=20
     lmc_trace(dev, "lmc_runnig_reset in");
=20
@@ -1194,7 +1194,7 @@ static int lmc_close (struct net_device=20
=20
     lmc_trace(dev, "lmc_close in");
    =20
-    sc =3D dev->priv;
+    sc =3D netdev_priv(dev);
     sc->lmc_ok =3D 0;
     sc->lmc_media->set_link_status (sc, 0);
     del_timer (&sc->timer);
@@ -1210,7 +1210,7 @@ static int lmc_close (struct net_device=20
 /* When the interface goes down, this is called */
 static int lmc_ifdown (struct net_device *dev) /*fold00*/
 {
-    lmc_softc_t *sc =3D dev->priv;
+    lmc_softc_t *sc =3D netdev_priv(dev);
     u32 csr6;
     int i;
=20
@@ -1287,7 +1287,7 @@ static irqreturn_t lmc_interrupt (int ir
=20
     lmc_trace(dev, "lmc_interrupt in");
=20
-    sc =3D dev->priv;
+    sc =3D netdev_priv(dev);
    =20
     spin_lock(&sc->lmc_lock);
=20
@@ -1473,7 +1473,7 @@ static int lmc_start_xmit (struct sk_buf
=20
     lmc_trace(dev, "lmc_start_xmit in");
=20
-    sc =3D dev->priv;
+    sc =3D netdev_priv(dev);
=20
     spin_lock_irqsave(&sc->lmc_lock, flags);
=20
@@ -1570,7 +1570,7 @@ static int lmc_rx (struct net_device *de
=20
     lmc_trace(dev, "lmc_rx in");
=20
-    sc =3D dev->priv;
+    sc =3D netdev_priv(dev);
=20
     lmc_led_on(sc, LMC_DS3_LED3);
=20
@@ -1764,7 +1764,7 @@ skip_out_of_mem:
=20
 static struct net_device_stats *lmc_get_stats (struct net_device *dev) /*f=
old00*/
 {
-    lmc_softc_t *sc =3D dev->priv;
+    lmc_softc_t *sc =3D netdev_priv(dev);
     unsigned long flags;
=20
     lmc_trace(dev, "lmc_get_stats in");
@@ -2145,7 +2145,7 @@ static void lmc_driver_timeout(struct ne
=20
     lmc_trace(dev, "lmc_driver_timeout in");
=20
-    sc =3D dev->priv;
+    sc =3D netdev_priv(dev);
=20
     spin_lock_irqsave(&sc->lmc_lock, flags);
=20
diff --git a/drivers/net/wan/sdla.c b/drivers/net/wan/sdla.c
index 792e588..a2f1849 100644
--- a/drivers/net/wan/sdla.c
+++ b/drivers/net/wan/sdla.c
@@ -185,7 +185,7 @@ static void sdla_stop(struct net_device=20
 {
 	struct frad_local *flp;
=20
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
 	switch(flp->type)
 	{
 		case SDLA_S502A:
@@ -212,7 +212,7 @@ static void sdla_start(struct net_device
 {
 	struct frad_local *flp;
=20
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
 	switch(flp->type)
 	{
 		case SDLA_S502A:
@@ -432,7 +432,7 @@ static int sdla_cmd(struct net_device *d
 	int                      ret, waiting, len;
 	long                     window;
=20
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
 	window =3D flp->type =3D SDLA_S508 ? SDLA_508_CMD_BUF : SDLA_502_CMD_BUF;
 	cmd_buf =3D (struct sdla_cmd *)(dev->mem_start + (window & SDLA_ADDR_MASK=
));
 	ret =3D 0;
@@ -509,7 +509,7 @@ static int sdla_activate(struct net_devi
 	struct frad_local *flp;
 	int i;
=20
-	flp =3D slave->priv;
+	flp =3D netdev_priv(slave);
=20
 	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
 		if (flp->master[i] =3D master)
@@ -531,7 +531,7 @@ static int sdla_deactivate(struct net_de
 	struct frad_local *flp;
 	int               i;
=20
-	flp =3D slave->priv;
+	flp =3D netdev_priv(slave);
=20
 	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
 		if (flp->master[i] =3D master)
@@ -556,7 +556,7 @@ static int sdla_assoc(struct net_device=20
 	if (master->type !=3D ARPHRD_DLCI)
 		return(-EINVAL);
=20
-	flp =3D slave->priv;
+	flp =3D netdev_priv(slave);
=20
 	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
 	{
@@ -589,7 +589,7 @@ static int sdla_deassoc(struct net_devic
 	struct frad_local *flp;
 	int               i;
=20
-	flp =3D slave->priv;
+	flp =3D netdev_priv(slave);
=20
 	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
 		if (flp->master[i] =3D master)
@@ -619,7 +619,7 @@ static int sdla_dlci_conf(struct net_dev
 	int               i;
 	short             len, ret;
=20
-	flp =3D slave->priv;
+	flp =3D netdev_priv(slave);
=20
 	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
 		if (flp->master[i] =3D master)
@@ -628,7 +628,7 @@ static int sdla_dlci_conf(struct net_dev
 	if (i =3D CONFIG_DLCI_MAX)
 		return(-ENODEV);
=20
-	dlp =3D master->priv;
+	dlp =3D netdev_priv(master);
=20
 	ret =3D SDLA_RET_OK;
 	len =3D sizeof(struct dlci_conf);
@@ -659,7 +659,7 @@ static int sdla_transmit(struct sk_buff=20
 	unsigned long     flags;
 	struct buf_entry  *pbuf;
=20
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
 	ret =3D 0;
 	accept =3D 1;
=20
@@ -755,7 +755,7 @@ static void sdla_receive(struct net_devi
 	int               i=3D0, received, success, addr, buf_base, buf_top;
 	short             dlci, len, len2, split;
=20
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
 	success =3D 1;
 	received =3D addr =3D buf_top =3D buf_base =3D 0;
 	len =3D dlci =3D 0;
@@ -860,7 +860,7 @@ static void sdla_receive(struct net_devi
 	if (success)
 	{
 		flp->stats.rx_packets++;
-		dlp =3D master->priv;
+		dlp =3D netdev_priv(master);
 		(*dlp->receive)(skb, master);
 	}
=20
@@ -924,7 +924,7 @@ static void sdla_poll(unsigned long devi
 	struct frad_local *flp;
=20
 	dev =3D (struct net_device *) device;
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
=20
 	if (sdla_byte(dev, SDLA_502_RCV_BUF))
 		sdla_receive(dev);
@@ -940,7 +940,7 @@ static int sdla_close(struct net_device=20
 	int               len, i;
 	short             dlcis[CONFIG_DLCI_MAX];
=20
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
=20
 	len =3D 0;
 	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
@@ -1001,7 +1001,7 @@ static int sdla_open(struct net_device *
 	int               len, i;
 	char              byte;
=20
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
=20
 	if (!flp->initialized)
 		return(-EPERM);
@@ -1098,7 +1098,7 @@ static int sdla_config(struct net_device
 	if (dev->type =3D 0xFFFF)
 		return(-EUNATCH);
=20
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
=20
 	if (!get)
 	{
@@ -1229,7 +1229,7 @@ static int sdla_reconfig(struct net_devi
 	struct conf_data  data;
 	int               i, len;
=20
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
=20
 	len =3D 0;
 	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
@@ -1254,7 +1254,7 @@ static int sdla_ioctl(struct net_device=20
 	if(!capable(CAP_NET_ADMIN))
 		return -EPERM;
 	=09
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
=20
 	if (!flp->initialized)
 		return(-EINVAL);
@@ -1320,7 +1320,7 @@ static int sdla_change_mtu(struct net_de
 {
 	struct frad_local *flp;
=20
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
=20
 	if (netif_running(dev))
 		return(-EBUSY);
@@ -1337,7 +1337,7 @@ static int sdla_set_config(struct net_de
 	unsigned base;
 	int err =3D -EINVAL;
=20
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
=20
 	if (flp->initialized)
 		return(-EINVAL);
@@ -1592,14 +1592,14 @@ fail:
 static struct net_device_stats *sdla_stats(struct net_device *dev)
 {
 	struct frad_local *flp;
-	flp =3D dev->priv;
+	flp =3D netdev_priv(dev);
=20
 	return(&flp->stats);
 }
=20
 static void setup_sdla(struct net_device *dev)
 {
-	struct frad_local *flp =3D dev->priv;
+	struct frad_local *flp =3D netdev_priv(dev);
=20
 	netdev_boot_setup_check(dev);
=20
@@ -1651,7 +1651,7 @@ static int __init init_sdla(void)
=20
 static void __exit exit_sdla(void)
 {
-	struct frad_local *flp =3D sdla->priv;
+	struct frad_local *flp =3D netdev_priv(sdla);
=20
 	unregister_netdev(sdla);
 	if (flp->initialized) {
diff --git a/drivers/net/wan/sealevel.c b/drivers/net/wan/sealevel.c
index 11276bf..4414901 100644
--- a/drivers/net/wan/sealevel.c
+++ b/drivers/net/wan/sealevel.c
@@ -77,7 +77,7 @@ static void sealevel_input(struct z8530_
 =20
 static int sealevel_open(struct net_device *d)
 {
-	struct slvl_device *slvl=3Dd->priv;
+	struct slvl_device *slvl=3Dnetdev_priv(d);
 	int err =3D -1;
 	int unit =3D slvl->channel;
 =09
@@ -126,7 +126,7 @@ static int sealevel_open(struct net_devi
=20
 static int sealevel_close(struct net_device *d)
 {
-	struct slvl_device *slvl=3Dd->priv;
+	struct slvl_device *slvl=3Dnetdev_priv(d);
 	int unit =3D slvl->channel;
 =09
 	/*
@@ -166,7 +166,7 @@ static int sealevel_ioctl(struct net_dev
=20
 static struct net_device_stats *sealevel_get_stats(struct net_device *d)
 {
-	struct slvl_device *slvl=3Dd->priv;
+	struct slvl_device *slvl=3Dnetdev_priv(d);
 	if(slvl)
 		return z8530_get_stats(slvl->chan);
 	else
@@ -179,7 +179,7 @@ static struct net_device_stats *sealevel
 =20
 static int sealevel_queue_xmit(struct sk_buff *skb, struct net_device *d)
 {
-	struct slvl_device *slvl=3Dd->priv;
+	struct slvl_device *slvl=3Dnetdev_priv(d);
 	return z8530_queue_xmit(slvl->chan, skb);
 }
=20
@@ -204,7 +204,7 @@ static int sealevel_neigh_setup_dev(stru
=20
 static int sealevel_attach(struct net_device *dev)
 {
-	struct slvl_device *sv =3D dev->priv;
+	struct slvl_device *sv =3D netdev_priv(dev);
 	sppp_attach(&sv->pppdev);
 	return 0;
 }
@@ -240,7 +240,7 @@ static inline struct slvl_device *slvl_a
 	if (!d)=20
 		return NULL;
=20
-	sv =3D d->priv;
+	sv =3D netdev_priv(d);
 	sv->if_ptr =3D &sv->pppdev;
 	sv->pppdev.dev =3D d;
 	d->base_addr =3D iobase;
diff --git a/drivers/net/wan/x25_asy.c b/drivers/net/wan/x25_asy.c
index c48b1cc..d62821d 100644
--- a/drivers/net/wan/x25_asy.c
+++ b/drivers/net/wan/x25_asy.c
@@ -63,7 +63,7 @@ static struct x25_asy *x25_asy_alloc(voi
 		if (dev =3D NULL)
 			break;
=20
-		sl =3D dev->priv;
+		sl =3D netdev_priv(dev);
 		/* Not in use ? */
 		if (!test_and_set_bit(SLF_INUSE, &sl->flags))
 			return sl;
@@ -85,7 +85,7 @@ static struct x25_asy *x25_asy_alloc(voi
 			return NULL;
=20
 		/* Initialize channel control data */
-		sl =3D dev->priv;
+		sl =3D netdev_priv(dev);
 		dev->base_addr    =3D i;
=20
 		/* register device so that it can be ifconfig'ed       */
@@ -119,7 +119,7 @@ static void x25_asy_free(struct x25_asy=20
=20
 static int x25_asy_change_mtu(struct net_device *dev, int newmtu)
 {
-	struct x25_asy *sl =3D dev->priv;
+	struct x25_asy *sl =3D netdev_priv(dev);
 	unsigned char *xbuff, *rbuff;
 	int len =3D 2* newmtu;
=20
@@ -282,7 +282,7 @@ static void x25_asy_write_wakeup(struct=20
=20
 static void x25_asy_timeout(struct net_device *dev)
 {
-	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
+	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
=20
 	spin_lock(&sl->lock);
 	if (netif_queue_stopped(dev)) {
@@ -303,7 +303,7 @@ static void x25_asy_timeout(struct net_d
=20
 static int x25_asy_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
+	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
 	int err;
=20
 	if (!netif_running(sl->dev)) {
@@ -372,7 +372,7 @@ static int x25_asy_data_indication(struc
 =20
 static void x25_asy_data_transmit(struct net_device *dev, struct sk_buff *=
skb)
 {
-	struct x25_asy *sl=DEv->priv;
+	struct x25_asy *sl=3Dnetdev_priv(dev);
 =09
 	spin_lock(&sl->lock);
 	if (netif_queue_stopped(sl->dev) || sl->tty =3D NULL)
@@ -399,7 +399,7 @@ static void x25_asy_data_transmit(struct
 =20
 static void x25_asy_connected(struct net_device *dev, int reason)
 {
-	struct x25_asy *sl =3D dev->priv;
+	struct x25_asy *sl =3D netdev_priv(dev);
 	struct sk_buff *skb;
 	unsigned char *ptr;
=20
@@ -418,7 +418,7 @@ static void x25_asy_connected(struct net
=20
 static void x25_asy_disconnected(struct net_device *dev, int reason)
 {
-	struct x25_asy *sl =3D dev->priv;
+	struct x25_asy *sl =3D netdev_priv(dev);
 	struct sk_buff *skb;
 	unsigned char *ptr;
=20
@@ -449,7 +449,7 @@ static struct lapb_register_struct x25_a
 /* Open the low-level part of the X.25 channel. Easy! */
 static int x25_asy_open(struct net_device *dev)
 {
-	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
+	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
 	unsigned long len;
 	int err;
=20
@@ -499,7 +499,7 @@ norbuff:
 /* Close the low-level part of the X.25 channel. Easy! */
 static int x25_asy_close(struct net_device *dev)
 {
-	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
+	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
 	int err;
=20
 	spin_lock(&sl->lock);
@@ -615,7 +615,7 @@ static void x25_asy_close_tty(struct tty
=20
 static struct net_device_stats *x25_asy_get_stats(struct net_device *dev)
 {
-	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
+	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
=20
 	return &sl->stats;
 }
@@ -730,7 +730,7 @@ static int x25_asy_ioctl(struct tty_stru
=20
 static int x25_asy_open_dev(struct net_device *dev)
 {
-	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
+	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
 	if(sl->tty=3DNULL)
 		return -ENODEV;
 	return 0;
@@ -739,7 +739,7 @@ static int x25_asy_open_dev(struct net_d
 /* Initialise the X.25 driver.  Called by the device init code */
 static void x25_asy_setup(struct net_device *dev)
 {
-	struct x25_asy *sl =3D dev->priv;
+	struct x25_asy *sl =3D netdev_priv(dev);
=20
 	sl->magic  =3D X25_ASY_MAGIC;
 	sl->dev	   =3D dev;
@@ -805,7 +805,7 @@ static void __exit exit_x25_asy(void)
 	for (i =3D 0; i < x25_asy_maxdev; i++) {
 		dev =3D x25_asy_devs[i];
 		if (dev) {
-			struct x25_asy *sl =3D dev->priv;
+			struct x25_asy *sl =3D netdev_priv(dev);
=20
 			spin_lock_bh(&sl->lock);
 			if (sl->tty)=20

