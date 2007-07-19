From: "Alexey Dobriyan" <adobriyan@gmail.com>
Date: Thu, 19 Jul 2007 13:34:16 +0000
Subject: Re: netdev_priv()
Message-Id: <b6fcc0a0707190634o7bf9aa1cy6fd9c98180252171@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

This reminds me OOP wankers adding private members to class and
two accessors per member of get_foo, set_foo variety instead of
simple assignments.

General direction is that struct net_device::priv will be made integer,
If yes, patch is OK, if not -- quite reverse patch should be done.

On 7/19/07, Yoann Padioleau <padator@wanadoo.fr> wrote:
> "Thomas Surrel" <thomas.surrel@gmail.com> writes:
>
> >> @@
> >> struct net_device *dev;
> >> type T;
> >> @@
> >>
> >> - (T) dev->priv
> >> + netdev_priv(dev)
> >>
> >>
> >
> > Sounds good. But from what I saw, you have to be really careful with
> > what your semantic patch would do. Correct me if I am wrong, but the
> > point of using netdev_priv is to access a private structure that is
> > right next to the net_device structure in memory.
>
> Yes, you are right according to
> http://groups.google.com/group/comp.os.linux.development.system/browse_th=
read/thread/de19321bcd94dbb8/0d74a4adcd6177bd
>
> Thanks for pointing out a problem. I have refined my semantic patch:
>
> @ rule1 @
> type T;
> struct net_device *dev;
> @@
>
>  dev =3D alloc_netdev(sizeof(T), ...)
>
>
> @ rule1bis @
> struct net_device *dev;
> expression E;
> @@
>  dev->priv =3D E
>
>
> @ rule2 depends on rule1 && !rule1bis  @
> struct net_device *dev;
> type rule1.T;
> @@
>
> - (T*) dev->priv
> + netdev_priv(dev)
>
>
> @ rule3 depends on rule1 && !rule1bis @
> struct net_device *dev;
> @@
>
> - dev->priv
> + netdev_priv(dev)
>
>
>
> I have put the generated patch in the end of this mail for all drivers
> under drivers/net/. Because of the new condition on alloc_netdev, the pat=
ch
> does not touch anymore net/wireless/libertas/main.c.
>
> > Unfortunately, some
> > drivers are allocating their private structure in other memory area,
> > e.g. net/wireless/libertas/main.c:
> >
> > int libertas_add_mesh(wlan_private *priv, struct device *dev)
> > {
> > 	struct net_device *mesh_dev =3D NULL;
> > 	int ret =3D 0;
> >
> > 	lbs_deb_enter(LBS_DEB_MESH);
> >
> > 	/* Allocate a virtual mesh device */
> > 	if (!(mesh_dev =3D alloc_netdev(0, "msh%d", ether_setup))) {
> > 		lbs_deb_mesh("init mshX device failed\n");
> > 		ret =3D -ENOMEM;
> > 		goto done;
> > 	}
> > 	mesh_dev->priv =3D priv;
> > 	priv->mesh_dev =3D mesh_dev;
> > 	[...]
> >
> > In that case, using netdev_priv() would break things. I guess we
> > should not try to change anything to these drivers.
>
> That's what my new semantic patch does. But maybe I am now too
> restrictive. Do you know other conditions where we can safely
> do the transformation ?
>
> >
> > Regards,
> >
> > Thomas
>
>
>
>  arcnet/arcnet.c     |   32 +++++++++++++-------------
>  bonding/bond_main.c |   62
> ++++++++++++++++++++++++++--------------------------
>  shaper.c            |   16 ++++++-------
>  wan/dlci.c          |   30 ++++++++++++-------------
>  wan/lmc/lmc_main.c  |   26 ++++++++++-----------
>  wan/sdla.c          |   46 +++++++++++++++++++-------------------
>  wan/sealevel.c      |   12 +++++-----
>  wan/x25_asy.c       |   28 +++++++++++------------
>  wireless/strip.c    |    2 -
>  9 files changed, 127 insertions(+), 127 deletions(-)
>
>
>
>
> diff --git a/drivers/net/arcnet/arcnet.c b/drivers/net/arcnet/arcnet.c
> index 681e20b..230b545 100644
> --- a/drivers/net/arcnet/arcnet.c
> +++ b/drivers/net/arcnet/arcnet.c
> @@ -181,7 +181,7 @@ #if (ARCNET_DEBUG_MAX & (D_RX | D_TX))
>  static void arcnet_dump_packet(struct net_device *dev, int bufnum,
>  			       char *desc, int take_arcnet_lock)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>  	int i, length;
>  	unsigned long flags =3D 0;
>  	static uint8_t buf[512];
> @@ -247,7 +247,7 @@ void arcnet_unregister_proto(struct ArcP
>   */
>  static void release_arcbuf(struct net_device *dev, int bufnum)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>  	int i;
>
>  	lp->buf_queue[lp->first_free_buf++] =3D bufnum;
> @@ -269,7 +269,7 @@ static void release_arcbuf(struct net_de
>   */
>  static int get_arcbuf(struct net_device *dev)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>  	int buf =3D -1, i;
>
>  	if (!atomic_dec_and_test(&lp->buf_lock)) {
> @@ -353,7 +353,7 @@ struct net_device *alloc_arcdev(char *na
>  	dev =3D alloc_netdev(sizeof(struct arcnet_local),
>  			   name && *name ? name : "arc%d", arcdev_setup);
>  	if(dev) {
> -		struct arcnet_local *lp =3D (struct arcnet_local *) dev->priv;
> +		struct arcnet_local *lp =3D netdev_priv(dev);
>  		spin_lock_init(&lp->lock);
>  	}
>
> @@ -370,7 +370,7 @@ struct net_device *alloc_arcdev(char *na
>   */
>  static int arcnet_open(struct net_device *dev)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>  	int count, newmtu, error;
>
>  	BUGMSG(D_INIT,"opened.");
> @@ -470,7 +470,7 @@ static int arcnet_open(struct net_device
>  /* The inverse routine to arcnet_open - shuts down the card. */
>  static int arcnet_close(struct net_device *dev)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>
>  	netif_stop_queue(dev);
>
> @@ -491,7 +491,7 @@ static int arcnet_header(struct sk_buff
>  			 unsigned short type, void *daddr, void *saddr,
>  			 unsigned len)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>  	uint8_t _daddr, proto_num;
>  	struct ArcProto *proto;
>
> @@ -552,7 +552,7 @@ static int arcnet_header(struct sk_buff
>  static int arcnet_rebuild_header(struct sk_buff *skb)
>  {
>  	struct net_device *dev =3D skb->dev;
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>  	int status =3D 0;		/* default is failure */
>  	unsigned short type;
>  	uint8_t daddr=3D0;
> @@ -599,7 +599,7 @@ #endif
>  /* Called by the kernel in order to transmit a packet. */
>  static int arcnet_send_packet(struct sk_buff *skb, struct net_device *de=
v)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>  	struct archdr *pkt;
>  	struct arc_rfc1201 *soft;
>  	struct ArcProto *proto;
> @@ -689,7 +689,7 @@ static int arcnet_send_packet(struct sk_
>   */
>  static int go_tx(struct net_device *dev)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>
>  	BUGMSG(D_DURING, "go_tx: status=3D%Xh, intmask=3D%Xh, next_tx=3D%d,
> cur_tx=3D%d\n",
>  	       ASTATUS(), lp->intmask, lp->next_tx, lp->cur_tx);
> @@ -719,7 +719,7 @@ static int go_tx(struct net_device *dev)
>  static void arcnet_timeout(struct net_device *dev)
>  {
>  	unsigned long flags;
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>  	int status =3D ASTATUS();
>  	char *msg;
>
> @@ -768,7 +768,7 @@ irqreturn_t arcnet_interrupt(int irq, vo
>
>  	BUGMSG(D_DURING, "in arcnet_interrupt\n");
>  =09
> -	lp =3D dev->priv;
> +	lp =3D netdev_priv(dev);
>  	BUG_ON(!lp);
>  	=09
>  	spin_lock(&lp->lock);
> @@ -1005,7 +1005,7 @@ irqreturn_t arcnet_interrupt(int irq, vo
>   */
>  static void arcnet_rx(struct net_device *dev, int bufnum)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>  	struct archdr pkt;
>  	struct arc_rfc1201 *soft;
>  	int length, ofs;
> @@ -1069,7 +1069,7 @@ static void arcnet_rx(struct net_device
>   */
>  static struct net_device_stats *arcnet_get_stats(struct net_device *dev)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>  	return &lp->stats;
>  }
>
> @@ -1086,7 +1086,7 @@ static void null_rx(struct net_device *d
>  static int null_build_header(struct sk_buff *skb, struct net_device *dev,
>  			     unsigned short type, uint8_t daddr)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>
>  	BUGMSG(D_PROTO,
>  	       "tx: can't build header for encap %02Xh; load a protocol
> driver.\n",
> @@ -1101,7 +1101,7 @@ static int null_build_header(struct sk_b
>  static int null_prepare_tx(struct net_device *dev, struct archdr *pkt,
>  			   int length, int bufnum)
>  {
> -	struct arcnet_local *lp =3D dev->priv;
> +	struct arcnet_local *lp =3D netdev_priv(dev);
>  	struct arc_hardware newpkt;
>
>  	BUGMSG(D_PROTO, "tx: no encap for this host; load a protocol driver.\n"=
);
> diff --git a/drivers/net/bonding/bond_main.c
> b/drivers/net/bonding/bond_main.c
> index cb9cb30..ed75253 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -425,7 +425,7 @@ int bond_dev_queue_xmit(struct bonding *
>   */
>  static void bond_vlan_rx_register(struct net_device *bond_dev, struct
> vlan_group *grp)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave;
>  	int i;
>
> @@ -448,7 +448,7 @@ static void bond_vlan_rx_register(struct
>   */
>  static void bond_vlan_rx_add_vid(struct net_device *bond_dev, uint16_t v=
id)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave;
>  	int i, res;
>
> @@ -476,7 +476,7 @@ static void bond_vlan_rx_add_vid(struct
>   */
>  static void bond_vlan_rx_kill_vid(struct net_device *bond_dev, uint16_t
> vid)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave;
>  	struct net_device *vlan_dev;
>  	int i, res;
> @@ -932,7 +932,7 @@ static int bond_mc_list_copy(struct dev_
>   */
>  static void bond_mc_list_flush(struct net_device *bond_dev, struct
> net_device *slave_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct dev_mc_list *dmi;
>
>  	for (dmi =3D bond_dev->mc_list; dmi; dmi =3D dmi->next) {
> @@ -1280,7 +1280,7 @@ static int bond_compute_features(struct
>  /* enslave device <slave> to bond device <master> */
>  int bond_enslave(struct net_device *bond_dev, struct net_device *slave_d=
ev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *new_slave =3D NULL;
>  	struct dev_mc_list *dmi;
>  	struct sockaddr addr;
> @@ -1639,7 +1639,7 @@ err_undo_flags:
>   */
>  int bond_release(struct net_device *bond_dev, struct net_device *slave_d=
ev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave, *oldcurrent;
>  	struct sockaddr addr;
>  	int mac_addr_differ;
> @@ -1812,7 +1812,7 @@ int bond_release(struct net_device *bond
>   */
>  static int bond_release_all(struct net_device *bond_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave;
>  	struct net_device *slave_dev;
>  	struct sockaddr addr;
> @@ -1939,7 +1939,7 @@ out:
>   */
>  static int bond_ioctl_change_active(struct net_device *bond_dev, struct
> net_device *slave_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *old_active =3D NULL;
>  	struct slave *new_active =3D NULL;
>  	int res =3D 0;
> @@ -1983,7 +1983,7 @@ static int bond_ioctl_change_active(stru
>
>  static int bond_info_query(struct net_device *bond_dev, struct ifbond
> *info)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>
>  	info->bond_mode =3D bond->params.mode;
>  	info->miimon =3D bond->params.miimon;
> @@ -1997,7 +1997,7 @@ static int bond_info_query(struct net_de
>
>  static int bond_slave_info_query(struct net_device *bond_dev, struct
> ifslave *info)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave;
>  	int i, found =3D 0;
>
> @@ -2033,7 +2033,7 @@ static int bond_slave_info_query(struct
>  /* this function is called regularly to monitor each slave's link. */
>  void bond_mii_monitor(struct net_device *bond_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave, *oldcurrent;
>  	int do_failover =3D 0;
>  	int delta_in_ticks;
> @@ -2500,7 +2500,7 @@ static int bond_arp_rcv(struct sk_buff *
>  	if (!(dev->priv_flags & IFF_BONDING) || !(dev->flags & IFF_MASTER))
>  		goto out;
>
> -	bond =3D dev->priv;
> +	bond =3D netdev_priv(dev);
>  	read_lock(&bond->lock);
>
>  	dprintk("bond_arp_rcv: bond %s skb->dev %s orig_dev %s\n",
> @@ -2566,7 +2566,7 @@ out:
>   */
>  void bond_loadbalance_arp_mon(struct net_device *bond_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave, *oldcurrent;
>  	int do_failover =3D 0;
>  	int delta_in_ticks;
> @@ -2697,7 +2697,7 @@ out:
>   */
>  void bond_activebackup_arp_mon(struct net_device *bond_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave;
>  	int delta_in_ticks;
>  	int i;
> @@ -3254,7 +3254,7 @@ #endif
>
>  static int bond_master_netdev_event(unsigned long event, struct net_devi=
ce
> *bond_dev)
>  {
> -	struct bonding *event_bond =3D bond_dev->priv;
> +	struct bonding *event_bond =3D netdev_priv(bond_dev);
>
>  	switch (event) {
>  	case NETDEV_CHANGENAME:
> @@ -3274,7 +3274,7 @@ static int bond_master_netdev_event(unsi
>  static int bond_slave_netdev_event(unsigned long event, struct net_device
> *slave_dev)
>  {
>  	struct net_device *bond_dev =3D slave_dev->master;
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>
>  	switch (event) {
>  	case NETDEV_UNREGISTER:
> @@ -3502,7 +3502,7 @@ static int bond_xmit_hash_policy_l2(stru
>
>  static int bond_open(struct net_device *bond_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct timer_list *mii_timer =3D &bond->mii_timer;
>  	struct timer_list *arp_timer =3D &bond->arp_timer;
>
> @@ -3567,7 +3567,7 @@ static int bond_open(struct net_device *
>
>  static int bond_close(struct net_device *bond_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>
>  	if (bond->params.mode =3D BOND_MODE_8023AD) {
>  		/* Unregister the receive of LACPDUs */
> @@ -3623,7 +3623,7 @@ static int bond_close(struct net_device
>
>  static struct net_device_stats *bond_get_stats(struct net_device *bond_d=
ev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct net_device_stats *stats =3D &(bond->stats), *sstats;
>  	struct slave *slave;
>  	int i;
> @@ -3698,7 +3698,7 @@ static int bond_do_ioctl(struct net_devi
>  		}
>
>  		if (mii->reg_num =3D 1) {
> -			struct bonding *bond =3D bond_dev->priv;
> +			struct bonding *bond =3D netdev_priv(bond_dev);
>  			mii->val_out =3D 0;
>  			read_lock_bh(&bond->lock);
>  			read_lock(&bond->curr_slave_lock);
> @@ -3790,7 +3790,7 @@ static int bond_do_ioctl(struct net_devi
>
>  static void bond_set_multicast_list(struct net_device *bond_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct dev_mc_list *dmi;
>
>  	write_lock_bh(&bond->lock);
> @@ -3843,7 +3843,7 @@ static void bond_set_multicast_list(stru
>   */
>  static int bond_change_mtu(struct net_device *bond_dev, int new_mtu)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave, *stop_at;
>  	int res =3D 0;
>  	int i;
> @@ -3915,7 +3915,7 @@ unwind:
>   */
>  static int bond_set_mac_address(struct net_device *bond_dev, void *addr)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct sockaddr *sa =3D addr, tmp_sa;
>  	struct slave *slave, *stop_at;
>  	int res =3D 0;
> @@ -3989,7 +3989,7 @@ unwind:
>
>  static int bond_xmit_roundrobin(struct sk_buff *skb, struct net_device
> *bond_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave, *start_at;
>  	int i;
>  	int res =3D 1;
> @@ -4039,7 +4039,7 @@ out:
>   */
>  static int bond_xmit_activebackup(struct sk_buff *skb, struct net_device
> *bond_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	int res =3D 1;
>
>  	read_lock(&bond->lock);
> @@ -4071,7 +4071,7 @@ out:
>   */
>  static int bond_xmit_xor(struct sk_buff *skb, struct net_device *bond_de=
v)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave, *start_at;
>  	int slave_no;
>  	int i;
> @@ -4117,7 +4117,7 @@ out:
>   */
>  static int bond_xmit_broadcast(struct sk_buff *skb, struct net_device
> *bond_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>  	struct slave *slave, *start_at;
>  	struct net_device *tx_dev =3D NULL;
>  	int i;
> @@ -4248,7 +4248,7 @@ static const struct ethtool_ops bond_eth
>   */
>  static int bond_init(struct net_device *bond_dev, struct bond_params
> *params)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>
>  	dprintk("Begin bond_init for %s\n", bond_dev->name);
>
> @@ -4323,7 +4323,7 @@ #endif
>   */
>  void bond_deinit(struct net_device *bond_dev)
>  {
> -	struct bonding *bond =3D bond_dev->priv;
> +	struct bonding *bond =3D netdev_priv(bond_dev);
>
>  	list_del(&bond->bond_list);
>
> @@ -4717,12 +4717,12 @@ int bond_create(char *name, struct bond_
>  	lockdep_set_class(&bond_dev->_xmit_lock, &bonding_netdev_xmit_lock_key);
>
>  	if (newbond)
> -		*newbond =3D bond_dev->priv;
> +		*newbond =3D netdev_priv(bond_dev);
>
>  	netif_carrier_off(bond_dev);
>
>  	rtnl_unlock(); /* allows sysfs registration of net device */
> -	res =3D bond_create_sysfs_entry(bond_dev->priv);
> +	res =3D bond_create_sysfs_entry(netdev_priv(bond_dev));
>  	if (res < 0) {
>  		rtnl_lock();
>  		goto out_bond;
> diff --git a/drivers/net/shaper.c b/drivers/net/shaper.c
> index e886e8d..0b8e9af 100644
> --- a/drivers/net/shaper.c
> +++ b/drivers/net/shaper.c
> @@ -133,7 +133,7 @@ static void shaper_setspeed(struct shape
>
>  static int shaper_start_xmit(struct sk_buff *skb, struct net_device *dev)
>  {
> -	struct shaper *shaper =3D dev->priv;
> +	struct shaper *shaper =3D netdev_priv(dev);
>   	struct sk_buff *ptr;
>
>  	spin_lock(&shaper->lock);
> @@ -288,7 +288,7 @@ static void shaper_kick(struct shaper *s
>
>  static int shaper_open(struct net_device *dev)
>  {
> -	struct shaper *shaper=DEv->priv;
> +	struct shaper *shaper=3Dnetdev_priv(dev);
>
>  	/*
>  	 *	Can't open until attached.
> @@ -309,7 +309,7 @@ static int shaper_open(struct net_device
>
>  static int shaper_close(struct net_device *dev)
>  {
> -	struct shaper *shaper=DEv->priv;
> +	struct shaper *shaper=3Dnetdev_priv(dev);
>  	struct sk_buff *skb;
>
>  	while ((skb =3D skb_dequeue(&shaper->sendq)) !=3D NULL)
> @@ -331,14 +331,14 @@ static int shaper_close(struct net_devic
>
>  static struct net_device_stats *shaper_get_stats(struct net_device *dev)
>  {
> -     	struct shaper *sh=DEv->priv;
> +     	struct shaper *sh=3Dnetdev_priv(dev);
>  	return &sh->stats;
>  }
>
>  static int shaper_header(struct sk_buff *skb, struct net_device *dev,
>  	unsigned short type, void *daddr, void *saddr, unsigned len)
>  {
> -	struct shaper *sh=DEv->priv;
> +	struct shaper *sh=3Dnetdev_priv(dev);
>  	int v;
>  	if(sh_debug)
>  		printk("Shaper header\n");
> @@ -476,7 +476,7 @@ #endif
>  static int shaper_ioctl(struct net_device *dev,  struct ifreq *ifr, int
> cmd)
>  {
>  	struct shaperconf *ss=3D (struct shaperconf *)&ifr->ifr_ifru;
> -	struct shaper *sh=DEv->priv;
> +	struct shaper *sh=3Dnetdev_priv(dev);
>
>  	if(ss->ss_cmd =3D SHAPER_SET_DEV || ss->ss_cmd =3D SHAPER_SET_SPEED)
>  	{
> @@ -493,7 +493,7 @@ static int shaper_ioctl(struct net_devic
>  				return -ENODEV;
>  			if(sh->dev)
>  				return -EBUSY;
> -			return shaper_attach(dev,dev->priv, them);
> +			return shaper_attach(dev,netdev_priv(dev), them);
>  		}
>  		case SHAPER_GET_DEV:
>  			if(sh->dev=3DNULL)
> @@ -513,7 +513,7 @@ static int shaper_ioctl(struct net_devic
>
>  static void shaper_init_priv(struct net_device *dev)
>  {
> -	struct shaper *sh =3D dev->priv;
> +	struct shaper *sh =3D netdev_priv(dev);
>
>  	skb_queue_head_init(&sh->sendq);
>  	init_timer(&sh->timer);
> diff --git a/drivers/net/wan/dlci.c b/drivers/net/wan/dlci.c
> index 66be20c..d988161 100644
> --- a/drivers/net/wan/dlci.c
> +++ b/drivers/net/wan/dlci.c
> @@ -74,7 +74,7 @@ static int dlci_header(struct sk_buff *s
>  	unsigned int		hlen;
>  	char			*dest;
>
> -	dlp =3D dev->priv;
> +	dlp =3D netdev_priv(dev);
>
>  	hdr.control =3D FRAD_I_UI;
>  	switch(type)
> @@ -110,7 +110,7 @@ static void dlci_receive(struct sk_buff
>  	struct frhdr		*hdr;
>  	int					process, header;
>
> -	dlp =3D dev->priv;
> +	dlp =3D netdev_priv(dev);
>  	if (!pskb_may_pull(skb, sizeof(*hdr))) {
>  		printk(KERN_NOTICE "%s: invalid data no header\n",
>  		       dev->name);
> @@ -197,7 +197,7 @@ static int dlci_transmit(struct sk_buff
>  	if (!skb || !dev)
>  		return(0);
>
> -	dlp =3D dev->priv;
> +	dlp =3D netdev_priv(dev);
>
>  	netif_stop_queue(dev);
>  =09
> @@ -235,7 +235,7 @@ static int dlci_config(struct net_device
>  	struct frad_local	*flp;
>  	int			err;
>
> -	dlp =3D dev->priv;
> +	dlp =3D netdev_priv(dev);
>
>  	flp =3D dlp->slave->priv;
>
> @@ -269,7 +269,7 @@ static int dlci_dev_ioctl(struct net_dev
>  	if (!capable(CAP_NET_ADMIN))
>  		return(-EPERM);
>
> -	dlp =3D dev->priv;
> +	dlp =3D netdev_priv(dev);
>
>  	switch(cmd)
>  	{
> @@ -298,7 +298,7 @@ static int dlci_change_mtu(struct net_de
>  {
>  	struct dlci_local *dlp;
>
> -	dlp =3D dev->priv;
> +	dlp =3D netdev_priv(dev);
>
>  	return((*dlp->slave->change_mtu)(dlp->slave, new_mtu));
>  }
> @@ -309,7 +309,7 @@ static int dlci_open(struct net_device *
>  	struct frad_local	*flp;
>  	int			err;
>
> -	dlp =3D dev->priv;
> +	dlp =3D netdev_priv(dev);
>
>  	if (!*(short *)(dev->dev_addr))
>  		return(-EINVAL);
> @@ -335,7 +335,7 @@ static int dlci_close(struct net_device
>
>  	netif_stop_queue(dev);
>
> -	dlp =3D dev->priv;
> +	dlp =3D netdev_priv(dev);
>
>  	flp =3D dlp->slave->priv;
>  	err =3D (*flp->deactivate)(dlp->slave, dev);
> @@ -347,7 +347,7 @@ static struct net_device_stats *dlci_get
>  {
>  	struct dlci_local *dlp;
>
> -	dlp =3D dev->priv;
> +	dlp =3D netdev_priv(dev);
>
>  	return(&dlp->stats);
>  }
> @@ -365,7 +365,7 @@ static int dlci_add(struct dlci_add *dlc
>  	if (!slave)
>  		return -ENODEV;
>
> -	if (slave->type !=3D ARPHRD_FRAD || slave->priv =3D NULL)
> +	if (slave->type !=3D ARPHRD_FRAD || netdev_priv(slave) =3D NULL)
>  		goto err1;
>
>  	/* create device name */
> @@ -391,11 +391,11 @@ static int dlci_add(struct dlci_add *dlc
>
>  	*(short *)(master->dev_addr) =3D dlci->dlci;
>
> -	dlp =3D (struct dlci_local *) master->priv;
> +	dlp =3D netdev_priv(master);
>  	dlp->slave =3D slave;
>  	dlp->master =3D master;
>
> -	flp =3D slave->priv;
> +	flp =3D netdev_priv(slave);
>  	err =3D (*flp->assoc)(slave, master);
>  	if (err < 0)
>  		goto err2;
> @@ -435,9 +435,9 @@ static int dlci_del(struct dlci_add *dlc
>  		return(-EBUSY);
>  	}
>
> -	dlp =3D master->priv;
> +	dlp =3D netdev_priv(master);
>  	slave =3D dlp->slave;
> -	flp =3D slave->priv;
> +	flp =3D netdev_priv(slave);
>
>  	rtnl_lock();
>  	err =3D (*flp->deassoc)(slave, master);
> @@ -487,7 +487,7 @@ static int dlci_ioctl(unsigned int cmd,
>
>  static void dlci_setup(struct net_device *dev)
>  {
> -	struct dlci_local *dlp =3D dev->priv;
> +	struct dlci_local *dlp =3D netdev_priv(dev);
>
>  	dev->flags		=3D 0;
>  	dev->open		=3D dlci_open;
> diff --git a/drivers/net/wan/lmc/lmc_main.c b/drivers/net/wan/lmc/lmc_mai=
n.c
> index 750b3ef..8c95f3d 100644
> --- a/drivers/net/wan/lmc/lmc_main.c
> +++ b/drivers/net/wan/lmc/lmc_main.c
> @@ -126,7 +126,7 @@ int lmc_ioctl (struct net_device *dev, s
>
>      ret =3D -EOPNOTSUPP;
>
> -    sc =3D dev->priv;
> +    sc =3D netdev_priv(dev);
>
>      lmc_trace(dev, "lmc_ioctl in");
>
> @@ -634,7 +634,7 @@ static void lmc_watchdog (unsigned long
>      u_int32_t ticks;
>      unsigned long flags;
>
> -    sc =3D dev->priv;
> +    sc =3D netdev_priv(dev);
>
>      lmc_trace(dev, "lmc_watchdog in");
>
> @@ -872,7 +872,7 @@ #endif
>          lmc_first_load =3D 1;
>      }
>
> -    sc =3D dev->priv;
> +    sc =3D netdev_priv(dev);
>      sc->lmc_device =3D dev;
>      sc->name =3D dev->name;
>
> @@ -1018,7 +1018,7 @@ static void __devexit lmc_remove_one (st
>      struct net_device *dev =3D pci_get_drvdata(pdev);
>
>      if (dev) {
> -	    lmc_softc_t *sc =3D dev->priv;
> +	    lmc_softc_t *sc =3D netdev_priv(dev);
>  =09
>  	    printk("%s: removing...\n", dev->name);
>  	    lmc_proto_detach(sc);
> @@ -1035,7 +1035,7 @@ static void __devexit lmc_remove_one (st
>   */
>  static int lmc_open (struct net_device *dev) /*fold00*/
>  {
> -    lmc_softc_t *sc =3D dev->priv;
> +    lmc_softc_t *sc =3D netdev_priv(dev);
>
>      lmc_trace(dev, "lmc_open in");
>
> @@ -1153,7 +1153,7 @@ static int lmc_open (struct net_device *
>  static void lmc_running_reset (struct net_device *dev) /*fold00*/
>  {
>
> -    lmc_softc_t *sc =3D (lmc_softc_t *) dev->priv;
> +    lmc_softc_t *sc =3D netdev_priv(dev);
>
>      lmc_trace(dev, "lmc_runnig_reset in");
>
> @@ -1194,7 +1194,7 @@ static int lmc_close (struct net_device
>
>      lmc_trace(dev, "lmc_close in");
>
> -    sc =3D dev->priv;
> +    sc =3D netdev_priv(dev);
>      sc->lmc_ok =3D 0;
>      sc->lmc_media->set_link_status (sc, 0);
>      del_timer (&sc->timer);
> @@ -1210,7 +1210,7 @@ static int lmc_close (struct net_device
>  /* When the interface goes down, this is called */
>  static int lmc_ifdown (struct net_device *dev) /*fold00*/
>  {
> -    lmc_softc_t *sc =3D dev->priv;
> +    lmc_softc_t *sc =3D netdev_priv(dev);
>      u32 csr6;
>      int i;
>
> @@ -1287,7 +1287,7 @@ static irqreturn_t lmc_interrupt (int ir
>
>      lmc_trace(dev, "lmc_interrupt in");
>
> -    sc =3D dev->priv;
> +    sc =3D netdev_priv(dev);
>
>      spin_lock(&sc->lmc_lock);
>
> @@ -1473,7 +1473,7 @@ static int lmc_start_xmit (struct sk_buf
>
>      lmc_trace(dev, "lmc_start_xmit in");
>
> -    sc =3D dev->priv;
> +    sc =3D netdev_priv(dev);
>
>      spin_lock_irqsave(&sc->lmc_lock, flags);
>
> @@ -1570,7 +1570,7 @@ static int lmc_rx (struct net_device *de
>
>      lmc_trace(dev, "lmc_rx in");
>
> -    sc =3D dev->priv;
> +    sc =3D netdev_priv(dev);
>
>      lmc_led_on(sc, LMC_DS3_LED3);
>
> @@ -1764,7 +1764,7 @@ skip_out_of_mem:
>
>  static struct net_device_stats *lmc_get_stats (struct net_device *dev)
> /*fold00*/
>  {
> -    lmc_softc_t *sc =3D dev->priv;
> +    lmc_softc_t *sc =3D netdev_priv(dev);
>      unsigned long flags;
>
>      lmc_trace(dev, "lmc_get_stats in");
> @@ -2145,7 +2145,7 @@ static void lmc_driver_timeout(struct ne
>
>      lmc_trace(dev, "lmc_driver_timeout in");
>
> -    sc =3D dev->priv;
> +    sc =3D netdev_priv(dev);
>
>      spin_lock_irqsave(&sc->lmc_lock, flags);
>
> diff --git a/drivers/net/wan/sdla.c b/drivers/net/wan/sdla.c
> index 6a485f0..4cb43f4 100644
> --- a/drivers/net/wan/sdla.c
> +++ b/drivers/net/wan/sdla.c
> @@ -185,7 +185,7 @@ static void sdla_stop(struct net_device
>  {
>  	struct frad_local *flp;
>
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>  	switch(flp->type)
>  	{
>  		case SDLA_S502A:
> @@ -212,7 +212,7 @@ static void sdla_start(struct net_device
>  {
>  	struct frad_local *flp;
>
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>  	switch(flp->type)
>  	{
>  		case SDLA_S502A:
> @@ -432,7 +432,7 @@ static int sdla_cmd(struct net_device *d
>  	int                      ret, waiting, len;
>  	long                     window;
>
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>  	window =3D flp->type =3D SDLA_S508 ? SDLA_508_CMD_BUF : SDLA_502_CMD_BU=
F;
>  	cmd_buf =3D (struct sdla_cmd *)(dev->mem_start + (window & SDLA_ADDR_MA=
SK));
>  	ret =3D 0;
> @@ -509,7 +509,7 @@ static int sdla_activate(struct net_devi
>  	struct frad_local *flp;
>  	int i;
>
> -	flp =3D slave->priv;
> +	flp =3D netdev_priv(slave);
>
>  	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
>  		if (flp->master[i] =3D master)
> @@ -531,7 +531,7 @@ static int sdla_deactivate(struct net_de
>  	struct frad_local *flp;
>  	int               i;
>
> -	flp =3D slave->priv;
> +	flp =3D netdev_priv(slave);
>
>  	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
>  		if (flp->master[i] =3D master)
> @@ -556,7 +556,7 @@ static int sdla_assoc(struct net_device
>  	if (master->type !=3D ARPHRD_DLCI)
>  		return(-EINVAL);
>
> -	flp =3D slave->priv;
> +	flp =3D netdev_priv(slave);
>
>  	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
>  	{
> @@ -589,7 +589,7 @@ static int sdla_deassoc(struct net_devic
>  	struct frad_local *flp;
>  	int               i;
>
> -	flp =3D slave->priv;
> +	flp =3D netdev_priv(slave);
>
>  	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
>  		if (flp->master[i] =3D master)
> @@ -619,7 +619,7 @@ static int sdla_dlci_conf(struct net_dev
>  	int               i;
>  	short             len, ret;
>
> -	flp =3D slave->priv;
> +	flp =3D netdev_priv(slave);
>
>  	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
>  		if (flp->master[i] =3D master)
> @@ -628,7 +628,7 @@ static int sdla_dlci_conf(struct net_dev
>  	if (i =3D CONFIG_DLCI_MAX)
>  		return(-ENODEV);
>
> -	dlp =3D master->priv;
> +	dlp =3D netdev_priv(master);
>
>  	ret =3D SDLA_RET_OK;
>  	len =3D sizeof(struct dlci_conf);
> @@ -659,7 +659,7 @@ static int sdla_transmit(struct sk_buff
>  	unsigned long     flags;
>  	struct buf_entry  *pbuf;
>
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>  	ret =3D 0;
>  	accept =3D 1;
>
> @@ -755,7 +755,7 @@ static void sdla_receive(struct net_devi
>  	int               i=3D0, received, success, addr, buf_base, buf_top;
>  	short             dlci, len, len2, split;
>
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>  	success =3D 1;
>  	received =3D addr =3D buf_top =3D buf_base =3D 0;
>  	len =3D dlci =3D 0;
> @@ -860,7 +860,7 @@ static void sdla_receive(struct net_devi
>  	if (success)
>  	{
>  		flp->stats.rx_packets++;
> -		dlp =3D master->priv;
> +		dlp =3D netdev_priv(master);
>  		(*dlp->receive)(skb, master);
>  	}
>
> @@ -924,7 +924,7 @@ static void sdla_poll(unsigned long devi
>  	struct frad_local *flp;
>
>  	dev =3D (struct net_device *) device;
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>
>  	if (sdla_byte(dev, SDLA_502_RCV_BUF))
>  		sdla_receive(dev);
> @@ -940,7 +940,7 @@ static int sdla_close(struct net_device
>  	int               len, i;
>  	short             dlcis[CONFIG_DLCI_MAX];
>
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>
>  	len =3D 0;
>  	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
> @@ -1001,7 +1001,7 @@ static int sdla_open(struct net_device *
>  	int               len, i;
>  	char              byte;
>
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>
>  	if (!flp->initialized)
>  		return(-EPERM);
> @@ -1098,7 +1098,7 @@ static int sdla_config(struct net_device
>  	if (dev->type =3D 0xFFFF)
>  		return(-EUNATCH);
>
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>
>  	if (!get)
>  	{
> @@ -1230,7 +1230,7 @@ static int sdla_reconfig(struct net_devi
>  	struct conf_data  data;
>  	int               i, len;
>
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>
>  	len =3D 0;
>  	for(i=3D0;i<CONFIG_DLCI_MAX;i++)
> @@ -1255,7 +1255,7 @@ static int sdla_ioctl(struct net_device
>  	if(!capable(CAP_NET_ADMIN))
>  		return -EPERM;
>  	=09
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>
>  	if (!flp->initialized)
>  		return(-EINVAL);
> @@ -1321,7 +1321,7 @@ static int sdla_change_mtu(struct net_de
>  {
>  	struct frad_local *flp;
>
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>
>  	if (netif_running(dev))
>  		return(-EBUSY);
> @@ -1338,7 +1338,7 @@ static int sdla_set_config(struct net_de
>  	unsigned base;
>  	int err =3D -EINVAL;
>
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>
>  	if (flp->initialized)
>  		return(-EINVAL);
> @@ -1593,14 +1593,14 @@ fail:
>  static struct net_device_stats *sdla_stats(struct net_device *dev)
>  {
>  	struct frad_local *flp;
> -	flp =3D dev->priv;
> +	flp =3D netdev_priv(dev);
>
>  	return(&flp->stats);
>  }
>
>  static void setup_sdla(struct net_device *dev)
>  {
> -	struct frad_local *flp =3D dev->priv;
> +	struct frad_local *flp =3D netdev_priv(dev);
>
>  	netdev_boot_setup_check(dev);
>
> @@ -1652,7 +1652,7 @@ static int __init init_sdla(void)
>
>  static void __exit exit_sdla(void)
>  {
> -	struct frad_local *flp =3D sdla->priv;
> +	struct frad_local *flp =3D netdev_priv(sdla);
>
>  	unregister_netdev(sdla);
>  	if (flp->initialized) {
> diff --git a/drivers/net/wan/sealevel.c b/drivers/net/wan/sealevel.c
> index 1313581..e78c50b 100644
> --- a/drivers/net/wan/sealevel.c
> +++ b/drivers/net/wan/sealevel.c
> @@ -77,7 +77,7 @@ static void sealevel_input(struct z8530_
>
>  static int sealevel_open(struct net_device *d)
>  {
> -	struct slvl_device *slvl=3Dd->priv;
> +	struct slvl_device *slvl=3Dnetdev_priv(d);
>  	int err =3D -1;
>  	int unit =3D slvl->channel;
>  =09
> @@ -126,7 +126,7 @@ static int sealevel_open(struct net_devi
>
>  static int sealevel_close(struct net_device *d)
>  {
> -	struct slvl_device *slvl=3Dd->priv;
> +	struct slvl_device *slvl=3Dnetdev_priv(d);
>  	int unit =3D slvl->channel;
>  =09
>  	/*
> @@ -166,7 +166,7 @@ static int sealevel_ioctl(struct net_dev
>
>  static struct net_device_stats *sealevel_get_stats(struct net_device *d)
>  {
> -	struct slvl_device *slvl=3Dd->priv;
> +	struct slvl_device *slvl=3Dnetdev_priv(d);
>  	if(slvl)
>  		return z8530_get_stats(slvl->chan);
>  	else
> @@ -179,7 +179,7 @@ static struct net_device_stats *sealevel
>
>  static int sealevel_queue_xmit(struct sk_buff *skb, struct net_device *d)
>  {
> -	struct slvl_device *slvl=3Dd->priv;
> +	struct slvl_device *slvl=3Dnetdev_priv(d);
>  	return z8530_queue_xmit(slvl->chan, skb);
>  }
>
> @@ -204,7 +204,7 @@ static int sealevel_neigh_setup_dev(stru
>
>  static int sealevel_attach(struct net_device *dev)
>  {
> -	struct slvl_device *sv =3D dev->priv;
> +	struct slvl_device *sv =3D netdev_priv(dev);
>  	sppp_attach(&sv->pppdev);
>  	return 0;
>  }
> @@ -240,7 +240,7 @@ static inline struct slvl_device *slvl_a
>  	if (!d)
>  		return NULL;
>
> -	sv =3D d->priv;
> +	sv =3D netdev_priv(d);
>  	sv->if_ptr =3D &sv->pppdev;
>  	sv->pppdev.dev =3D d;
>  	d->base_addr =3D iobase;
> diff --git a/drivers/net/wan/x25_asy.c b/drivers/net/wan/x25_asy.c
> index 1c9edd9..9dbf21a 100644
> --- a/drivers/net/wan/x25_asy.c
> +++ b/drivers/net/wan/x25_asy.c
> @@ -63,7 +63,7 @@ static struct x25_asy *x25_asy_alloc(voi
>  		if (dev =3D NULL)
>  			break;
>
> -		sl =3D dev->priv;
> +		sl =3D netdev_priv(dev);
>  		/* Not in use ? */
>  		if (!test_and_set_bit(SLF_INUSE, &sl->flags))
>  			return sl;
> @@ -85,7 +85,7 @@ static struct x25_asy *x25_asy_alloc(voi
>  			return NULL;
>
>  		/* Initialize channel control data */
> -		sl =3D dev->priv;
> +		sl =3D netdev_priv(dev);
>  		dev->base_addr    =3D i;
>
>  		/* register device so that it can be ifconfig'ed       */
> @@ -119,7 +119,7 @@ static void x25_asy_free(struct x25_asy
>
>  static int x25_asy_change_mtu(struct net_device *dev, int newmtu)
>  {
> -	struct x25_asy *sl =3D dev->priv;
> +	struct x25_asy *sl =3D netdev_priv(dev);
>  	unsigned char *xbuff, *rbuff;
>  	int len =3D 2* newmtu;
>
> @@ -282,7 +282,7 @@ static void x25_asy_write_wakeup(struct
>
>  static void x25_asy_timeout(struct net_device *dev)
>  {
> -	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
> +	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
>
>  	spin_lock(&sl->lock);
>  	if (netif_queue_stopped(dev)) {
> @@ -303,7 +303,7 @@ static void x25_asy_timeout(struct net_d
>
>  static int x25_asy_xmit(struct sk_buff *skb, struct net_device *dev)
>  {
> -	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
> +	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
>  	int err;
>
>  	if (!netif_running(sl->dev)) {
> @@ -372,7 +372,7 @@ static int x25_asy_data_indication(struc
>
>  static void x25_asy_data_transmit(struct net_device *dev, struct sk_buff
> *skb)
>  {
> -	struct x25_asy *sl=DEv->priv;
> +	struct x25_asy *sl=3Dnetdev_priv(dev);
>  =09
>  	spin_lock(&sl->lock);
>  	if (netif_queue_stopped(sl->dev) || sl->tty =3D NULL)
> @@ -399,7 +399,7 @@ static void x25_asy_data_transmit(struct
>
>  static void x25_asy_connected(struct net_device *dev, int reason)
>  {
> -	struct x25_asy *sl =3D dev->priv;
> +	struct x25_asy *sl =3D netdev_priv(dev);
>  	struct sk_buff *skb;
>  	unsigned char *ptr;
>
> @@ -418,7 +418,7 @@ static void x25_asy_connected(struct net
>
>  static void x25_asy_disconnected(struct net_device *dev, int reason)
>  {
> -	struct x25_asy *sl =3D dev->priv;
> +	struct x25_asy *sl =3D netdev_priv(dev);
>  	struct sk_buff *skb;
>  	unsigned char *ptr;
>
> @@ -449,7 +449,7 @@ static struct lapb_register_struct x25_a
>  /* Open the low-level part of the X.25 channel. Easy! */
>  static int x25_asy_open(struct net_device *dev)
>  {
> -	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
> +	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
>  	unsigned long len;
>  	int err;
>
> @@ -499,7 +499,7 @@ norbuff:
>  /* Close the low-level part of the X.25 channel. Easy! */
>  static int x25_asy_close(struct net_device *dev)
>  {
> -	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
> +	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
>  	int err;
>
>  	spin_lock(&sl->lock);
> @@ -615,7 +615,7 @@ static void x25_asy_close_tty(struct tty
>
>  static struct net_device_stats *x25_asy_get_stats(struct net_device *dev)
>  {
> -	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
> +	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
>
>  	return &sl->stats;
>  }
> @@ -730,7 +730,7 @@ static int x25_asy_ioctl(struct tty_stru
>
>  static int x25_asy_open_dev(struct net_device *dev)
>  {
> -	struct x25_asy *sl =3D (struct x25_asy*)(dev->priv);
> +	struct x25_asy *sl =3D (struct x25_asy*)(netdev_priv(dev));
>  	if(sl->tty=3DNULL)
>  		return -ENODEV;
>  	return 0;
> @@ -739,7 +739,7 @@ static int x25_asy_open_dev(struct net_d
>  /* Initialise the X.25 driver.  Called by the device init code */
>  static void x25_asy_setup(struct net_device *dev)
>  {
> -	struct x25_asy *sl =3D dev->priv;
> +	struct x25_asy *sl =3D netdev_priv(dev);
>
>  	sl->magic  =3D X25_ASY_MAGIC;
>  	sl->dev	   =3D dev;
> @@ -807,7 +807,7 @@ static void __exit exit_x25_asy(void)
>  	for (i =3D 0; i < x25_asy_maxdev; i++) {
>  		dev =3D x25_asy_devs[i];
>  		if (dev) {
> -			struct x25_asy *sl =3D dev->priv;
> +			struct x25_asy *sl =3D netdev_priv(dev);
>
>  			spin_lock_bh(&sl->lock);
>  			if (sl->tty)
> diff --git a/drivers/net/wireless/strip.c b/drivers/net/wireless/strip.c
> index ef32a5c..ed146ae 100644
> --- a/drivers/net/wireless/strip.c
> +++ b/drivers/net/wireless/strip.c
> @@ -2571,7 +2571,7 @@ static struct strip *strip_alloc(void)
>  		return NULL;	/* If no more memory, return */
>
>
> -	strip_info =3D dev->priv;
> +	strip_info =3D netdev_priv(dev);
>  	strip_info->dev =3D dev;
>
>  	strip_info->magic =3D STRIP_MAGIC;
>
> -
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
-
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
