From: Rocco Stanzione <grasshopper@linuxkungfu.org>
Date: Wed, 08 Mar 2006 04:11:12 +0000
Subject: [KJ] First of several spelling/grammar/typo patches
Message-Id: <200603072211.12908.grasshopper@linuxkungfu.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_gllDEck23BVBug+"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_gllDEck23BVBug+
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This is my first post here, so I'm just going to attach the first of a number 
of patches I've split up by directory, since there's no real logical 
grouping.  They all essentially address spelling, grammar and typographical 
issues in code comments and documentation.  Please let me know if there are 
any problems with my patch, the way I'm attaching it, whether it survives 
email transfer intact, etc.  Also if there are any fundamental problems with 
what I'm doing, please let me know before I spam the list with the rest of 
the patches.

This one deals with the 'net' directory off the root of the kernel source 
tree.

Thanks,

Rocco Stanzione

--Boundary-00=_gllDEck23BVBug+
Content-Type: text/x-diff;
  charset="us-ascii";
  name="net.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="net.diff"

diff -Nurp linux-2.6.15.6/net/8021q/vlan.c linux-2.6.15.6.new/net/8021q/vlan.c
--- linux-2.6.15.6/net/8021q/vlan.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/8021q/vlan.c	2006-03-06 20:26:32.000000000 -0600
@@ -523,7 +523,7 @@ static struct net_device *register_vlan_
 	    
 	grp->vlan_devices[VLAN_ID] = new_dev;
 
-	if (vlan_proc_add_dev(new_dev)<0)/* create it's proc entry */
+	if (vlan_proc_add_dev(new_dev)<0)/* create its proc entry */
             	printk(KERN_WARNING "VLAN: failed to add proc entry for %s\n",
 					                 new_dev->name);
 
