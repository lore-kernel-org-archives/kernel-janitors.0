From: Yoann Padioleau <padator@wanadoo.fr>
Date: Thu, 19 Jul 2007 07:51:18 +0000
Subject: Re: netdev_priv()
Message-Id: <87zm1sn85l.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"Thomas Surrel" <thomas.surrel@gmail.com> writes:

> Hi,
>
> I'm starting to work on the change to netdev_priv() call to access the
> priv field of the net_device structure. Is anybody already working on
> this ?

Yes, I am working a little on it. I already have written 
a semantic patch that does the transformation: 

@@
struct net_device *dev;
type T;
@@

- (T) dev->priv
+ netdev_priv(dev)


The end of this mail contains an excerpt of the patch generated
by my automatic program transformation tool given the semantic patch 
for drivers/net/arcnet/

>
> Also, what is the best way to organize my patches: one per subsystem
> (wireless, token ring, ...) or even more detailed which would imply a
> lot more patches ?

From what I understand Morton prefers patch per subsystem.
Maybe I can submit the patch generated automatically by my tool
and later you can try to find the remaining case that my tool
does not handle ? 

>
> Regards,
>
> Thomas
> -
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


diff --git a/drivers/net/arcnet/arcnet.c b/drivers/net/arcnet/arcnet.c
index 681e20b..d595f4f 100644
--- a/drivers/net/arcnet/arcnet.c
+++ b/drivers/net/arcnet/arcnet.c
@@ -353,7 +353,7 @@ struct net_device *alloc_arcdev(char *na
 	dev = alloc_netdev(sizeof(struct arcnet_local),
 			   name && *name ? name : "arc%d", arcdev_setup);
 	if(dev) {
-		struct arcnet_local *lp = (struct arcnet_local *) dev->priv;
+		struct arcnet_local *lp = netdev_priv(dev);
 		spin_lock_init(&lp->lock);
 	}
 
diff --git a/drivers/net/arcnet/capmode.c b/drivers/net/arcnet/capmode.c
index cc4610d..bd04be9 100644
--- a/drivers/net/arcnet/capmode.c
+++ b/drivers/net/arcnet/capmode.c
@@ -101,7 +101,7 @@ #endif				/* MODULE */
 static void rx(struct net_device *dev, int bufnum,
 	       struct archdr *pkthdr, int length)
 {
-	struct arcnet_local *lp = (struct arcnet_local *) dev->priv;
+	struct arcnet_local *lp = netdev_priv(dev);
 	struct sk_buff *skb;
 	struct archdr *pkt = pkthdr;
 	char *pktbuf, *pkthdrbuf;
@@ -196,7 +196,7 @@ static int build_header(struct sk_buff *
 static int prepare_tx(struct net_device *dev, struct archdr *pkt, int length,
 		      int bufnum)
 {
-	struct arcnet_local *lp = (struct arcnet_local *) dev->priv;
+	struct arcnet_local *lp = netdev_priv(dev);
 	struct arc_hardware *hard = &pkt->hard;
 	int ofs;
 
@@ -248,7 +248,7 @@ static int prepare_tx(struct net_device 
 
 static int ack_tx(struct net_device *dev, int acked)
 {
-  struct arcnet_local *lp = (struct arcnet_local *) dev->priv;
+  struct arcnet_local *lp = netdev_priv(dev);
   struct sk_buff *ackskb;
   struct archdr *ackpkt;
   int length=sizeof(struct arc_cap);

