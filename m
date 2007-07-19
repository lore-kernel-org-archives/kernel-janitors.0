From: Yoann Padioleau <padator@wanadoo.fr>
Date: Thu, 19 Jul 2007 15:35:59 +0000
Subject: Re: netdev_priv()
Message-Id: <87r6n42yow.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"Thomas Surrel" <thomas.surrel@gmail.com> writes:

>>
>> Yes, I can apply my simpler semantic patch on the file you
>> have clearly identified as "safe" to do the transformation.
>
> Your simple semantic patch is not convering all the cases. 

Here is the simple SP 

@@
struct net_device *dev;
type T;
@@

- (T) dev->priv
+ netdev_priv(dev)

@@
struct net_device *dev;
@@

- dev->priv
+ netdev_priv(dev)



> Some driver
> don't make the access with dev->priv, it can be
> my_own_private_netdevice->priv. 

You mean that the name of the variable change ? But
my semantic path, or more precisly the transformation tool
handles that (unless my_own_private_netdevice has not
the struct net_device*  type in which case you are right). 
I have written 'dev' in the semantic patch but it's a "metavariable".

In fact if you look at one the patch my transformation tool has
generated, there is one such example: 

 static int bond_ioctl_change_active(struct net_device *bond_dev, struct net_device *slave_dev)
 {
-	struct bonding *bond = bond_dev->priv;
+	struct bonding *bond = netdev_priv(bond_dev);
 	struct slave *old_active = NULL;
 	struct slave *new_active = NULL;
 	int res = 0;



> So we would still need to check behind
> you patch, which is not far from doing manually, unfortunately ...
>
>>
>> The only thing is that I would like also to automate the
>> identification part where you know when it's safe or not. 

I think I have found why I was too restrictive. Some people
use alloc_etherdev which calls alloc_netdev. So I just
have to relax the condition. There are multiple "alias" 
to alloc_netdev.


> How do you
>> know that for instance it's safe to replace the dev->priv by
>> netpriv(dev) in airo.c ? How do you know the private structure is
>> allocated behind the struct netdevice ?
>>
>> in airo.c there is
>>
>> static struct net_device *init_wifidev(struct airo_info *ai,
>>                                        struct net_device *ethdev)
>> {
>>        int err;
>>        struct net_device *dev = alloc_netdev(0, "wifi%d", wifi_setup);
>>        if (!dev)
>>                return NULL;
>>        dev->priv = ethdev->priv;
>>        dev->irq = ethdev->irq;
>>        dev->base_addr = ethdev->base_addr;
>>        dev->wireless_data = ethdev->wireless_data;
>>        memcpy(dev->dev_addr, ethdev->dev_addr, dev->addr_len);
>>        err = register_netdev(dev);
>>        if (err<0) {
>>                free_netdev(dev);
>>                return NULL;
>>        }
>>        return dev;
>> }
>>
>>
>> So it does not look dev->priv is behind the freshly allocated
>> alloc_netdev.
>
> Indeed, not in that location, but you also have:
> static struct net_device *_init_airo_card( unsigned short irq, int port,
> 					   int is_pcmcia, struct pci_dev *pci,
> 					   struct device *dmdev )
> {
> 	struct net_device *dev;
> 	struct airo_info *ai;
> 	int i, rc;
>
> 	/* Create the network device object. */
> 	dev = alloc_etherdev(sizeof(*ai));
> 	 if (!dev) {
> 		airo_print_err("", "Couldn't alloc_etherdev");
> 		return NULL;
> 	}
> 	if (dev_alloc_name(dev, dev->name) < 0) {
> 		airo_print_err("", "Couldn't get name!");
> 		goto err_out_free;
> 	}
>
> 	ai = dev->priv;
>
> In that case again, autmating the process is not easy at all.

Maybe

> Your patch is indeed missing some needed changes. I had a look in
> drivers/net/wireless only, and it appears that the following drivers
> would need to be worked on as well:
> airo
> arlan
> hostap
> prism54
> ray_cs
> wavelan
> wl3501

With my updated semantic patch, where I relax the condition, where I
try to find both alloc_netdev and alloc_etherdev, I can now transform
(I think safely)
  ray_cs, 
  wl3501_cs, 
  strip.c 
in drivers/net/wireless

For some of the rest, the driver is splitted in multiple files
and my tool does not handle that well unless you specify on the
command line the list of files that must be treated together.

With that list of file specification, I can safely 
transform hostap/*, 

For airo my tool does not still accept because of the presence
of a dev->priv = E;  somewhere in the file.
For wavelan I don't know.

And finally for arlan and prism54, the transformation seems to 
have been already applied.




@ rule1 @
type T;
struct net_device *dev;
T *x;
@@

(
 dev = alloc_netdev(sizeof(T), ...)
|
 dev = alloc_etherdev(sizeof(T))
|
 dev = alloc_netdev(sizeof(*x), ...)
|
 dev = alloc_etherdev(sizeof(*x))
)


@ rule1bis @
struct net_device *dev;
expression E;
@@
 dev->priv = E


@ rule2 depends on rule1 && !rule1bis  @
struct net_device *dev;
type rule1.T;
@@

- (T*) dev->priv
+ netdev_priv(dev)


@ rule3 depends on rule1 && !rule1bis @
struct net_device *dev;
@@

- dev->priv
+ netdev_priv(dev)









And here is the patch generated: 



 hostap/hostap_cs.c    |    2 -
 hostap/hostap_hw.c    |    2 -
 hostap/hostap_ioctl.c |   14 +++++-----
 ray_cs.c              |   66 +++++++++++++++++++++++++-------------------------
 strip.c               |    2 -
 wl3501_cs.c           |   66 +++++++++++++++++++++++++-------------------------
 6 files changed, 76 insertions(+), 76 deletions(-)



diff --git a/drivers/net/wireless/hostap/hostap_cs.c b/drivers/net/wireless/hostap/hostap_cs.c
index 30e723f..f9cf22b 100644
--- a/drivers/net/wireless/hostap/hostap_cs.c
+++ b/drivers/net/wireless/hostap/hostap_cs.c
@@ -272,7 +272,7 @@ static int sandisk_enable_wireless(struc
 {
 	int res, ret = 0;
 	conf_reg_t reg;
-	struct hostap_interface *iface = dev->priv;
+	struct hostap_interface *iface = netdev_priv(dev);
 	local_info_t *local = iface->local;
 	tuple_t tuple;
 	cisparse_t *parse = NULL;
diff --git a/drivers/net/wireless/hostap/hostap_hw.c b/drivers/net/wireless/hostap/hostap_hw.c
index 959887b..18023b5 100644
--- a/drivers/net/wireless/hostap/hostap_hw.c
+++ b/drivers/net/wireless/hostap/hostap_hw.c
@@ -3424,7 +3424,7 @@ static void prism2_suspend(struct net_de
 	struct local_info *local;
 	union iwreq_data wrqu;
 
-	iface = dev->priv;
+	iface = netdev_priv(dev);
 	local = iface->local;
 
 	/* Send disconnect event, e.g., to trigger reassociation after resume
diff --git a/drivers/net/wireless/hostap/hostap_ioctl.c b/drivers/net/wireless/hostap/hostap_ioctl.c
index 8c71077..d58ac84 100644
--- a/drivers/net/wireless/hostap/hostap_ioctl.c
+++ b/drivers/net/wireless/hostap/hostap_ioctl.c
@@ -3088,7 +3088,7 @@ #endif /* PRISM2_DOWNLOAD_SUPPORT */
 static int prism2_set_genericelement(struct net_device *dev, u8 *elem,
 				     size_t len)
 {
-	struct hostap_interface *iface = dev->priv;
+	struct hostap_interface *iface = netdev_priv(dev);
 	local_info_t *local = iface->local;
 	u8 *buf;
 
@@ -3116,7 +3116,7 @@ static int prism2_ioctl_siwauth(struct n
 				struct iw_request_info *info,
 				struct iw_param *data, char *extra)
 {
-	struct hostap_interface *iface = dev->priv;
+	struct hostap_interface *iface = netdev_priv(dev);
 	local_info_t *local = iface->local;
 
 	switch (data->flags & IW_AUTH_INDEX) {
@@ -3182,7 +3182,7 @@ static int prism2_ioctl_giwauth(struct n
 				struct iw_request_info *info,
 				struct iw_param *data, char *extra)
 {
-	struct hostap_interface *iface = dev->priv;
+	struct hostap_interface *iface = netdev_priv(dev);
 	local_info_t *local = iface->local;
 
 	switch (data->flags & IW_AUTH_INDEX) {
@@ -3221,7 +3221,7 @@ static int prism2_ioctl_siwencodeext(str
 				     struct iw_request_info *info,
 				     struct iw_point *erq, char *extra)
 {
-	struct hostap_interface *iface = dev->priv;
+	struct hostap_interface *iface = netdev_priv(dev);
 	local_info_t *local = iface->local;
 	struct iw_encode_ext *ext = (struct iw_encode_ext *) extra;
 	int i, ret = 0;
@@ -3395,7 +3395,7 @@ static int prism2_ioctl_giwencodeext(str
 				     struct iw_request_info *info,
 				     struct iw_point *erq, char *extra)
 {
-	struct hostap_interface *iface = dev->priv;
+	struct hostap_interface *iface = netdev_priv(dev);
 	local_info_t *local = iface->local;
 	struct ieee80211_crypt_data **crypt;
 	void *sta_ptr;
@@ -3716,7 +3716,7 @@ static int prism2_ioctl_giwgenie(struct 
 				 struct iw_request_info *info,
 				 struct iw_point *data, char *extra)
 {
-	struct hostap_interface *iface = dev->priv;
+	struct hostap_interface *iface = netdev_priv(dev);
 	local_info_t *local = iface->local;
 	int len = local->generic_elem_len - 2;
 
@@ -3755,7 +3755,7 @@ static int prism2_ioctl_siwmlme(struct n
 				struct iw_request_info *info,
 				struct iw_point *data, char *extra)
 {
-	struct hostap_interface *iface = dev->priv;
+	struct hostap_interface *iface = netdev_priv(dev);
 	local_info_t *local = iface->local;
 	struct iw_mlme *mlme = (struct iw_mlme *) extra;
 	u16 reason;
diff --git a/drivers/net/wireless/ray_cs.c b/drivers/net/wireless/ray_cs.c
index cbe9bf8..83fbb08 100644
--- a/drivers/net/wireless/ray_cs.c
+++ b/drivers/net/wireless/ray_cs.c
@@ -314,7 +314,7 @@ static int ray_probe(struct pcmcia_devic
     if (!dev)
 	    goto fail_alloc_dev;
 
-    local = dev->priv;
+    local = netdev_priv(dev);
     local->finder = p_dev;
 
     /* The io structure describes IO port mapping. None used here */
@@ -388,7 +388,7 @@ static void ray_detach(struct pcmcia_dev
 
     ray_release(link);
 
-    local = (ray_dev_t *)dev->priv;
+    local = netdev_priv(dev);
     del_timer(&local->timer);
 
     if (link->priv) {
@@ -412,7 +412,7 @@ static int ray_config(struct pcmcia_devi
     win_req_t req;
     memreq_t mem;
     struct net_device *dev = (struct net_device *)link->priv;
-    ray_dev_t *local = (ray_dev_t *)dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
 
     DEBUG(1, "ray_config(0x%p)\n", link);
 
@@ -520,7 +520,7 @@ static int ray_init(struct net_device *d
     int i;
     UCHAR *p;
     struct ccs __iomem *pccs;
-    ray_dev_t *local = (ray_dev_t *)dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     struct pcmcia_device *link = local->finder;
     DEBUG(1, "ray_init(0x%p)\n", dev);
     if (!(pcmcia_dev_present(link))) {
@@ -581,7 +581,7 @@ static int ray_init(struct net_device *d
 static int dl_startup_params(struct net_device *dev)
 {
     int ccsindex;
-    ray_dev_t *local = (ray_dev_t *)dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     struct ccs __iomem *pccs;
     struct pcmcia_device *link = local->finder;
 
@@ -786,7 +786,7 @@ static void join_net(u_long data)
 static void ray_release(struct pcmcia_device *link)
 {
     struct net_device *dev = link->priv; 
-    ray_dev_t *local = dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     int i;
     
     DEBUG(1, "ray_release(0x%p)\n", link);
@@ -834,7 +834,7 @@ int ray_dev_init(struct net_device *dev)
 #ifdef RAY_IMMEDIATE_INIT
     int i;
 #endif	/* RAY_IMMEDIATE_INIT */
-    ray_dev_t *local = dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     struct pcmcia_device *link = local->finder;
 
     DEBUG(1,"ray_dev_init(dev=%p)\n",dev);
@@ -868,7 +868,7 @@ #endif	/* RAY_IMMEDIATE_INIT */
 /*======================================*/
 static int ray_dev_config(struct net_device *dev, struct ifmap *map)
 {
-    ray_dev_t *local = dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     struct pcmcia_device *link = local->finder;
     /* Dummy routine to satisfy device structure */
     DEBUG(1,"ray_dev_config(dev=%p,ifmap=%p)\n",dev,map);
@@ -882,7 +882,7 @@ static int ray_dev_config(struct net_dev
 /*======================================*/
 static int ray_dev_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-    ray_dev_t *local = dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     struct pcmcia_device *link = local->finder;
     short length = skb->len;
 
@@ -925,7 +925,7 @@ static int ray_dev_start_xmit(struct sk_
 static int ray_hw_xmit(unsigned char* data, int len, struct net_device* dev, 
                 UCHAR msg_type)
 {
-    ray_dev_t *local = (ray_dev_t *)dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     struct ccs __iomem *pccs;
     int ccsindex;
     int offset;
@@ -1099,7 +1099,7 @@ static int ray_set_freq(struct net_devic
 			struct iw_freq *fwrq,
 			char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 	int err = -EINPROGRESS;		/* Call commit handler */
 
 	/* Reject if card is already initialised */
@@ -1124,7 +1124,7 @@ static int ray_get_freq(struct net_devic
 			struct iw_freq *fwrq,
 			char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 
 	fwrq->m = local->sparm.b5.a_hop_pattern;
 	fwrq->e = 0;
@@ -1140,7 +1140,7 @@ static int ray_set_essid(struct net_devi
 			 struct iw_point *dwrq,
 			 char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 
 	/* Reject if card is already initialised */
 	if(local->card_status != CARD_AWAITING_PARAM)
@@ -1173,7 +1173,7 @@ static int ray_get_essid(struct net_devi
 			 struct iw_point *dwrq,
 			 char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 
 	/* Get the essid that was set */
 	memcpy(extra, local->sparm.b5.a_current_ess_id, IW_ESSID_MAX_SIZE);
@@ -1194,7 +1194,7 @@ static int ray_get_wap(struct net_device
 			struct sockaddr *awrq,
 			char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 
 	memcpy(awrq->sa_data, local->bss_id, ETH_ALEN);
 	awrq->sa_family = ARPHRD_ETHER;
@@ -1211,7 +1211,7 @@ static int ray_set_rate(struct net_devic
 			struct iw_param *vwrq,
 			char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 
 	/* Reject if card is already initialised */
 	if(local->card_status != CARD_AWAITING_PARAM)
@@ -1240,7 +1240,7 @@ static int ray_get_rate(struct net_devic
 			struct iw_param *vwrq,
 			char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 
 	if(local->net_default_tx_rate = 3)
 		vwrq->value = 2000000;		/* Hum... */
@@ -1260,7 +1260,7 @@ static int ray_set_rts(struct net_device
 		       struct iw_param *vwrq,
 		       char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 	int rthr = vwrq->value;
 
 	/* Reject if card is already initialised */
@@ -1290,7 +1290,7 @@ static int ray_get_rts(struct net_device
 		       struct iw_param *vwrq,
 		       char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 
 	vwrq->value = (local->sparm.b5.a_rts_threshold[0] << 8)
 		+ local->sparm.b5.a_rts_threshold[1];
@@ -1309,7 +1309,7 @@ static int ray_set_frag(struct net_devic
 			struct iw_param *vwrq,
 			char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 	int fthr = vwrq->value;
 
 	/* Reject if card is already initialised */
@@ -1338,7 +1338,7 @@ static int ray_get_frag(struct net_devic
 			struct iw_param *vwrq,
 			char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 
 	vwrq->value = (local->sparm.b5.a_frag_threshold[0] << 8)
 		+ local->sparm.b5.a_frag_threshold[1];
@@ -1357,7 +1357,7 @@ static int ray_set_mode(struct net_devic
 			__u32 *uwrq,
 			char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 	int err = -EINPROGRESS;		/* Call commit handler */
 	char card_mode = 1;
 
@@ -1389,7 +1389,7 @@ static int ray_get_mode(struct net_devic
 			__u32 *uwrq,
 			char *extra)
 {
-	ray_dev_t *local = (ray_dev_t *)dev->priv;
+	ray_dev_t *local = netdev_priv(dev);
 
 	if(local->sparm.b5.a_network_type)
 		*uwrq = IW_MODE_INFRA;
@@ -1492,7 +1492,7 @@ static int ray_commit(struct net_device 
  */
 static iw_stats * ray_get_wireless_stats(struct net_device *	dev)
 {
-  ray_dev_t *	local = (ray_dev_t *) dev->priv;
+  ray_dev_t *	local = netdev_priv(dev);
   struct pcmcia_device *link = local->finder;
   struct status __iomem *p = local->sram + STATUS_BASE;
 
@@ -1580,7 +1580,7 @@ static const struct iw_handler_def	ray_h
 /*======================================*/
 static int ray_open(struct net_device *dev)
 {
-    ray_dev_t *local = (ray_dev_t *)dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     struct pcmcia_device *link;
     link = local->finder;
     
@@ -1614,7 +1614,7 @@ static int ray_open(struct net_device *d
 /*======================================*/
 static int ray_dev_close(struct net_device *dev)
 {
-    ray_dev_t *local = (ray_dev_t *)dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     struct pcmcia_device *link;
     link = local->finder;
 
@@ -1773,7 +1773,7 @@ static int parse_addr(char *in_str, UCHA
 /*======================================*/
 static struct net_device_stats *ray_get_stats(struct net_device *dev)
 {
-    ray_dev_t *local = (ray_dev_t *)dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     struct pcmcia_device *link = local->finder;
     struct status __iomem *p = local->sram + STATUS_BASE;
     if (!(pcmcia_dev_present(link))) {
@@ -1803,7 +1803,7 @@ static struct net_device_stats *ray_get_
 /*======================================*/
 static void ray_update_parm(struct net_device *dev, UCHAR objid, UCHAR *value, int len)
 {
-    ray_dev_t *local = (ray_dev_t *)dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     struct pcmcia_device *link = local->finder;
     int ccsindex;
     int i;
@@ -1840,7 +1840,7 @@ static void ray_update_multi_list(struct
     int ccsindex;
     struct ccs __iomem *pccs;
     int i = 0;
-    ray_dev_t *local = (ray_dev_t *)dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     struct pcmcia_device *link = local->finder;
     void __iomem *p = local->sram + HOST_TO_ECF_BASE;
 
@@ -1884,7 +1884,7 @@ static void ray_update_multi_list(struct
 /*======================================*/
 static void set_multicast_list(struct net_device *dev)
 {
-    ray_dev_t *local = (ray_dev_t *)dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     UCHAR promisc;
 
     DEBUG(2,"ray_cs set_multicast_list(%p)\n",dev);
@@ -1935,7 +1935,7 @@ static irqreturn_t ray_interrupt(int irq
 
     DEBUG(4,"ray_cs: interrupt for *dev=%p\n",dev);
 
-    local = (ray_dev_t *)dev->priv;
+    local = netdev_priv(dev);
     link = (struct pcmcia_device *)local->finder;
     if (!pcmcia_dev_present(link)) {
         DEBUG(2,"ray_cs interrupt from device not present or suspended.\n");
@@ -2165,7 +2165,7 @@ static void rx_data(struct net_device *d
 {
     struct sk_buff *skb = NULL;
     struct rcs __iomem *prcslink = prcs;
-    ray_dev_t *local = dev->priv;
+    ray_dev_t *local = netdev_priv(dev);
     UCHAR *rx_ptr;
     int total_len;
     int tmp;
@@ -2618,7 +2618,7 @@ static int ray_cs_proc_read(char *buf, c
     dev = (struct net_device *)link->priv;
     if (!dev)
     	return 0;
-    local = (ray_dev_t *)dev->priv;
+    local = netdev_priv(dev);
     if (!local)
     	return 0;
 
diff --git a/drivers/net/wireless/strip.c b/drivers/net/wireless/strip.c
index ef32a5c..ed146ae 100644
--- a/drivers/net/wireless/strip.c
+++ b/drivers/net/wireless/strip.c
@@ -2571,7 +2571,7 @@ static struct strip *strip_alloc(void)
 		return NULL;	/* If no more memory, return */
 
 
-	strip_info = dev->priv;
+	strip_info = netdev_priv(dev);
 	strip_info->dev = dev;
 
 	strip_info->magic = STRIP_MAGIC;
diff --git a/drivers/net/wireless/wl3501_cs.c b/drivers/net/wireless/wl3501_cs.c
index c8b5c22..72f3d97 100644
--- a/drivers/net/wireless/wl3501_cs.c
+++ b/drivers/net/wireless/wl3501_cs.c
@@ -859,7 +859,7 @@ static int wl3501_esbq_confirm(struct wl
 
 static void wl3501_online(struct net_device *dev)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 
 	printk(KERN_INFO "%s: Wireless LAN online. BSSID: "
 	       "%02X %02X %02X %02X %02X %02X\n", dev->name,
@@ -907,7 +907,7 @@ static int wl3501_mgmt_association(struc
 
 static void wl3501_mgmt_join_confirm(struct net_device *dev, u16 addr)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	struct wl3501_join_confirm sig;
 
 	dprintk(3, "entry");
@@ -1046,7 +1046,7 @@ static inline void wl3501_start_confirm_
 static inline void wl3501_assoc_confirm_interrupt(struct net_device *dev,
 						  u16 addr)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	struct wl3501_assoc_confirm sig;
 
 	dprintk(3, "entry");
@@ -1075,7 +1075,7 @@ static inline void wl3501_rx_interrupt(s
 	int morepkts;
 	u16 addr;
 	u8 sig_id;
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 
 	dprintk(3, "entry");
 loop:
@@ -1257,7 +1257,7 @@ fail:
 
 static int wl3501_close(struct net_device *dev)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	int rc = -ENODEV;
 	unsigned long flags;
 	struct pcmcia_device *link;
@@ -1289,7 +1289,7 @@ static int wl3501_close(struct net_devic
  */
 static int wl3501_reset(struct net_device *dev)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	int rc = -ENODEV;
 
 	wl3501_block_interrupt(this);
@@ -1318,7 +1318,7 @@ out:
 
 static void wl3501_tx_timeout(struct net_device *dev)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	struct net_device_stats *stats = &this->stats;
 	unsigned long flags;
 	int rc;
@@ -1344,7 +1344,7 @@ static void wl3501_tx_timeout(struct net
 static int wl3501_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	int enabled, rc;
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&this->lock, flags);
@@ -1371,7 +1371,7 @@ static int wl3501_hard_start_xmit(struct
 static int wl3501_open(struct net_device *dev)
 {
 	int rc = -ENODEV;
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	unsigned long flags;
 	struct pcmcia_device *link;
 	link = this->p_dev;
@@ -1410,14 +1410,14 @@ fail:
 
 static struct net_device_stats *wl3501_get_stats(struct net_device *dev)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 
 	return &this->stats;
 }
 
 static struct iw_statistics *wl3501_get_wireless_stats(struct net_device *dev)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	struct iw_statistics *wstats = &this->wstats;
 	u32 value; /* size checked: it is u32 */
 
@@ -1497,7 +1497,7 @@ static int wl3501_get_name(struct net_de
 static int wl3501_set_freq(struct net_device *dev, struct iw_request_info *info,
 			   union iwreq_data *wrqu, char *extra)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	int channel = wrqu->freq.m;
 	int rc = -EINVAL;
 
@@ -1511,7 +1511,7 @@ static int wl3501_set_freq(struct net_de
 static int wl3501_get_freq(struct net_device *dev, struct iw_request_info *info,
 			   union iwreq_data *wrqu, char *extra)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 
 	wrqu->freq.m = wl3501_chan2freq[this->chan - 1] * 100000;
 	wrqu->freq.e = 1;
@@ -1526,7 +1526,7 @@ static int wl3501_set_mode(struct net_de
 	if (wrqu->mode = IW_MODE_INFRA ||
 	    wrqu->mode = IW_MODE_ADHOC ||
 	    wrqu->mode = IW_MODE_AUTO) {
-		struct wl3501_card *this = dev->priv;
+		struct wl3501_card *this = netdev_priv(dev);
 
 		this->net_type = wrqu->mode;
 		rc = wl3501_reset(dev);
@@ -1537,7 +1537,7 @@ static int wl3501_set_mode(struct net_de
 static int wl3501_get_mode(struct net_device *dev, struct iw_request_info *info,
 			   union iwreq_data *wrqu, char *extra)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 
 	wrqu->mode = this->net_type;
 	return 0;
@@ -1546,7 +1546,7 @@ static int wl3501_get_mode(struct net_de
 static int wl3501_get_sens(struct net_device *dev, struct iw_request_info *info,
 			   union iwreq_data *wrqu, char *extra)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 
 	wrqu->sens.value = this->rssi;
 	wrqu->sens.disabled = !wrqu->sens.value;
@@ -1577,7 +1577,7 @@ static int wl3501_get_range(struct net_d
 static int wl3501_set_wap(struct net_device *dev, struct iw_request_info *info,
 			  union iwreq_data *wrqu, char *extra)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	static const u8 bcast[ETH_ALEN] = { 255, 255, 255, 255, 255, 255 };
 	int rc = -EINVAL;
 
@@ -1597,7 +1597,7 @@ out:
 static int wl3501_get_wap(struct net_device *dev, struct iw_request_info *info,
 			  union iwreq_data *wrqu, char *extra)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 
 	wrqu->ap_addr.sa_family = ARPHRD_ETHER;
 	memcpy(wrqu->ap_addr.sa_data, this->bssid, ETH_ALEN);
@@ -1616,7 +1616,7 @@ static int wl3501_set_scan(struct net_de
 static int wl3501_get_scan(struct net_device *dev, struct iw_request_info *info,
 			   union iwreq_data *wrqu, char *extra)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	int i;
 	char *current_ev = extra;
 	struct iw_event iwe;
@@ -1666,7 +1666,7 @@ static int wl3501_set_essid(struct net_d
 			    struct iw_request_info *info,
 			    union iwreq_data *wrqu, char *extra)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 
 	if (wrqu->data.flags) {
 		iw_set_mgmt_info_element(IW_MGMT_INFO_ELEMENT_SSID,
@@ -1683,7 +1683,7 @@ static int wl3501_get_essid(struct net_d
 			    struct iw_request_info *info,
 			    union iwreq_data *wrqu, char *extra)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&this->lock, flags);
@@ -1697,7 +1697,7 @@ static int wl3501_get_essid(struct net_d
 static int wl3501_set_nick(struct net_device *dev, struct iw_request_info *info,
 			   union iwreq_data *wrqu, char *extra)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 
 	if (wrqu->data.length > sizeof(this->nick))
 		return -E2BIG;
@@ -1708,7 +1708,7 @@ static int wl3501_set_nick(struct net_de
 static int wl3501_get_nick(struct net_device *dev, struct iw_request_info *info,
 			   union iwreq_data *wrqu, char *extra)
 {
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 
 	strlcpy(extra, this->nick, 32);
 	wrqu->data.length = strlen(extra);
@@ -1733,7 +1733,7 @@ static int wl3501_get_rts_threshold(stru
 				    union iwreq_data *wrqu, char *extra)
 {
 	u16 threshold; /* size checked: it is u16 */
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	int rc = wl3501_get_mib_value(this, WL3501_MIB_ATTR_RTS_THRESHOLD,
 				      &threshold, sizeof(threshold));
 	if (!rc) {
@@ -1749,7 +1749,7 @@ static int wl3501_get_frag_threshold(str
 				     union iwreq_data *wrqu, char *extra)
 {
 	u16 threshold; /* size checked: it is u16 */
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	int rc = wl3501_get_mib_value(this, WL3501_MIB_ATTR_FRAG_THRESHOLD,
 				      &threshold, sizeof(threshold));
 	if (!rc) {
@@ -1765,7 +1765,7 @@ static int wl3501_get_txpow(struct net_d
 			    union iwreq_data *wrqu, char *extra)
 {
 	u16 txpow;
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	int rc = wl3501_get_mib_value(this,
 				      WL3501_MIB_ATTR_CURRENT_TX_PWR_LEVEL,
 				      &txpow, sizeof(txpow));
@@ -1787,7 +1787,7 @@ static int wl3501_get_retry(struct net_d
 			    union iwreq_data *wrqu, char *extra)
 {
 	u8 retry; /* size checked: it is u8 */
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	int rc = wl3501_get_mib_value(this,
 				      WL3501_MIB_ATTR_LONG_RETRY_LIMIT,
 				      &retry, sizeof(retry));
@@ -1814,7 +1814,7 @@ static int wl3501_get_encode(struct net_
 			     union iwreq_data *wrqu, char *extra)
 {
 	u8 implemented, restricted, keys[100], len_keys, tocopy;
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	int rc = wl3501_get_mib_value(this,
 				      WL3501_MIB_ATTR_PRIV_OPT_IMPLEMENTED,
 				      &implemented, sizeof(implemented));
@@ -1852,7 +1852,7 @@ static int wl3501_get_power(struct net_d
 			    union iwreq_data *wrqu, char *extra)
 {
 	u8 pwr_state;
-	struct wl3501_card *this = dev->priv;
+	struct wl3501_card *this = netdev_priv(dev);
 	int rc = wl3501_get_mib_value(this,
 				      WL3501_MIB_ATTR_CURRENT_PWR_STATE,
 				      &pwr_state, sizeof(pwr_state));
@@ -1937,7 +1937,7 @@ static int wl3501_probe(struct pcmcia_de
 	dev->tx_timeout		= wl3501_tx_timeout;
 	dev->watchdog_timeo	= 5 * HZ;
 	dev->get_stats		= wl3501_get_stats;
-	this = dev->priv;
+	this = netdev_priv(dev);
 	this->wireless_data.spy_data = &this->spy_data;
 	this->p_dev = p_dev;
 	dev->wireless_data	= &this->wireless_data;
@@ -2006,7 +2006,7 @@ static int wl3501_config(struct pcmcia_d
 
 	SET_MODULE_OWNER(dev);
 
-	this = dev->priv;
+	this = netdev_priv(dev);
 	/*
 	 * At this point, the dev_node_t structure(s) should be initialized and
 	 * arranged in a linked list at link->dev_node.
@@ -2079,7 +2079,7 @@ static int wl3501_suspend(struct pcmcia_
 {
 	struct net_device *dev = link->priv;
 
-	wl3501_pwr_mgmt(dev->priv, WL3501_SUSPEND);
+	wl3501_pwr_mgmt(netdev_priv(dev), WL3501_SUSPEND);
 	if (link->open)
 		netif_device_detach(dev);
 
@@ -2090,7 +2090,7 @@ static int wl3501_resume(struct pcmcia_d
 {
 	struct net_device *dev = link->priv;
 
-	wl3501_pwr_mgmt(dev->priv, WL3501_RESUME);
+	wl3501_pwr_mgmt(netdev_priv(dev), WL3501_RESUME);
 	if (link->open) {
 		wl3501_reset(dev);
 		netif_device_attach(dev);