diff -Nurp linux-2.6.15.6/net/8021q/vlan.h linux-2.6.15.6.new/net/8021q/vlan.h
--- linux-2.6.15.6/net/8021q/vlan.h	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/8021q/vlan.h	2006-03-06 20:27:03.000000000 -0600
@@ -35,7 +35,7 @@ extern unsigned short vlan_name_type;
 #define VLAN_GRP_HASH_MASK	(VLAN_GRP_HASH_SIZE - 1)
 
 /*  Find a VLAN device by the MAC address of its Ethernet device, and
- *  it's VLAN ID.  The default configuration is to have VLAN's scope
+ *  its VLAN ID.  The default configuration is to have VLAN's scope
  *  to be box-wide, so the MAC will be ignored.  The mac will only be
  *  looked at if we are configured to have a separate set of VLANs per
  *  each MAC addressable interface.  Note that this latter option does
diff -Nurp linux-2.6.15.6/net/ax25/TODO linux-2.6.15.6.new/net/ax25/TODO
--- linux-2.6.15.6/net/ax25/TODO	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/ax25/TODO	2006-03-06 20:18:16.000000000 -0600
@@ -14,7 +14,7 @@ get around the removal of SOCKOPS_WRAP. 
 implemented.
 
 The ax25_rt_find_route synopsys is pervert but I somehow had to deal with
-the race caused by the static variable in it's previous implementation.
+the race caused by the static variable in its previous implementation.
 
 Implement proper socket locking in netrom and rose.
 
diff -Nurp linux-2.6.15.6/net/bridge/br_sysfs_br.c linux-2.6.15.6.new/net/bridge/br_sysfs_br.c
--- linux-2.6.15.6/net/bridge/br_sysfs_br.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/bridge/br_sysfs_br.c	2006-03-06 20:27:33.000000000 -0600
@@ -309,7 +309,7 @@ static struct bin_attribute bridge_forwa
  *
  * Note: the ifobj exists only to be a subdirectory
  *   to hold links.  The ifobj exists in same data structure
- *   as it's parent the bridge so reference counting works.
+ *   as its parent the bridge so reference counting works.
  */
 int br_sysfs_addbr(struct net_device *dev)
 {
diff -Nurp linux-2.6.15.6/net/core/pktgen.c linux-2.6.15.6.new/net/core/pktgen.c
--- linux-2.6.15.6/net/core/pktgen.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/core/pktgen.c	2006-03-06 20:20:09.000000000 -0600
@@ -307,9 +307,9 @@ struct pktgen_dev {
                               * are transmitting the same one multiple times
                               */
         struct net_device* odev; /* The out-going device.  Note that the device should
-                                  * have it's pg_info pointer pointing back to this
+                                  * have its pg_info pointer pointing back to this
                                   * device.  This will be set when the user specifies
-                                  * the out-going device name (not when the inject is
+                                  * the outgoing device name (not when the inject is
                                   * started as it used to do.)
                                   */
 	struct flow_state *flows;
diff -Nurp linux-2.6.15.6/net/ipv4/inet_connection_sock.c linux-2.6.15.6.new/net/ipv4/inet_connection_sock.c
--- linux-2.6.15.6/net/ipv4/inet_connection_sock.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/ipv4/inet_connection_sock.c	2006-03-06 20:21:52.000000000 -0600
@@ -104,7 +104,7 @@ int inet_csk_get_port(struct inet_hashin
 			goto fail;
 
 		/* OK, here is the one we will use.  HEAD is
-		 * non-NULL and we hold it's mutex.
+		 * non-NULL and we hold its mutex.
 		 */
 		snum = rover;
 	} else {
diff -Nurp linux-2.6.15.6/net/ipv4/tcp_ipv4.c linux-2.6.15.6.new/net/ipv4/tcp_ipv4.c
--- linux-2.6.15.6/net/ipv4/tcp_ipv4.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/ipv4/tcp_ipv4.c	2006-03-06 20:21:08.000000000 -0600
@@ -1127,7 +1127,7 @@ static int tcp_v4_checksum_init(struct s
 }
 
 
-/* The socket must have it's spinlock held when we get
+/* The socket must have its spinlock held when we get
  * here.
  *
  * We have a potential double-lock case here, so even when
diff -Nurp linux-2.6.15.6/net/ipv6/addrconf.c linux-2.6.15.6.new/net/ipv6/addrconf.c
--- linux-2.6.15.6/net/ipv6/addrconf.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/ipv6/addrconf.c	2006-03-06 20:23:34.000000000 -0600
@@ -3735,7 +3735,7 @@ int __init addrconf_init(void)
 	int err = 0;
 
 	/* The addrconf netdev notifier requires that loopback_dev
-	 * has it's ipv6 private information allocated and setup
+	 * has its ipv6 private information allocated and setup
 	 * before it can bring up and give link-local addresses
 	 * to other devices which are up.
 	 *
diff -Nurp linux-2.6.15.6/net/ipv6/netfilter/ip6t_dst.c linux-2.6.15.6.new/net/ipv6/netfilter/ip6t_dst.c
--- linux-2.6.15.6/net/ipv6/netfilter/ip6t_dst.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/ipv6/netfilter/ip6t_dst.c	2006-03-06 20:22:41.000000000 -0600
@@ -85,7 +85,7 @@ match(const struct sk_buff *skb,
 
        hdrlen = ipv6_optlen(oh);
        if (skb->len - ptr < hdrlen){
-	       /* Packet smaller than it's length field */
+	       /* Packet smaller than its length field */
        		return 0;
        }
 
diff -Nurp linux-2.6.15.6/net/ipv6/netfilter/ip6t_hbh.c linux-2.6.15.6.new/net/ipv6/netfilter/ip6t_hbh.c
--- linux-2.6.15.6/net/ipv6/netfilter/ip6t_hbh.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/ipv6/netfilter/ip6t_hbh.c	2006-03-06 20:23:05.000000000 -0600
@@ -85,7 +85,7 @@ match(const struct sk_buff *skb,
 
        hdrlen = ipv6_optlen(oh);
        if (skb->len - ptr < hdrlen){
-	       /* Packet smaller than it's length field */
+	       /* Packet smaller than its length field */
        		return 0;
        }
 
diff -Nurp linux-2.6.15.6/net/ipv6/tcp_ipv6.c linux-2.6.15.6.new/net/ipv6/tcp_ipv6.c
--- linux-2.6.15.6/net/ipv6/tcp_ipv6.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/ipv6/tcp_ipv6.c	2006-03-06 20:22:19.000000000 -0600
@@ -1416,7 +1416,7 @@ static int tcp_v6_checksum_init(struct s
 	return 0;
 }
 
-/* The socket must have it's spinlock held when we get
+/* The socket must have its spinlock held when we get
  * here.
  *
  * We have a potential double-lock case here, so even when
diff -Nurp linux-2.6.15.6/net/irda/irttp.c linux-2.6.15.6.new/net/irda/irttp.c
--- linux-2.6.15.6/net/irda/irttp.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/irda/irttp.c	2006-03-06 20:25:06.000000000 -0600
@@ -1627,7 +1627,7 @@ static void irttp_do_data_indication(str
 
 	err = self->notify.data_indication(self->notify.instance, self, skb);
 
-	/* Usually the layer above will notify that it's input queue is
+	/* Usually the layer above will notify that its input queue is
 	 * starting to get filled by using the flow request, but this may
 	 * be difficult, so it can instead just refuse to eat it and just
 	 * give an error back
diff -Nurp linux-2.6.15.6/net/llc/llc_if.c linux-2.6.15.6.new/net/llc/llc_if.c
--- linux-2.6.15.6/net/llc/llc_if.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/llc/llc_if.c	2006-03-06 20:17:36.000000000 -0600
@@ -38,7 +38,7 @@ u8 llc_mac_null_var[IFHWADDRLEN];
  *	will be locked and received frames and expired timers will be queued.
  *	Returns 0 for success, -ECONNABORTED when the connection already
  *	closed and -EBUSY when sending data is not permitted in this state or
- *	LLC has send an I pdu with p bit set to 1 and is waiting for it's
+ *	LLC has send an I pdu with p bit set to 1 and is waiting for its
  *	response.
  */
 int llc_build_and_send_pkt(struct sock *sk, struct sk_buff *skb)
@@ -75,7 +75,7 @@ out:
  *	Upper layer calls this to establish an LLC connection with a remote
  *	machine. This function packages a proper event and sends it connection
  *	component state machine. Success or failure of connection
- *	establishment will inform to upper layer via calling it's confirm
+ *	establishment will inform to upper layer via calling its confirm
  *	function and passing proper information.
  */
 int llc_establish_connection(struct sock *sk, u8 *lmac, u8 *dmac, u8 dsap)
diff -Nurp linux-2.6.15.6/net/sctp/sm_statefuns.c linux-2.6.15.6.new/net/sctp/sm_statefuns.c
--- linux-2.6.15.6/net/sctp/sm_statefuns.c	2006-03-05 13:07:54.000000000 -0600
+++ linux-2.6.15.6.new/net/sctp/sm_statefuns.c	2006-03-06 23:36:09.000000000 -0600
@@ -3683,7 +3683,7 @@ sctp_disposition_t sctp_sf_violation(con
  * Handle a protocol violation when the chunk length is invalid.
  * "Invalid" length is identified as smaller then the minimal length a
  * given chunk can be.  For example, a SACK chunk has invalid length
- * if it's length is set to be smaller then the size of sctp_sack_chunk_t.
+ * if its length is set to be smaller then the size of sctp_sack_chunk_t.
  *
  * We inform the other end by sending an ABORT with a Protocol Violation
  * error code. 
@@ -4460,7 +4460,7 @@ sctp_disposition_t sctp_sf_do_9_2_shutdo
 	 *    2) called when SCTP_EVENT_NO_PENDING_TSN event is issued.
 	 *
 	 * For the case (2), the arg parameter is set to NULL.  We need
-	 * to check that we have a chunk before accessing it's fields.
+	 * to check that we have a chunk before accessing its fields.
 	 */
 	if (chunk) {
 		if (!sctp_vtag_verify(chunk, asoc))
@@ -5297,7 +5297,7 @@ static int sctp_eat_data(const struct sc
 		return SCTP_IERROR_NO_DATA;
 	}
 
-	/* If definately accepting the DATA chunk, record its TSN, otherwise
+	/* If definitely accepting the DATA chunk, record its TSN, otherwise
 	 * wait for renege processing.
 	 */
 	if (SCTP_CMD_CHUNK_ULP == deliver)

--Boundary-00=_gllDEck23BVBug+
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_gllDEck23BVBug+--
