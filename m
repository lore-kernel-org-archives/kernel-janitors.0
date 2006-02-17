From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 17 Feb 2006 09:14:26 +0000
Subject: [KJ][Patch] printk KERN_ annotations
Message-Id: <1140167667.7789.7.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99195170835656654=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99195170835656654==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

I was thinking of doing some printk KERN_* annotations but I thought I
had better send in a test patch to ensure I was doing it right.

This one is on stuff in net/802, net/8021q/ and net/atm/lec.c 

comments? flames ?

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

diff -uprN -X rc3-clean/Documentation/dontdiff rc3-clean/net/802/fc.c rc3-net-fixes/net/802/fc.c
--- rc3-clean/net/802/fc.c	2006-01-03 14:21:10.000000000 +1100
+++ rc3-net-fixes/net/802/fc.c	2006-02-16 20:37:44.000000000 +1100
@@ -87,7 +87,9 @@ static int fc_rebuild_header(struct sk_b
 	struct fch_hdr *fch=(struct fch_hdr *)skb->data;
 	struct fcllc *fcllc=(struct fcllc *)(skb->data+sizeof(struct fch_hdr));
 	if(fcllc->ethertype != htons(ETH_P_IP)) {
-		printk("fc_rebuild_header: Don't know how to resolve type %04X addresses ?\n", ntohs(fcllc->ethertype));
+		printk(KERN_WARNING "fc_rebuild_header: Don't know how to "
+					"resolve type %04X addresses ?\n", 
+					ntohs(fcllc->ethertype));
 		return 0;
 	}
 #ifdef CONFIG_INET
diff -uprN -X rc3-clean/Documentation/dontdiff rc3-clean/net/802/fddi.c rc3-net-fixes/net/802/fddi.c
--- rc3-clean/net/802/fddi.c	2006-01-03 14:21:10.000000000 +1100
+++ rc3-net-fixes/net/802/fddi.c	2006-02-16 20:39:49.000000000 +1100
@@ -108,8 +108,9 @@ static int fddi_rebuild_header(struct sk
 	else
 #endif	
 	{
-		printk("%s: Don't know how to resolve type %04X addresses.\n",
-		       skb->dev->name, ntohs(fddi->hdr.llc_snap.ethertype));
+		printk(KERN_WARNING "%s: Don't know how to resolve type "
+			"%04X addresses.\n",
+			skb->dev->name, ntohs(fddi->hdr.llc_snap.ethertype));
 		return(0);
 	}
 }
diff -uprN -X rc3-clean/Documentation/dontdiff rc3-clean/net/802/hippi.c rc3-net-fixes/net/802/hippi.c
--- rc3-clean/net/802/hippi.c	2006-01-03 14:21:10.000000000 +1100
+++ rc3-net-fixes/net/802/hippi.c	2006-02-14 20:33:39.000000000 +1100
@@ -55,7 +55,7 @@ static int hippi_header(struct sk_buff *
 
 	if (!len){
 		len = skb->len - HIPPI_HLEN;
-		printk("hippi_header(): length not supplied\n");
+		printk(KERN_DEBUG "hippi_header(): length not supplied\n");
 	}
 
 	/*
diff -uprN -X rc3-clean/Documentation/dontdiff rc3-clean/net/802/tr.c rc3-net-fixes/net/802/tr.c
--- rc3-clean/net/802/tr.c	2006-01-03 14:21:10.000000000 +1100
+++ rc3-net-fixes/net/802/tr.c	2006-02-16 20:48:28.000000000 +1100
@@ -165,7 +165,9 @@ static int tr_rebuild_header(struct sk_b
 	 */
 	 
 	if(trllc->ethertype != htons(ETH_P_IP)) {
-		printk("tr_rebuild_header: Don't know how to resolve type %04X addresses ?\n",(unsigned int)htons(trllc->ethertype));
+		printk(KERN_WARNING "tr_rebuild_header: Don't know how to "
+				"resolve type %04X addresses ?\n",
+				(unsigned int)htons(trllc->ethertype));
 		return 0;
 	}
 
@@ -281,8 +283,9 @@ void tr_source_route(struct sk_buff *skb
 		if(entry) 
 		{
 #if TR_SR_DEBUG
-printk("source routing for %02X:%02X:%02X:%02X:%02X:%02X\n",trh->daddr[0],
-		  trh->daddr[1],trh->daddr[2],trh->daddr[3],trh->daddr[4],trh->daddr[5]);
+printk(KERN_DEBUG "source routing for %02X:%02X:%02X:%02X:%02X:%02X\n", 
+			trh->daddr[0], trh->daddr[1], trh->daddr[2], 
+			trh->daddr[3], trh->daddr[4], trh->daddr[5]);
 #endif
 			if(!entry->local_ring && (ntohs(entry->rcf) & TR_RCF_LEN_MASK) >> 8)
 			{
@@ -293,11 +296,14 @@ printk("source routing for %02X:%02X:%02
 
 				trh->saddr[0]|=TR_RII;
 #if TR_SR_DEBUG
-				printk("entry found with rcf %04x\n", entry->rcf);
+				printk(KERN_DEBUG "entry found with rcf %04x\n",
+								entry->rcf);
 			}
 			else
 			{
-				printk("entry found but without rcf length, local=%02x\n", entry->local_ring);
+				printk(KERN_DEBUG "entry found but without rcf "
+							"length, local=%02x\n", 
+							entry->local_ring);
 #endif
 			}
 			entry->last_used=jiffies;
@@ -313,7 +319,8 @@ printk("source routing for %02X:%02X:%02
 				       | TR_RCF_FRAME2K | TR_RCF_LIMITED_BROADCAST);
 			trh->saddr[0]|=TR_RII;
 #if TR_SR_DEBUG
-			printk("no entry in rif table found - broadcasting frame\n");
+			printk(KERN_DEBUG "no entry in rif table found - "
+						"broadcasting frame\n");
 #endif
 		}
 	}
@@ -364,7 +371,8 @@ static void tr_add_rif_info(struct trh_h
 	if(entry==NULL) 
 	{
 #if TR_SR_DEBUG
-printk("adding rif_entry: addr:%02X:%02X:%02X:%02X:%02X:%02X rcf:%04X\n",
+printk(KERN_DEBUG "adding rif_entry: addr:%02X:%02X:%02X:%02X:%02X:%02X"
+		" rcf:%04X\n",
 		trh->saddr[0],trh->saddr[1],trh->saddr[2],
        		trh->saddr[3],trh->saddr[4],trh->saddr[5],
 		ntohs(trh->rcf));
@@ -412,7 +420,8 @@ printk("adding rif_entry: addr:%02X:%02X
 			 !(trh->rcf & htons(TR_RCF_BROADCAST_MASK)))
 		    {
 #if TR_SR_DEBUG
-printk("updating rif_entry: addr:%02X:%02X:%02X:%02X:%02X:%02X rcf:%04X\n",
+printk(KERN_DEBUG "updating rif_entry: addr:%02X:%02X:%02X:%02X:%02X:%02X "
+		"rcf:%04X\n",
 		trh->saddr[0],trh->saddr[1],trh->saddr[2],
 		trh->saddr[3],trh->saddr[4],trh->saddr[5],
 		ntohs(trh->rcf));
diff -uprN -X rc3-clean/Documentation/dontdiff rc3-clean/net/8021q/vlan_dev.c rc3-net-fixes/net/8021q/vlan_dev.c
--- rc3-clean/net/8021q/vlan_dev.c	2006-02-15 22:03:34.000000000 +1100
+++ rc3-net-fixes/net/8021q/vlan_dev.c	2006-02-16 21:00:21.000000000 +1100
@@ -673,10 +673,10 @@ int vlan_dev_set_mac_address(struct net_
 
 	memcpy(dev->dev_addr, addr->sa_data, dev->addr_len);
 
-	printk("%s: Setting MAC address to ", dev->name);
+	printk(KERN_INFO "%s: Setting MAC address to ", dev->name);
 	for (i = 0; i < 6; i++)
-		printk(" %2.2x", dev->dev_addr[i]);
-	printk(".\n");
+		printk(KERN_INFO " %2.2x", dev->dev_addr[i]);
+	printk(KERN_INFO ".\n");
 
 	if (memcmp(VLAN_DEV_INFO(dev)->real_dev->dev_addr,
 		   dev->dev_addr,
@@ -689,13 +689,16 @@ int vlan_dev_set_mac_address(struct net_
 
 			/* Make PROMISC visible to the user. */
 			flgs |= IFF_PROMISC;
-			printk("VLAN (%s):  Setting underlying device (%s) to promiscious mode.\n",
-			       dev->name, VLAN_DEV_INFO(dev)->real_dev->name);
-			dev_change_flags(VLAN_DEV_INFO(dev)->real_dev, flgs);
+			printk(KERN_INFO "VLAN (%s):  Setting underlying device"
+				" (%s) to promiscious mode.\n",
+				dev->name, VLAN_DEV_INFO(dev)->real_dev->name);
+				dev_change_flags(VLAN_DEV_INFO(dev)->real_dev, 
+				flgs);
 		}
 	} else {
-		printk("VLAN (%s):  Underlying device (%s) has same MAC, not checking promiscious mode.\n",
-		       dev->name, VLAN_DEV_INFO(dev)->real_dev->name);
+		printk(KERN_INFO "VLAN (%s):  Underlying device (%s) has same "
+				"MAC, not checking promiscious mode.\n",
+				dev->name, VLAN_DEV_INFO(dev)->real_dev->name);
 	}
 
 	return 0;
diff -uprN -X rc3-clean/Documentation/dontdiff rc3-clean/net/atm/lec.c rc3-net-fixes/net/atm/lec.c
--- rc3-clean/net/atm/lec.c	2006-02-15 22:03:34.000000000 +1100
+++ rc3-net-fixes/net/atm/lec.c	2006-02-16 21:50:56.000000000 +1100
@@ -261,7 +261,7 @@ lec_start_xmit(struct sk_buff *skb, stru
         
         DPRINTK("lec_start_xmit called\n");  
         if (!priv->lecd) {
-                printk("%s:No lecd attached\n",dev->name);
+                printk(KERN_WARNING "%s:No lecd attached\n",dev->name);
                 priv->stats.tx_errors++;
                 netif_stop_queue(dev);
                 return -EUNATCH;
@@ -302,7 +302,7 @@ lec_start_xmit(struct sk_buff *skb, stru
 #endif
 
 #if DUMP_PACKETS > 0
-        printk("%s: send datalen:%ld lecid:%4.4x\n", dev->name,
+        printk(KERN_DEBUG "%s: send datalen:%ld lecid:%4.4x\n", dev->name,
                skb->len, priv->lecid);
 #if DUMP_PACKETS >= 2
         for(i=0;i<skb->len && i <99;i++) {
@@ -314,9 +314,9 @@ lec_start_xmit(struct sk_buff *skb, stru
         }
 #endif /* DUMP_PACKETS >= 1 */
         if (i==skb->len)
-                printk("%s\n",buf);
+                printk(KERN_DEBUG "%s\n",buf);
         else
-                printk("%s...\n",buf);
+                printk(KERN_DEBUG "%s...\n",buf);
 #endif /* DUMP_PACKETS > 0 */
 
         /* Minimum ethernet-frame size */
@@ -375,7 +375,7 @@ lec_start_xmit(struct sk_buff *skb, stru
         }
                 
 #if DUMP_PACKETS > 0                    
-        printk("%s:sending to vpi:%d vci:%d\n", dev->name,
+        printk(KERN_DEBUG "%s:sending to vpi:%d vci:%d\n", dev->name,
                vcc->vpi, vcc->vci);       
 #endif /* DUMP_PACKETS > 0 */
                 
@@ -506,8 +506,9 @@ lec_atm_send(struct atm_vcc *vcc, struct
 		if (priv->lane_version > 1)
 			priv->lane2_ops = &lane2_ops;
 		if (dev->change_mtu(dev, mesg->content.config.mtu))
-			printk("%s: change_mtu to %d failed\n", dev->name,
-			    mesg->content.config.mtu);
+			printk(KERN_NOTICE "%s: change_mtu to %d failed\n", 
+						dev->name,
+			    			mesg->content.config.mtu);
 		priv->is_proxy = mesg->content.config.is_proxy;
                 break;
         case l_flush_tran_id:
@@ -556,7 +557,8 @@ lec_atm_send(struct atm_vcc *vcc, struct
                 }
                 break;
         default:
-                printk("%s: Unknown message type %d\n", dev->name, mesg->type);
+                printk(KERN_NOTICE "%s: Unknown message type %d\n", dev->name, 
+								mesg->type);
                 dev_kfree_skb(skb);
                 return -EINVAL;
         }
@@ -578,14 +580,14 @@ lec_atm_close(struct atm_vcc *vcc)
         lec_arp_destroy(priv);
 
         if (skb_peek(&sk_atm(vcc)->sk_receive_queue))
-		printk("%s lec_atm_close: closing with messages pending\n",
-                       dev->name);
+		printk(KERN_DEBUG "%s lec_atm_close: "
+			"closing with messages pending\n",dev->name);
         while ((skb = skb_dequeue(&sk_atm(vcc)->sk_receive_queue)) != NULL) {
                 atm_return(vcc, skb->truesize);
 		dev_kfree_skb(skb);
         }
   
-	printk("%s: Shut down!\n", dev->name);
+	printk(KERN_INFO "%s: Shut down!\n", dev->name);
         module_put(THIS_MODULE);
 }
 
@@ -677,7 +679,7 @@ lec_init(struct net_device *dev)
         dev->get_stats = lec_get_stats;
         dev->set_multicast_list = lec_set_multicast_list;
         dev->do_ioctl  = NULL;
-        printk("%s: Initialized!\n",dev->name);
+        printk(KERN_INFO "%s: Initialized!\n",dev->name);
         return;
 }
 
@@ -707,7 +709,7 @@ lec_push(struct atm_vcc *vcc, struct sk_
         int i=0;
         char buf[300];
 
-        printk("%s: lec_push vcc vpi:%d vci:%d\n", dev->name,
+        printk(KERN_DEBUG "%s: lec_push vcc vpi:%d vci:%d\n", dev->name,
                vcc->vpi, vcc->vci);
 #endif
         if (!skb) {
@@ -716,7 +718,7 @@ lec_push(struct atm_vcc *vcc, struct sk_
                 return;
         }
 #if DUMP_PACKETS > 0
-        printk("%s: rcv datalen:%ld lecid:%4.4x\n", dev->name,
+        printk(KERN_DEBUG "%s: rcv datalen:%ld lecid:%4.4x\n", dev->name,
                skb->len, priv->lecid);
 #if DUMP_PACKETS >= 2
         for(i=0;i<skb->len && i <99;i++) {
@@ -728,9 +730,9 @@ lec_push(struct atm_vcc *vcc, struct sk_
         }
 #endif /* DUMP_PACKETS >= 1 */
         if (i==skb->len)
-                printk("%s\n",buf);
+                printk(KERN_DEBUG "%s\n",buf);
         else
-                printk("%s...\n",buf);
+                printk(KERN_DEBUG "%s...\n",buf);
 #endif /* DUMP_PACKETS > 0 */
         if (memcmp(skb->data, lec_ctrl_magic, 4) ==0) { /* Control frame, to daemon*/
 		struct sock *sk = sk_atm(vcc);
@@ -808,7 +810,7 @@ lec_pop(struct atm_vcc *vcc, struct sk_b
 	struct net_device *dev = skb->dev;
 
 	if (vpriv == NULL) {
-		printk("lec_pop(): vpriv = NULL!?!?!?\n");
+		printk(KERN_DEBUG "lec_pop(): vpriv = NULL!?!?!?\n");
 		return;
 	}
 
@@ -831,8 +833,8 @@ lec_vcc_attach(struct atm_vcc *vcc, void
         /* Lecd must be up in this case */
         bytes_left = copy_from_user(&ioc_data, arg, sizeof(struct atmlec_ioc));
         if (bytes_left != 0) {
-                printk("lec: lec_vcc_attach, copy from user failed for %d bytes\n",
-                       bytes_left);
+                printk(KERN_WARNING "lec: lec_vcc_attach, copy from user failed"
+					" for %d bytes\n", bytes_left);
         }
         if (ioc_data.dev_num < 0 || ioc_data.dev_num >= MAX_LEC_ITF || 
             !dev_lec[ioc_data.dev_num])
@@ -1232,7 +1234,7 @@ static int __init lane_module_init(void)
 #endif
 
 	register_atm_ioctl(&lane_ioctl_ops);
-        printk("lec.c: " __DATE__ " " __TIME__ " initialized\n");
+        printk(KERN_INFO "lec.c: " __DATE__ " " __TIME__ " initialized\n");
         return 0;
 }
 
@@ -1340,7 +1342,7 @@ static int lane2_associate_req (struct n
         memcpy(skb->data, tlvs, sizeoftlvs);
         retval = send_to_lecd(priv, l_associate_req, NULL, NULL, skb);
         if (retval != 0)
-                printk("lec.c: lane2_associate_req() failed\n");
+                printk(KERN_DEBUG "lec.c: lane2_associate_req() failed\n");
         /* If the previous association has changed we must
          * somehow notify other LANE entities about the change
          */
@@ -1375,12 +1377,12 @@ static void lane2_associate_ind (struct 
         memcpy(entry->tlvs, tlvs, sizeoftlvs);
 #endif
 #if 0
-        printk("lec.c: lane2_associate_ind()\n");
-        printk("dump of tlvs, sizeoftlvs=%d\n", sizeoftlvs);
+        printk(KERN_DEBUG "lec.c: lane2_associate_ind()\n");
+        printk(KERN_DEBUG "dump of tlvs, sizeoftlvs=%d\n", sizeoftlvs);
         while (i < sizeoftlvs)
-                printk("%02x ", tlvs[i++]);
+                printk(KERN_DEBUG "%02x ", tlvs[i++]);
         
-        printk("\n");
+        printk(KERN_DEBUG "\n");
 #endif
 
         /* tell MPOA about the TLVs we saw */
@@ -1591,7 +1593,7 @@ dump_arp_table(struct lec_priv *priv)
         struct lec_arp_table *mcast_fwds = priv->mcast_fwds;
 
 
-        printk("Dump %p:\n",priv);
+        printk(KERN_DEBUG "Dump %p:\n",priv);
         for (i=0;i<LEC_ARP_TABLE_SIZE;i++) {
                 rulla = lec_arp_tables[i];
                 offset = 0;
@@ -1624,11 +1626,11 @@ dump_arp_table(struct lec_priv *priv)
                         offset+=sprintf(buf+offset,"->%p\n",rulla->next);
                         rulla = rulla->next;
                 }
-                printk("%s",buf);
+                printk(KERN_DEBUG "%s",buf);
         }
         rulla = lec_no_forward;
         if (rulla)
-                printk("No forward\n");  
+                printk(KERN_DEBUG "No forward\n");  
         while(rulla) {
                 offset=0;
                 offset += sprintf(buf+offset,"Mac:");
@@ -1655,11 +1657,11 @@ dump_arp_table(struct lec_priv *priv)
                                 get_status_string(rulla->status));
                 offset+=sprintf(buf+offset,"->%lx\n",(long)rulla->next);
                 rulla = rulla->next;
-                printk("%s",buf);
+                printk(KERN_DEBUG "%s",buf);
         }
         rulla = lec_arp_empty_ones;
         if (rulla)
-                printk("Empty ones\n");  
+                printk(KERN_DEBUG "Empty ones\n");  
         while(rulla) {
                 offset=0;
                 offset += sprintf(buf+offset,"Mac:");
@@ -1686,12 +1688,12 @@ dump_arp_table(struct lec_priv *priv)
                                 get_status_string(rulla->status));
                 offset+=sprintf(buf+offset,"->%lx\n",(long)rulla->next);
                 rulla = rulla->next;
-                printk("%s",buf);
+                printk(KERN_DEBUG "%s",buf);
         }
 
         rulla = mcast_fwds;
         if (rulla)
-                printk("Multicast Forward VCCs\n");  
+                printk(KERN_DEBUG "Multicast Forward VCCs\n");  
         while(rulla) {
                 offset=0;
                 offset += sprintf(buf+offset,"Mac:");
@@ -1718,7 +1720,7 @@ dump_arp_table(struct lec_priv *priv)
                                 get_status_string(rulla->status));
                 offset+=sprintf(buf+offset,"->%lx\n",(long)rulla->next);
                 rulla = rulla->next;
-                printk("%s",buf);
+                printk(KERN_DEBUG "%s",buf);
         }
 
 #endif
@@ -1814,7 +1816,7 @@ make_entry(struct lec_priv *priv, unsign
 
         to_return = kmalloc(sizeof(struct lec_arp_table), GFP_ATOMIC);
         if (!to_return) {
-                printk("LEC: Arp entry kmalloc failed\n");
+                printk(KERN_WARNING "LEC: Arp entry kmalloc failed\n");
                 return NULL;
         }
         memset(to_return, 0, sizeof(struct lec_arp_table));
@@ -2234,7 +2236,8 @@ lec_vcc_added(struct lec_priv *priv, str
 #if 0
                 entry = lec_arp_find(priv, bus_mac);
                 if (!entry) {
-                        printk("LEC_ARP: Multicast entry not found!\n");
+                        printk(KERN_WARNING "LEC_ARP: Multicast entry "
+							"not found!\n");
 			goto out;
                 }
                 memcpy(entry->atm_addr, ioc_data->atm_addr, ATM_ESA_LEN);




--===============99195170835656654==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99195170835656654==--
