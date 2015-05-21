From: Mike Shuey <shuey@purdue.edu>
Date: Thu, 21 May 2015 19:50:35 +0000
Subject: [PATCH v4 12/13] staging: lustre: lnet: socklnd: checkpatch.pl cleanups
Message-Id: <1432237849-53947-13-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
In-Reply-To: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org, Mike Shuey <shuey@purdue.edu>

More checkpatch.pl warnings & code cleanup.

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 .../staging/lustre/lnet/klnds/socklnd/socklnd.c    |   94 +++--
 .../staging/lustre/lnet/klnds/socklnd/socklnd.h    |   20 +-
 .../staging/lustre/lnet/klnds/socklnd/socklnd_cb.c |  419 +++++++++++---------
 .../lustre/lnet/klnds/socklnd/socklnd_lib-linux.c  |   24 +-
 .../lustre/lnet/klnds/socklnd/socklnd_lib-linux.h  |    2 +-
 .../lustre/lnet/klnds/socklnd/socklnd_proto.c      |   48 ++-
 6 files changed, 351 insertions(+), 256 deletions(-)

diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
index 7b5d407..286ef3f 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
@@ -337,7 +337,8 @@ ksocknal_associate_route_conn_locked(ksock_route_t *route, ksock_conn_t *conn)
 			       &route->ksnr_ipaddr,
 			       &conn->ksnc_myipaddr);
 		} else {
-			CDEBUG(D_NET, "Rebinding %s %pI4h from %pI4h to %pI4h\n",
+			CDEBUG(D_NET,
+			       "Rebinding %s %pI4h from %pI4h to %pI4h\n",
 			       libcfs_id2str(peer->ksnp_id),
 			       &route->ksnr_ipaddr,
 			       &route->ksnr_myipaddr,
@@ -576,7 +577,8 @@ ksocknal_del_peer(lnet_ni_t *ni, lnet_process_id_t id, __u32 ip)
 	write_lock_bh(&ksocknal_data.ksnd_global_lock);
 
 	if (id.nid != LNET_NID_ANY)
-		lo = hi = (int)(ksocknal_nid2peerlist(id.nid) - ksocknal_data.ksnd_peers);
+		lo = hi = (int)(ksocknal_nid2peerlist(id.nid) -
+				ksocknal_data.ksnd_peers);
 	else {
 		lo = 0;
 		hi = ksocknal_data.ksnd_peer_hash_size - 1;
@@ -590,8 +592,10 @@ ksocknal_del_peer(lnet_ni_t *ni, lnet_process_id_t id, __u32 ip)
 			if (peer->ksnp_ni != ni)
 				continue;
 
-			if (!((id.nid = LNET_NID_ANY || peer->ksnp_id.nid = id.nid) &&
-			      (id.pid = LNET_PID_ANY || peer->ksnp_id.pid = id.pid)))
+			if (!((id.nid = LNET_NID_ANY ||
+			       peer->ksnp_id.nid = id.nid) &&
+			      (id.pid = LNET_PID_ANY ||
+			       peer->ksnp_id.pid = id.pid)))
 				continue;
 
 			ksocknal_peer_addref(peer);     /* a ref for me... */
@@ -805,12 +809,15 @@ ksocknal_select_ips(ksock_peer_t *peer, __u32 *peerips, int n_peerips)
 					if (peer->ksnp_passive_ips[k] = ip)
 						break;
 
-				if (k < peer->ksnp_n_passive_ips) /* using it already */
+				/* using it already */
+				if (k < peer->ksnp_n_passive_ips)
 					continue;
 
-				k = ksocknal_match_peerip(iface, peerips, n_peerips);
+				k = ksocknal_match_peerip(iface, peerips,
+							  n_peerips);
 				xor = ip ^ peerips[k];
-				this_netmatch = ((xor & iface->ksni_netmask) = 0) ? 1 : 0;
+				this_netmatch = ((xor & iface->ksni_netmask) =
+						 0) ? 1 : 0;
 
 				if (!(best_iface = NULL ||
 				      best_netmatch < this_netmatch ||
@@ -973,7 +980,8 @@ ksocknal_accept(lnet_ni_t *ni, struct socket *sock)
 
 	LIBCFS_ALLOC(cr, sizeof(*cr));
 	if (cr = NULL) {
-		LCONSOLE_ERROR_MSG(0x12f, "Dropping connection request from %pI4h: memory exhausted\n",
+		LCONSOLE_ERROR_MSG(0x12f,
+				   "Dropping connection request from %pI4h: memory exhausted\n",
 				   &peer_ip);
 		return -ENOMEM;
 	}
@@ -1257,7 +1265,8 @@ ksocknal_create_conn(lnet_ni_t *ni, ksock_route_t *route,
 	conn->ksnc_tx_last_post = cfs_time_current();
 	/* Set the deadline for the outgoing HELLO to drain */
 	conn->ksnc_tx_bufnob = sock->sk->sk_wmem_queued;
-	conn->ksnc_tx_deadline = cfs_time_shift(*ksocknal_tunables.ksnd_timeout);
+	conn->ksnc_tx_deadline +		cfs_time_shift(*ksocknal_tunables.ksnd_timeout);
 	mb();   /* order with adding to peer's conn list */
 
 	list_add(&conn->ksnc_list, &peer->ksnp_conns);
@@ -1269,7 +1278,8 @@ ksocknal_create_conn(lnet_ni_t *ni, ksock_route_t *route,
 
 	/* Take packets blocking for this connection. */
 	list_for_each_entry_safe(tx, txtmp, &peer->ksnp_tx_queue, tx_list) {
-		if (conn->ksnc_proto->pro_match_tx(conn, tx, tx->tx_nonblk) = SOCKNAL_MATCH_NO)
+		if (conn->ksnc_proto->pro_match_tx(conn, tx, tx->tx_nonblk) =
+		    SOCKNAL_MATCH_NO)
 				continue;
 
 		list_del(&tx->tx_list);
@@ -1286,7 +1296,8 @@ ksocknal_create_conn(lnet_ni_t *ni, ksock_route_t *route,
 	 *	socket callbacks.
 	 */
 
-	CDEBUG(D_NET, "New conn %s p %d.x %pI4h -> %pI4h/%d incarnation:%lld sched[%d:%d]\n",
+	CDEBUG(D_NET,
+	       "New conn %s p %d.x %pI4h -> %pI4h/%d incarnation:%lld sched[%d:%d]\n",
 	       libcfs_id2str(peerid), conn->ksnc_proto->pro_version,
 	       &conn->ksnc_myipaddr, &conn->ksnc_ipaddr,
 	       conn->ksnc_port, incarnation, cpt,
@@ -1457,8 +1468,8 @@ ksocknal_close_conn_locked(ksock_conn_t *conn, int error)
 			spin_unlock_bh(&conn->ksnc_scheduler->kss_lock);
 		}
 
-		peer->ksnp_proto = NULL;	/* renegotiate protocol version */
-		peer->ksnp_error = error;       /* stash last conn close reason */
+		peer->ksnp_proto = NULL;  /* renegotiate protocol version */
+		peer->ksnp_error = error; /* stash last conn close reason */
 
 		if (list_empty(&peer->ksnp_routes)) {
 			/* I've just closed last conn belonging to a
@@ -1635,7 +1646,8 @@ ksocknal_destroy_conn(ksock_conn_t *conn)
 	case SOCKNAL_RX_LNET_PAYLOAD:
 		last_rcv = conn->ksnc_rx_deadline -
 			   cfs_time_seconds(*ksocknal_tunables.ksnd_timeout);
-		CERROR("Completing partial receive from %s[%d], ip %pI4h:%d, with error, wanted: %d, left: %d, last alive is %ld secs ago\n",
+		CERROR(
+		       "Completing partial receive from %s[%d], ip %pI4h:%d, with error, wanted: %d, left: %d, last alive is %ld secs ago\n",
 		       libcfs_id2str(conn->ksnc_peer->ksnp_id), conn->ksnc_type,
 		       &conn->ksnc_ipaddr, conn->ksnc_port,
 		       conn->ksnc_rx_nob_wanted, conn->ksnc_rx_nob_left,
@@ -1646,21 +1658,24 @@ ksocknal_destroy_conn(ksock_conn_t *conn)
 		break;
 	case SOCKNAL_RX_LNET_HEADER:
 		if (conn->ksnc_rx_started)
-			CERROR("Incomplete receive of lnet header from %s, ip %pI4h:%d, with error, protocol: %d.x.\n",
+			CERROR(
+			       "Incomplete receive of lnet header from %s, ip %pI4h:%d, with error, protocol: %d.x.\n",
 			       libcfs_id2str(conn->ksnc_peer->ksnp_id),
 			       &conn->ksnc_ipaddr, conn->ksnc_port,
 			       conn->ksnc_proto->pro_version);
 		break;
 	case SOCKNAL_RX_KSM_HEADER:
 		if (conn->ksnc_rx_started)
-			CERROR("Incomplete receive of ksock message from %s, ip %pI4h:%d, with error, protocol: %d.x.\n",
+			CERROR(
+			       "Incomplete receive of ksock message from %s, ip %pI4h:%d, with error, protocol: %d.x.\n",
 			       libcfs_id2str(conn->ksnc_peer->ksnp_id),
 			       &conn->ksnc_ipaddr, conn->ksnc_port,
 			       conn->ksnc_proto->pro_version);
 		break;
 	case SOCKNAL_RX_SLOP:
 		if (conn->ksnc_rx_started)
-			CERROR("Incomplete receive of slops from %s, ip %pI4h:%d, with error\n",
+			CERROR(
+			       "Incomplete receive of slops from %s, ip %pI4h:%d, with error\n",
 			       libcfs_id2str(conn->ksnc_peer->ksnp_id),
 			       &conn->ksnc_ipaddr, conn->ksnc_port);
 	       break;
@@ -1725,7 +1740,8 @@ ksocknal_close_matching_conns(lnet_process_id_t id, __u32 ipaddr)
 	write_lock_bh(&ksocknal_data.ksnd_global_lock);
 
 	if (id.nid != LNET_NID_ANY)
-		lo = hi = (int)(ksocknal_nid2peerlist(id.nid) - ksocknal_data.ksnd_peers);
+		lo = hi = (int)(ksocknal_nid2peerlist(id.nid) -
+				ksocknal_data.ksnd_peers);
 	else {
 		lo = 0;
 		hi = ksocknal_data.ksnd_peer_hash_size - 1;
@@ -1737,11 +1753,14 @@ ksocknal_close_matching_conns(lnet_process_id_t id, __u32 ipaddr)
 
 			peer = list_entry(ptmp, ksock_peer_t, ksnp_list);
 
-			if (!((id.nid = LNET_NID_ANY || id.nid = peer->ksnp_id.nid) &&
-			      (id.pid = LNET_PID_ANY || id.pid = peer->ksnp_id.pid)))
+			if (!((id.nid = LNET_NID_ANY ||
+			       id.nid = peer->ksnp_id.nid) &&
+			      (id.pid = LNET_PID_ANY ||
+			       id.pid = peer->ksnp_id.pid)))
 				continue;
 
-			count += ksocknal_close_peer_conns_locked(peer, ipaddr, 0);
+			count += ksocknal_close_peer_conns_locked(peer,
+								  ipaddr, 0);
 		}
 	}
 
@@ -1805,7 +1824,8 @@ ksocknal_query(lnet_ni_t *ni, lnet_nid_t nid, unsigned long *when)
 			if (bufnob < conn->ksnc_tx_bufnob) {
 				/* something got ACKed */
 				conn->ksnc_tx_deadline -					cfs_time_shift(*ksocknal_tunables.ksnd_timeout);
+					cfs_time_shift(
+					    *ksocknal_tunables.ksnd_timeout);
 				peer->ksnp_last_alive = now;
 				conn->ksnc_tx_bufnob = bufnob;
 			}
@@ -1838,7 +1858,6 @@ ksocknal_query(lnet_ni_t *ni, lnet_nid_t nid, unsigned long *when)
 		ksocknal_launch_all_connections_locked(peer);
 
 	write_unlock_bh(glock);
-	return;
 }
 
 static void
@@ -1962,7 +1981,8 @@ ksocknal_add_interface(lnet_ni_t *ni, __u32 ipaddress, __u32 netmask)
 						      ksnp_list);
 
 				for (j = 0; j < peer->ksnp_n_passive_ips; j++)
-					if (peer->ksnp_passive_ips[j] = ipaddress)
+					if (peer->ksnp_passive_ips[j] =
+					    ipaddress)
 						iface->ksni_npeers++;
 
 				list_for_each(rtmp, &peer->ksnp_routes) {
@@ -1977,7 +1997,8 @@ ksocknal_add_interface(lnet_ni_t *ni, __u32 ipaddress, __u32 netmask)
 		}
 
 		rc = 0;
-		/* NB only new connections will pay attention to the new interface! */
+		/* NB only new connections will pay attention to the new
+		 * interface! */
 	}
 
 	write_unlock_bh(&ksocknal_data.ksnd_global_lock);
@@ -2064,7 +2085,8 @@ ksocknal_del_interface(lnet_ni_t *ni, __u32 ipaddress)
 				if (peer->ksnp_ni != ni)
 					continue;
 
-				ksocknal_peer_del_interface_locked(peer, this_ip);
+				ksocknal_peer_del_interface_locked(peer,
+								   this_ip);
 			}
 		}
 	}
@@ -2111,7 +2133,7 @@ ksocknal_ctl(lnet_ni_t *ni, unsigned int cmd, void *arg)
 
 	case IOC_LIBCFS_DEL_INTERFACE:
 		return ksocknal_del_interface(ni,
-					      data->ioc_u32[0]); /* IP address */
+					      data->ioc_u32[0]);/* IP address */
 
 	case IOC_LIBCFS_GET_PEER: {
 		__u32 myip = 0;
@@ -2153,7 +2175,8 @@ ksocknal_ctl(lnet_ni_t *ni, unsigned int cmd, void *arg)
 		int txmem;
 		int rxmem;
 		int nagle;
-		ksock_conn_t *conn = ksocknal_get_conn_by_idx(ni, data->ioc_count);
+		ksock_conn_t *conn = ksocknal_get_conn_by_idx(ni,
+							      data->ioc_count);
 
 		if (conn = NULL)
 			return -ENOENT;
@@ -2263,9 +2286,8 @@ ksocknal_base_shutdown(void)
 	case SOCKNAL_INIT_ALL:
 	case SOCKNAL_INIT_DATA:
 		LASSERT(ksocknal_data.ksnd_peers != NULL);
-		for (i = 0; i < ksocknal_data.ksnd_peer_hash_size; i++) {
+		for (i = 0; i < ksocknal_data.ksnd_peer_hash_size; i++)
 			LASSERT(list_empty(&ksocknal_data.ksnd_peers[i]));
-		}
 
 		LASSERT(list_empty(&ksocknal_data.ksnd_nets));
 		LASSERT(list_empty(&ksocknal_data.ksnd_enomem_conns));
@@ -2315,7 +2337,8 @@ ksocknal_base_shutdown(void)
 		read_lock(&ksocknal_data.ksnd_global_lock);
 		while (ksocknal_data.ksnd_nthreads != 0) {
 			i++;
-			CDEBUG(((i & (-i)) = i) ? D_WARNING : D_NET, /* power of 2? */
+			/* power of 2? */
+			CDEBUG(((i & (-i)) = i) ? D_WARNING : D_NET,
 			       "waiting for %d threads to terminate\n",
 				ksocknal_data.ksnd_nthreads);
 			read_unlock(&ksocknal_data.ksnd_global_lock);
@@ -2446,6 +2469,7 @@ ksocknal_base_startup(void)
 
 	for (i = 0; i < *ksocknal_tunables.ksnd_nconnds; i++) {
 		char name[16];
+
 		spin_lock_bh(&ksocknal_data.ksnd_connd_lock);
 		ksocknal_data.ksnd_connd_starting++;
 		spin_unlock_bh(&ksocknal_data.ksnd_connd_lock);
@@ -2503,7 +2527,8 @@ ksocknal_debug_peerhash(lnet_ni_t *ni)
 		ksock_route_t *route;
 		ksock_conn_t  *conn;
 
-		CWARN("Active peer on shutdown: %s, ref %d, scnt %d, closing %d, accepting %d, err %d, zcookie %llu, txq %d, zc_req %d\n",
+		CWARN(
+		      "Active peer on shutdown: %s, ref %d, scnt %d, closing %d, accepting %d, err %d, zcookie %llu, txq %d, zc_req %d\n",
 		      libcfs_id2str(peer->ksnp_id),
 		      atomic_read(&peer->ksnp_refcount),
 		      peer->ksnp_sharecount, peer->ksnp_closing,
@@ -2514,7 +2539,8 @@ ksocknal_debug_peerhash(lnet_ni_t *ni)
 
 		list_for_each(tmp, &peer->ksnp_routes) {
 			route = list_entry(tmp, ksock_route_t, ksnr_list);
-			CWARN("Route: ref %d, schd %d, conn %d, cnted %d, del %d\n",
+			CWARN(
+			      "Route: ref %d, schd %d, conn %d, cnted %d, del %d\n",
 			      atomic_read(&route->ksnr_refcount),
 			      route->ksnr_scheduled, route->ksnr_connecting,
 			      route->ksnr_connected, route->ksnr_deleted);
@@ -2530,7 +2556,6 @@ ksocknal_debug_peerhash(lnet_ni_t *ni)
 	}
 
 	read_unlock(&ksocknal_data.ksnd_global_lock);
-	return;
 }
 
 void
@@ -2711,6 +2736,7 @@ ksocknal_start_schedulers(struct ksock_sched_info *info)
 		long id;
 		char name[20];
 		ksock_sched_t *sched;
+
 		id = KSOCK_THREAD_ID(info->ksi_cpt, info->ksi_nthreads + i);
 		sched = &info->ksi_scheds[KSOCK_THREAD_SID(id)];
 		snprintf(name, sizeof(name), "socknal_sd%02d_%02d",
diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.h b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.h
index c34378c..d270263 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.h
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.h
@@ -139,7 +139,7 @@ typedef struct {
 typedef struct {
 	__u64		  ksnn_incarnation;	/* my epoch */
 	spinlock_t	  ksnn_lock;		/* serialise */
-	struct list_head	  ksnn_list;		/* chain on global list */
+	struct list_head  ksnn_list;		/* chain on global list */
 	int		  ksnn_npeers;		/* # peers */
 	int		  ksnn_shutdown;	/* shutting down? */
 	int		  ksnn_ninterfaces;	/* IP interfaces */
@@ -474,7 +474,8 @@ ksocknal_route_mask(void)
 static inline struct list_head *
 ksocknal_nid2peerlist(lnet_nid_t nid)
 {
-	unsigned int hash = ((unsigned int)nid) % ksocknal_data.ksnd_peer_hash_size;
+	unsigned int hash = ((unsigned int)nid) %
+			    ksocknal_data.ksnd_peer_hash_size;
 
 	return &ksocknal_data.ksnd_peers[hash];
 }
@@ -587,8 +588,10 @@ int ksocknal_recv(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg,
 		  unsigned int offset, unsigned int mlen, unsigned int rlen);
 int ksocknal_accept(lnet_ni_t *ni, struct socket *sock);
 
-extern int ksocknal_add_peer(lnet_ni_t *ni, lnet_process_id_t id, __u32 ip, int port);
-extern ksock_peer_t *ksocknal_find_peer_locked(lnet_ni_t *ni, lnet_process_id_t id);
+extern int ksocknal_add_peer(lnet_ni_t *ni, lnet_process_id_t id, __u32 ip,
+			     int port);
+extern ksock_peer_t *ksocknal_find_peer_locked(lnet_ni_t *ni,
+					       lnet_process_id_t id);
 extern ksock_peer_t *ksocknal_find_peer(lnet_ni_t *ni, lnet_process_id_t id);
 extern void ksocknal_peer_failed(ksock_peer_t *peer);
 extern int ksocknal_create_conn(lnet_ni_t *ni, ksock_route_t *route,
@@ -613,11 +616,13 @@ extern void ksocknal_queue_tx_locked(ksock_tx_t *tx, ksock_conn_t *conn);
 extern void ksocknal_txlist_done(lnet_ni_t *ni, struct list_head *txlist,
 				  int error);
 extern void ksocknal_notify(lnet_ni_t *ni, lnet_nid_t gw_nid, int alive);
-extern void ksocknal_query(struct lnet_ni *ni, lnet_nid_t nid, unsigned long *when);
+extern void ksocknal_query(struct lnet_ni *ni, lnet_nid_t nid,
+			   unsigned long *when);
 extern int ksocknal_thread_start(int (*fn)(void *arg), void *arg, char *name);
 extern void ksocknal_thread_fini(void);
 extern void ksocknal_launch_all_connections_locked(ksock_peer_t *peer);
-extern ksock_route_t *ksocknal_find_connectable_route_locked(ksock_peer_t *peer);
+extern ksock_route_t *ksocknal_find_connectable_route_locked(ksock_peer_t
+							     *peer);
 extern ksock_route_t *ksocknal_find_connecting_route_locked(ksock_peer_t *peer);
 extern int ksocknal_new_packet(ksock_conn_t *conn, int skip);
 extern int ksocknal_scheduler(void *arg);
@@ -634,7 +639,8 @@ extern void ksocknal_write_callback(ksock_conn_t *conn);
 extern int ksocknal_lib_zc_capable(ksock_conn_t *conn);
 extern void ksocknal_lib_save_callback(struct socket *sock, ksock_conn_t *conn);
 extern void ksocknal_lib_set_callback(struct socket *sock,  ksock_conn_t *conn);
-extern void ksocknal_lib_reset_callback(struct socket *sock, ksock_conn_t *conn);
+extern void ksocknal_lib_reset_callback(struct socket *sock,
+					ksock_conn_t *conn);
 extern void ksocknal_lib_push_conn(ksock_conn_t *conn);
 extern int ksocknal_lib_get_conn_addrs(ksock_conn_t *conn);
 extern int ksocknal_lib_setup_sock(struct socket *so);
diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_cb.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_cb.c
index a1a4ac0..38c85ae 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_cb.c
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_cb.c
@@ -38,8 +38,8 @@ ksocknal_alloc_tx(int type, int size)
 		spin_lock(&ksocknal_data.ksnd_tx_lock);
 
 		if (!list_empty(&ksocknal_data.ksnd_idle_noop_txs)) {
-			tx = list_entry(ksocknal_data.ksnd_idle_noop_txs. \
-					    next, ksock_tx_t, tx_list);
+			tx = list_entry(ksocknal_data.ksnd_idle_noop_txs.next,
+					ksock_tx_t, tx_list);
 			LASSERT(tx->tx_desc_size = size);
 			list_del(&tx->tx_list);
 		}
@@ -91,7 +91,7 @@ ksocknal_alloc_tx_noop(__u64 cookie, int nonblk)
 
 
 void
-ksocknal_free_tx (ksock_tx_t *tx)
+ksocknal_free_tx(ksock_tx_t *tx)
 {
 	atomic_dec(&ksocknal_data.ksnd_nactive_txs);
 
@@ -108,7 +108,7 @@ ksocknal_free_tx (ksock_tx_t *tx)
 }
 
 static int
-ksocknal_send_iov (ksock_conn_t *conn, ksock_tx_t *tx)
+ksocknal_send_iov(ksock_conn_t *conn, ksock_tx_t *tx)
 {
 	struct kvec *iov = tx->tx_iov;
 	int nob;
@@ -123,7 +123,7 @@ ksocknal_send_iov (ksock_conn_t *conn, ksock_tx_t *tx)
 		return rc;
 
 	nob = rc;
-	LASSERT (nob <= tx->tx_resid);
+	LASSERT(nob <= tx->tx_resid);
 	tx->tx_resid -= nob;
 
 	/* "consume" iov */
@@ -145,7 +145,7 @@ ksocknal_send_iov (ksock_conn_t *conn, ksock_tx_t *tx)
 }
 
 static int
-ksocknal_send_kiov (ksock_conn_t *conn, ksock_tx_t *tx)
+ksocknal_send_kiov(ksock_conn_t *conn, ksock_tx_t *tx)
 {
 	lnet_kiov_t *kiov = tx->tx_kiov;
 	int nob;
@@ -161,7 +161,7 @@ ksocknal_send_kiov (ksock_conn_t *conn, ksock_tx_t *tx)
 		return rc;
 
 	nob = rc;
-	LASSERT (nob <= tx->tx_resid);
+	LASSERT(nob <= tx->tx_resid);
 	tx->tx_resid -= nob;
 
 	/* "consume" kiov */
@@ -183,7 +183,7 @@ ksocknal_send_kiov (ksock_conn_t *conn, ksock_tx_t *tx)
 }
 
 static int
-ksocknal_transmit (ksock_conn_t *conn, ksock_tx_t *tx)
+ksocknal_transmit(ksock_conn_t *conn, ksock_tx_t *tx)
 {
 	int rc;
 	int bufnob;
@@ -197,7 +197,7 @@ ksocknal_transmit (ksock_conn_t *conn, ksock_tx_t *tx)
 
 	rc = ksocknal_connsock_addref(conn);
 	if (rc != 0) {
-		LASSERT (conn->ksnc_closing);
+		LASSERT(conn->ksnc_closing);
 		return -ESHUTDOWN;
 	}
 
@@ -207,9 +207,9 @@ ksocknal_transmit (ksock_conn_t *conn, ksock_tx_t *tx)
 			ksocknal_data.ksnd_enomem_tx--;
 			rc = -EAGAIN;
 		} else if (tx->tx_niov != 0) {
-			rc = ksocknal_send_iov (conn, tx);
+			rc = ksocknal_send_iov(conn, tx);
 		} else {
-			rc = ksocknal_send_kiov (conn, tx);
+			rc = ksocknal_send_kiov(conn, tx);
 		}
 
 		bufnob = conn->ksnc_sock->sk->sk_wmem_queued;
@@ -228,7 +228,8 @@ ksocknal_transmit (ksock_conn_t *conn, ksock_tx_t *tx)
 
 		if (rc <= 0) { /* Didn't write anything? */
 
-			if (rc = 0) /* some stacks return 0 instead of -EAGAIN */
+			/* some stacks return 0 instead of -EAGAIN */
+			if (rc = 0)
 				rc = -EAGAIN;
 
 			/* Check if EAGAIN is due to memory pressure */
@@ -239,7 +240,7 @@ ksocknal_transmit (ksock_conn_t *conn, ksock_tx_t *tx)
 		}
 
 		/* socket's wmem_queued now includes 'rc' bytes */
-		atomic_sub (rc, &conn->ksnc_tx_nob);
+		atomic_sub(rc, &conn->ksnc_tx_nob);
 		rc = 0;
 
 	} while (tx->tx_resid != 0);
@@ -249,7 +250,7 @@ ksocknal_transmit (ksock_conn_t *conn, ksock_tx_t *tx)
 }
 
 static int
-ksocknal_recv_iov (ksock_conn_t *conn)
+ksocknal_recv_iov(ksock_conn_t *conn)
 {
 	struct kvec *iov = conn->ksnc_rx_iov;
 	int nob;
@@ -294,11 +295,12 @@ ksocknal_recv_iov (ksock_conn_t *conn)
 }
 
 static int
-ksocknal_recv_kiov (ksock_conn_t *conn)
+ksocknal_recv_kiov(ksock_conn_t *conn)
 {
 	lnet_kiov_t *kiov = conn->ksnc_rx_kiov;
 	int nob;
 	int rc;
+
 	LASSERT(conn->ksnc_rx_nkiov > 0);
 
 	/* Never touch conn->ksnc_rx_kiov or change connection
@@ -338,7 +340,7 @@ ksocknal_recv_kiov (ksock_conn_t *conn)
 }
 
 static int
-ksocknal_receive (ksock_conn_t *conn)
+ksocknal_receive(ksock_conn_t *conn)
 {
 	/* Return 1 on success, 0 on EOF, < 0 on error.
 	 * Caller checks ksnc_rx_nob_wanted to determine
@@ -352,15 +354,15 @@ ksocknal_receive (ksock_conn_t *conn)
 
 	rc = ksocknal_connsock_addref(conn);
 	if (rc != 0) {
-		LASSERT (conn->ksnc_closing);
+		LASSERT(conn->ksnc_closing);
 		return -ESHUTDOWN;
 	}
 
 	for (;;) {
 		if (conn->ksnc_rx_niov != 0)
-			rc = ksocknal_recv_iov (conn);
+			rc = ksocknal_recv_iov(conn);
 		else
-			rc = ksocknal_recv_kiov (conn);
+			rc = ksocknal_recv_kiov(conn);
 
 		if (rc <= 0) {
 			/* error/EOF or partial receive */
@@ -386,7 +388,7 @@ ksocknal_receive (ksock_conn_t *conn)
 }
 
 void
-ksocknal_tx_done (lnet_ni_t *ni, ksock_tx_t *tx)
+ksocknal_tx_done(lnet_ni_t *ni, ksock_tx_t *tx)
 {
 	lnet_msg_t *lnetmsg = tx->tx_lnetmsg;
 	int rc = (tx->tx_resid = 0 && !tx->tx_zc_aborted) ? 0 : -EIO;
@@ -399,25 +401,30 @@ ksocknal_tx_done (lnet_ni_t *ni, ksock_tx_t *tx)
 	if (ni = NULL && tx->tx_conn != NULL)
 		ni = tx->tx_conn->ksnc_peer->ksnp_ni;
 
-	ksocknal_free_tx (tx);
+	ksocknal_free_tx(tx);
 	if (lnetmsg != NULL) /* KSOCK_MSG_NOOP go without lnetmsg */
-		lnet_finalize (ni, lnetmsg, rc);
+		lnet_finalize(ni, lnetmsg, rc);
 }
 
 void
-ksocknal_txlist_done (lnet_ni_t *ni, struct list_head *txlist, int error)
+ksocknal_txlist_done(lnet_ni_t *ni, struct list_head *txlist, int error)
 {
 	ksock_tx_t *tx;
 
-	while (!list_empty (txlist)) {
+	while (!list_empty(txlist)) {
 		tx = list_entry(txlist->next, ksock_tx_t, tx_list);
 
 		if (error && tx->tx_lnetmsg != NULL) {
 			CNETERR("Deleting packet type %d len %d %s->%s\n",
-				le32_to_cpu (tx->tx_lnetmsg->msg_hdr.type),
-				le32_to_cpu (tx->tx_lnetmsg->msg_hdr.payload_length),
-				libcfs_nid2str(le64_to_cpu(tx->tx_lnetmsg->msg_hdr.src_nid)),
-				libcfs_nid2str(le64_to_cpu(tx->tx_lnetmsg->msg_hdr.dest_nid)));
+				le32_to_cpu(tx->tx_lnetmsg->msg_hdr.type),
+				le32_to_cpu(
+					tx->tx_lnetmsg->msg_hdr.payload_length),
+				libcfs_nid2str(
+					le64_to_cpu(
+					tx->tx_lnetmsg->msg_hdr.src_nid)),
+				libcfs_nid2str(
+					le64_to_cpu(
+					tx->tx_lnetmsg->msg_hdr.dest_nid)));
 		} else if (error) {
 			CNETERR("Deleting noop packet\n");
 		}
@@ -500,20 +507,20 @@ ksocknal_uncheck_zc_req(ksock_tx_t *tx)
 }
 
 static int
-ksocknal_process_transmit (ksock_conn_t *conn, ksock_tx_t *tx)
+ksocknal_process_transmit(ksock_conn_t *conn, ksock_tx_t *tx)
 {
 	int rc;
 
 	if (tx->tx_zc_capable && !tx->tx_zc_checked)
 		ksocknal_check_zc_req(tx);
 
-	rc = ksocknal_transmit (conn, tx);
+	rc = ksocknal_transmit(conn, tx);
 
 	CDEBUG(D_NET, "send(%d) %d\n", tx->tx_resid, rc);
 
 	if (tx->tx_resid = 0) {
 		/* Sent everything OK */
-		LASSERT (rc = 0);
+		LASSERT(rc = 0);
 
 		return 0;
 	}
@@ -533,13 +540,13 @@ ksocknal_process_transmit (ksock_conn_t *conn, ksock_tx_t *tx)
 		spin_lock_bh(&ksocknal_data.ksnd_reaper_lock);
 
 		/* enomem list takes over scheduler's ref... */
-		LASSERT (conn->ksnc_tx_scheduled);
+		LASSERT(conn->ksnc_tx_scheduled);
 		list_add_tail(&conn->ksnc_tx_list,
 				  &ksocknal_data.ksnd_enomem_conns);
 		if (!cfs_time_aftereq(cfs_time_add(cfs_time_current(),
 						   SOCKNAL_ENOMEM_RETRY),
 				   ksocknal_data.ksnd_reaper_waketime))
-			wake_up (&ksocknal_data.ksnd_reaper_waitq);
+			wake_up(&ksocknal_data.ksnd_reaper_waitq);
 
 		spin_unlock_bh(&ksocknal_data.ksnd_reaper_lock);
 		return rc;
@@ -551,11 +558,13 @@ ksocknal_process_transmit (ksock_conn_t *conn, ksock_tx_t *tx)
 	if (!conn->ksnc_closing) {
 		switch (rc) {
 		case -ECONNRESET:
-			LCONSOLE_WARN("Host %pI4h reset our connection while we were sending data; it may have rebooted.\n",
+			LCONSOLE_WARN(
+				      "Host %pI4h reset our connection while we were sending data; it may have rebooted.\n",
 				      &conn->ksnc_ipaddr);
 			break;
 		default:
-			LCONSOLE_WARN("There was an unexpected network error while writing to %pI4h: %d.\n",
+			LCONSOLE_WARN(
+				      "There was an unexpected network error while writing to %pI4h: %d.\n",
 				      &conn->ksnc_ipaddr, rc);
 			break;
 		}
@@ -570,14 +579,14 @@ ksocknal_process_transmit (ksock_conn_t *conn, ksock_tx_t *tx)
 		ksocknal_uncheck_zc_req(tx);
 
 	/* it's not an error if conn is being closed */
-	ksocknal_close_conn_and_siblings (conn,
-					  (conn->ksnc_closing) ? 0 : rc);
+	ksocknal_close_conn_and_siblings(conn,
+					 (conn->ksnc_closing) ? 0 : rc);
 
 	return rc;
 }
 
 static void
-ksocknal_launch_connection_locked (ksock_route_t *route)
+ksocknal_launch_connection_locked(ksock_route_t *route)
 {
 
 	/* called holding write lock on ksnd_global_lock */
@@ -599,7 +608,7 @@ ksocknal_launch_connection_locked (ksock_route_t *route)
 }
 
 void
-ksocknal_launch_all_connections_locked (ksock_peer_t *peer)
+ksocknal_launch_all_connections_locked(ksock_peer_t *peer)
 {
 	ksock_route_t *route;
 
@@ -624,10 +633,10 @@ ksocknal_find_conn_locked(ksock_peer_t *peer, ksock_tx_t *tx, int nonblk)
 	int tnob = 0;
 	int fnob = 0;
 
-	list_for_each (tmp, &peer->ksnp_conns) {
+	list_for_each(tmp, &peer->ksnp_conns) {
 		ksock_conn_t *c  = list_entry(tmp, ksock_conn_t, ksnc_list);
 		int nob = atomic_read(&c->ksnc_tx_nob) +
-                                      c->ksnc_sock->sk->sk_wmem_queued;
+				      c->ksnc_sock->sk->sk_wmem_queued;
 		int rc;
 
 		LASSERT(!c->ksnc_closing);
@@ -644,8 +653,10 @@ ksocknal_find_conn_locked(ksock_peer_t *peer, ksock_tx_t *tx, int nonblk)
 
 		case SOCKNAL_MATCH_YES: /* typed connection */
 			if (typed = NULL || tnob > nob ||
-			    (tnob = nob && *ksocknal_tunables.ksnd_round_robin &&
-			     cfs_time_after(typed->ksnc_tx_last_post, c->ksnc_tx_last_post))) {
+			    (tnob = nob &&
+			     *ksocknal_tunables.ksnd_round_robin &&
+			     cfs_time_after(typed->ksnc_tx_last_post,
+			     c->ksnc_tx_last_post))) {
 				typed = c;
 				tnob  = nob;
 			}
@@ -653,8 +664,10 @@ ksocknal_find_conn_locked(ksock_peer_t *peer, ksock_tx_t *tx, int nonblk)
 
 		case SOCKNAL_MATCH_MAY: /* fallback connection */
 			if (fallback = NULL || fnob > nob ||
-			    (fnob = nob && *ksocknal_tunables.ksnd_round_robin &&
-			     cfs_time_after(fallback->ksnc_tx_last_post, c->ksnc_tx_last_post))) {
+			    (fnob = nob &&
+			     *ksocknal_tunables.ksnd_round_robin &&
+			     cfs_time_after(fallback->ksnc_tx_last_post,
+			     c->ksnc_tx_last_post))) {
 				fallback = c;
 				fnob = nob;
 			}
@@ -676,13 +689,13 @@ ksocknal_tx_prep(ksock_conn_t *conn, ksock_tx_t *tx)
 {
 	conn->ksnc_proto->pro_pack(tx);
 
-	atomic_add (tx->tx_nob, &conn->ksnc_tx_nob);
+	atomic_add(tx->tx_nob, &conn->ksnc_tx_nob);
 	ksocknal_conn_addref(conn); /* +1 ref for tx */
 	tx->tx_conn = conn;
 }
 
 void
-ksocknal_queue_tx_locked (ksock_tx_t *tx, ksock_conn_t *conn)
+ksocknal_queue_tx_locked(ksock_tx_t *tx, ksock_conn_t *conn)
 {
 	ksock_sched_t *sched = conn->ksnc_scheduler;
 	ksock_msg_t *msg = &tx->tx_msg;
@@ -708,14 +721,14 @@ ksocknal_queue_tx_locked (ksock_tx_t *tx, ksock_conn_t *conn)
 	 *
 	 * We always expect at least 1 mapped fragment containing the
 	 * complete ksocknal message header. */
-	LASSERT(lnet_iov_nob (tx->tx_niov, tx->tx_iov) +
+	LASSERT(lnet_iov_nob(tx->tx_niov, tx->tx_iov) +
 		lnet_kiov_nob(tx->tx_nkiov, tx->tx_kiov) =
 		(unsigned int)tx->tx_nob);
 	LASSERT(tx->tx_niov >= 1);
 	LASSERT(tx->tx_resid = tx->tx_nob);
 
-	CDEBUG (D_NET, "Packet %p type %d, nob %d niov %d nkiov %d\n",
-		tx, (tx->tx_lnetmsg != NULL) ? tx->tx_lnetmsg->msg_hdr.type:
+	CDEBUG(D_NET, "Packet %p type %d, nob %d niov %d nkiov %d\n",
+		tx, (tx->tx_lnetmsg != NULL) ? tx->tx_lnetmsg->msg_hdr.type :
 					       KSOCK_MSG_NOOP,
 		tx->tx_nob, tx->tx_niov, tx->tx_nkiov);
 
@@ -743,7 +756,8 @@ ksocknal_queue_tx_locked (ksock_tx_t *tx, ksock_conn_t *conn)
 		LASSERT(conn->ksnc_proto->pro_queue_tx_zcack != NULL);
 
 		if (conn->ksnc_proto->pro_queue_tx_zcack(conn, tx, 0))
-			ztx = tx; /* ZC ACK piggybacked on ztx release tx later */
+			ztx = tx; /* ZC ACK piggybacked on ztx release
+				   * tx later */
 
 	} else {
 		/* It's a normal packet - can it piggback a noop zc-ack that
@@ -756,7 +770,7 @@ ksocknal_queue_tx_locked (ksock_tx_t *tx, ksock_conn_t *conn)
 	}
 
 	if (ztx != NULL) {
-		atomic_sub (ztx->tx_nob, &conn->ksnc_tx_nob);
+		atomic_sub(ztx->tx_nob, &conn->ksnc_tx_nob);
 		list_add_tail(&ztx->tx_list, &sched->kss_zombie_noop_txs);
 	}
 
@@ -764,10 +778,10 @@ ksocknal_queue_tx_locked (ksock_tx_t *tx, ksock_conn_t *conn)
 	    !conn->ksnc_tx_scheduled) { /* not scheduled to send */
 		/* +1 ref for scheduler */
 		ksocknal_conn_addref(conn);
-		list_add_tail (&conn->ksnc_tx_list,
+		list_add_tail(&conn->ksnc_tx_list,
 				   &sched->kss_tx_conns);
 		conn->ksnc_tx_scheduled = 1;
-		wake_up (&sched->kss_waitq);
+		wake_up(&sched->kss_waitq);
 	}
 
 	spin_unlock_bh(&sched->kss_lock);
@@ -775,18 +789,18 @@ ksocknal_queue_tx_locked (ksock_tx_t *tx, ksock_conn_t *conn)
 
 
 ksock_route_t *
-ksocknal_find_connectable_route_locked (ksock_peer_t *peer)
+ksocknal_find_connectable_route_locked(ksock_peer_t *peer)
 {
 	unsigned long now = cfs_time_current();
 	struct list_head *tmp;
 	ksock_route_t *route;
 
-	list_for_each (tmp, &peer->ksnp_routes) {
-		route = list_entry (tmp, ksock_route_t, ksnr_list);
+	list_for_each(tmp, &peer->ksnp_routes) {
+		route = list_entry(tmp, ksock_route_t, ksnr_list);
 
 		LASSERT(!route->ksnr_connecting || route->ksnr_scheduled);
 
-		if (route->ksnr_scheduled)      /* connections being established */
+		if (route->ksnr_scheduled) /* connections being established */
 			continue;
 
 		/* all route types connected ? */
@@ -811,13 +825,13 @@ ksocknal_find_connectable_route_locked (ksock_peer_t *peer)
 }
 
 ksock_route_t *
-ksocknal_find_connecting_route_locked (ksock_peer_t *peer)
+ksocknal_find_connecting_route_locked(ksock_peer_t *peer)
 {
 	struct list_head *tmp;
 	ksock_route_t *route;
 
-	list_for_each (tmp, &peer->ksnp_routes) {
-		route = list_entry (tmp, ksock_route_t, ksnr_list);
+	list_for_each(tmp, &peer->ksnp_routes) {
+		route = list_entry(tmp, ksock_route_t, ksnr_list);
 
 		LASSERT(!route->ksnr_connecting || route->ksnr_scheduled);
 
@@ -829,7 +843,7 @@ ksocknal_find_connecting_route_locked (ksock_peer_t *peer)
 }
 
 int
-ksocknal_launch_packet (lnet_ni_t *ni, ksock_tx_t *tx, lnet_process_id_t id)
+ksocknal_launch_packet(lnet_ni_t *ni, ksock_tx_t *tx, lnet_process_id_t id)
 {
 	ksock_peer_t *peer;
 	ksock_conn_t *conn;
@@ -845,13 +859,15 @@ ksocknal_launch_packet (lnet_ni_t *ni, ksock_tx_t *tx, lnet_process_id_t id)
 		read_lock(g_lock);
 		peer = ksocknal_find_peer_locked(ni, id);
 		if (peer != NULL) {
-			if (ksocknal_find_connectable_route_locked(peer) = NULL) {
-				conn = ksocknal_find_conn_locked(peer, tx, tx->tx_nonblk);
+			if (ksocknal_find_connectable_route_locked(peer) =
+			    NULL) {
+				conn = ksocknal_find_conn_locked(peer, tx,
+								 tx->tx_nonblk);
 				if (conn != NULL) {
 					/* I've got no routes that need to be
 					 * connecting and I do have an actual
 					 * connection... */
-					ksocknal_queue_tx_locked (tx, conn);
+					ksocknal_queue_tx_locked(tx, conn);
 					read_unlock(g_lock);
 					return 0;
 				}
@@ -870,7 +886,8 @@ ksocknal_launch_packet (lnet_ni_t *ni, ksock_tx_t *tx, lnet_process_id_t id)
 		write_unlock_bh(g_lock);
 
 		if ((id.pid & LNET_PID_USERFLAG) != 0) {
-			CERROR("Refusing to create a connection to userspace process %s\n",
+			CERROR(
+			       "Refusing to create a connection to userspace process %s\n",
 			       libcfs_id2str(id));
 			return -EHOSTUNREACH;
 		}
@@ -895,19 +912,19 @@ ksocknal_launch_packet (lnet_ni_t *ni, ksock_tx_t *tx, lnet_process_id_t id)
 	conn = ksocknal_find_conn_locked(peer, tx, tx->tx_nonblk);
 	if (conn != NULL) {
 		/* Connection exists; queue message on it */
-		ksocknal_queue_tx_locked (tx, conn);
+		ksocknal_queue_tx_locked(tx, conn);
 		write_unlock_bh(g_lock);
 		return 0;
 	}
 
 	if (peer->ksnp_accepting > 0 ||
-	    ksocknal_find_connecting_route_locked (peer) != NULL) {
+	    ksocknal_find_connecting_route_locked(peer) != NULL) {
 		/* the message is going to be pinned to the peer */
 		tx->tx_deadline  			cfs_time_shift(*ksocknal_tunables.ksnd_timeout);
 
 		/* Queue the message until a connection is established */
-		list_add_tail (&tx->tx_list, &peer->ksnp_tx_queue);
+		list_add_tail(&tx->tx_list, &peer->ksnp_tx_queue);
 		write_unlock_bh(g_lock);
 		return 0;
 	}
@@ -943,8 +960,8 @@ ksocknal_send(lnet_ni_t *ni, void *private, lnet_msg_t *lntmsg)
 	LASSERT(payload_nob = 0 || payload_niov > 0);
 	LASSERT(payload_niov <= LNET_MAX_IOV);
 	/* payload is either all vaddrs or all pages */
-	LASSERT (!(payload_kiov != NULL && payload_iov != NULL));
-	LASSERT (!in_interrupt ());
+	LASSERT(!(payload_kiov != NULL && payload_iov != NULL));
+	LASSERT(!in_interrupt());
 
 	if (payload_iov != NULL)
 		desc_size = offsetof(ksock_tx_t,
@@ -1016,7 +1033,7 @@ ksocknal_thread_start(int (*fn)(void *arg), void *arg, char *name)
 }
 
 void
-ksocknal_thread_fini (void)
+ksocknal_thread_fini(void)
 {
 	write_lock_bh(&ksocknal_data.ksnd_global_lock);
 	ksocknal_data.ksnd_nthreads--;
@@ -1024,7 +1041,7 @@ ksocknal_thread_fini (void)
 }
 
 int
-ksocknal_new_packet (ksock_conn_t *conn, int nob_to_skip)
+ksocknal_new_packet(ksock_conn_t *conn, int nob_to_skip)
 {
 	static char ksocknal_slop_buffer[4096];
 
@@ -1047,12 +1064,14 @@ ksocknal_new_packet (ksock_conn_t *conn, int nob_to_skip)
 		case  KSOCK_PROTO_V2:
 		case  KSOCK_PROTO_V3:
 			conn->ksnc_rx_state = SOCKNAL_RX_KSM_HEADER;
-			conn->ksnc_rx_iov = (struct kvec *)&conn->ksnc_rx_iov_space;
+			conn->ksnc_rx_iov +					(struct kvec *)&conn->ksnc_rx_iov_space;
 			conn->ksnc_rx_iov[0].iov_base = &conn->ksnc_msg;
 
 			conn->ksnc_rx_nob_wanted = offsetof(ksock_msg_t, ksm_u);
 			conn->ksnc_rx_nob_left = offsetof(ksock_msg_t, ksm_u);
-			conn->ksnc_rx_iov[0].iov_len  = offsetof(ksock_msg_t, ksm_u);
+			conn->ksnc_rx_iov[0].iov_len +					offsetof(ksock_msg_t, ksm_u);
 			break;
 
 		case KSOCK_PROTO_V1:
@@ -1061,13 +1080,15 @@ ksocknal_new_packet (ksock_conn_t *conn, int nob_to_skip)
 			conn->ksnc_rx_nob_wanted = sizeof(lnet_hdr_t);
 			conn->ksnc_rx_nob_left = sizeof(lnet_hdr_t);
 
-			conn->ksnc_rx_iov = (struct kvec *)&conn->ksnc_rx_iov_space;
-			conn->ksnc_rx_iov[0].iov_base = &conn->ksnc_msg.ksm_u.lnetmsg;
-			conn->ksnc_rx_iov[0].iov_len = sizeof (lnet_hdr_t);
+			conn->ksnc_rx_iov +					(struct kvec *)&conn->ksnc_rx_iov_space;
+			conn->ksnc_rx_iov[0].iov_base +					&conn->ksnc_msg.ksm_u.lnetmsg;
+			conn->ksnc_rx_iov[0].iov_len = sizeof(lnet_hdr_t);
 			break;
 
 		default:
-			LBUG ();
+			LBUG();
 		}
 		conn->ksnc_rx_niov = 1;
 
@@ -1093,10 +1114,10 @@ ksocknal_new_packet (ksock_conn_t *conn, int nob_to_skip)
 		conn->ksnc_rx_iov[niov].iov_len  = nob;
 		niov++;
 		skipped += nob;
-		nob_to_skip -=nob;
+		nob_to_skip -= nob;
 
 	} while (nob_to_skip != 0 &&    /* mustn't overflow conn's rx iov */
-		 niov < sizeof(conn->ksnc_rx_iov_space) / sizeof (struct iovec));
+		 niov < sizeof(conn->ksnc_rx_iov_space) / sizeof(struct iovec));
 
 	conn->ksnc_rx_niov = niov;
 	conn->ksnc_rx_kiov = NULL;
@@ -1106,13 +1127,13 @@ ksocknal_new_packet (ksock_conn_t *conn, int nob_to_skip)
 }
 
 static int
-ksocknal_process_receive (ksock_conn_t *conn)
+ksocknal_process_receive(ksock_conn_t *conn)
 {
 	lnet_hdr_t *lhdr;
 	lnet_process_id_t *id;
 	int rc;
 
-	LASSERT (atomic_read(&conn->ksnc_conn_refcount) > 0);
+	LASSERT(atomic_read(&conn->ksnc_conn_refcount) > 0);
 
 	/* NB: sched lock NOT held */
 	/* SOCKNAL_RX_LNET_HEADER is here for backward compatibility */
@@ -1125,24 +1146,27 @@ ksocknal_process_receive (ksock_conn_t *conn)
 		rc = ksocknal_receive(conn);
 
 		if (rc <= 0) {
-			LASSERT (rc != -EAGAIN);
+			LASSERT(rc != -EAGAIN);
 
 			if (rc = 0)
-				CDEBUG(D_NET, "[%p] EOF from %s ip %pI4h:%d\n",
+				CDEBUG(D_NET,
+				       "[%p] EOF from %s ip %pI4h:%d\n",
 				       conn,
 				       libcfs_id2str(conn->ksnc_peer->ksnp_id),
 				       &conn->ksnc_ipaddr,
 				       conn->ksnc_port);
 			else if (!conn->ksnc_closing)
-				CERROR("[%p] Error %d on read from %s ip %pI4h:%d\n",
+				CERROR(
+				       "[%p] Error %d on read from %s ip %pI4h:%d\n",
 				       conn, rc,
 				       libcfs_id2str(conn->ksnc_peer->ksnp_id),
 				       &conn->ksnc_ipaddr,
 				       conn->ksnc_port);
 
 			/* it's not an error if conn is being closed */
-			ksocknal_close_conn_and_siblings (conn,
-							  (conn->ksnc_closing) ? 0 : rc);
+			ksocknal_close_conn_and_siblings(conn,
+							 (conn->ksnc_closing) ?
+							 0 : rc);
 			return (rc = 0 ? -ESHUTDOWN : rc);
 		}
 
@@ -1185,18 +1209,20 @@ ksocknal_process_receive (ksock_conn_t *conn)
 		if (conn->ksnc_msg.ksm_zc_cookies[1] != 0) {
 			__u64 cookie = 0;
 
-			LASSERT (conn->ksnc_proto != &ksocknal_protocol_v1x);
+			LASSERT(conn->ksnc_proto != &ksocknal_protocol_v1x);
 
 			if (conn->ksnc_msg.ksm_type = KSOCK_MSG_NOOP)
 				cookie = conn->ksnc_msg.ksm_zc_cookies[0];
 
 			rc = conn->ksnc_proto->pro_handle_zcack(conn, cookie,
-					       conn->ksnc_msg.ksm_zc_cookies[1]);
+				       conn->ksnc_msg.ksm_zc_cookies[1]);
 
 			if (rc != 0) {
-				CERROR("%s: Unknown ZC-ACK cookie: %llu, %llu\n",
+				CERROR(
+				       "%s: Unknown ZC-ACK cookie: %llu, %llu\n",
 				       libcfs_id2str(conn->ksnc_peer->ksnp_id),
-				       cookie, conn->ksnc_msg.ksm_zc_cookies[1]);
+				       cookie,
+				       conn->ksnc_msg.ksm_zc_cookies[1]);
 				ksocknal_new_packet(conn, 0);
 				ksocknal_close_conn_and_siblings(conn, -EPROTO);
 				return rc;
@@ -1204,7 +1230,7 @@ ksocknal_process_receive (ksock_conn_t *conn)
 		}
 
 		if (conn->ksnc_msg.ksm_type = KSOCK_MSG_NOOP) {
-			ksocknal_new_packet (conn, 0);
+			ksocknal_new_packet(conn, 0);
 			return 0;       /* NOOP is done and just return */
 		}
 
@@ -1245,14 +1271,14 @@ ksocknal_process_receive (ksock_conn_t *conn)
 		if (rc < 0) {
 			/* I just received garbage: give up on this conn */
 			ksocknal_new_packet(conn, 0);
-			ksocknal_close_conn_and_siblings (conn, rc);
+			ksocknal_close_conn_and_siblings(conn, rc);
 			ksocknal_conn_decref(conn);
 			return -EPROTO;
 		}
 
 		/* I'm racing with ksocknal_recv() */
-		LASSERT (conn->ksnc_rx_state = SOCKNAL_RX_PARSE ||
-			 conn->ksnc_rx_state = SOCKNAL_RX_LNET_PAYLOAD);
+		LASSERT(conn->ksnc_rx_state = SOCKNAL_RX_PARSE ||
+			conn->ksnc_rx_state = SOCKNAL_RX_LNET_PAYLOAD);
 
 		if (conn->ksnc_rx_state != SOCKNAL_RX_LNET_PAYLOAD)
 			return 0;
@@ -1289,14 +1315,14 @@ ksocknal_process_receive (ksock_conn_t *conn)
 
 		if (rc != 0) {
 			ksocknal_new_packet(conn, 0);
-			ksocknal_close_conn_and_siblings (conn, rc);
+			ksocknal_close_conn_and_siblings(conn, rc);
 			return -EPROTO;
 		}
 		/* Fall through */
 
 	case SOCKNAL_RX_SLOP:
 		/* starting new packet? */
-		if (ksocknal_new_packet (conn, conn->ksnc_rx_nob_left))
+		if (ksocknal_new_packet(conn, conn->ksnc_rx_nob_left))
 			return 0;       /* come back later */
 		goto again;	     /* try to finish reading slop now */
 
@@ -1310,7 +1336,7 @@ ksocknal_process_receive (ksock_conn_t *conn)
 }
 
 int
-ksocknal_recv (lnet_ni_t *ni, void *private, lnet_msg_t *msg, int delayed,
+ksocknal_recv(lnet_ni_t *ni, void *private, lnet_msg_t *msg, int delayed,
 	       unsigned int niov, struct kvec *iov, lnet_kiov_t *kiov,
 	       unsigned int offset, unsigned int mlen, unsigned int rlen)
 {
@@ -1351,8 +1377,8 @@ ksocknal_recv (lnet_ni_t *ni, void *private, lnet_msg_t *msg, int delayed,
 	switch (conn->ksnc_rx_state) {
 	case SOCKNAL_RX_PARSE_WAIT:
 		list_add_tail(&conn->ksnc_rx_list, &sched->kss_rx_conns);
-		wake_up (&sched->kss_waitq);
-		LASSERT (conn->ksnc_rx_ready);
+		wake_up(&sched->kss_waitq);
+		LASSERT(conn->ksnc_rx_ready);
 		break;
 
 	case SOCKNAL_RX_PARSE:
@@ -1410,7 +1436,7 @@ int ksocknal_scheduler(void *arg)
 
 		/* Ensure I progress everything semi-fairly */
 
-		if (!list_empty (&sched->kss_rx_conns)) {
+		if (!list_empty(&sched->kss_rx_conns)) {
 			conn = list_entry(sched->kss_rx_conns.next,
 					      ksock_conn_t, ksnc_rx_list);
 			list_del(&conn->ksnc_rx_list);
@@ -1443,7 +1469,7 @@ int ksocknal_scheduler(void *arg)
 				conn->ksnc_rx_state = SOCKNAL_RX_PARSE_WAIT;
 			} else if (conn->ksnc_rx_ready) {
 				/* reschedule for rx */
-				list_add_tail (&conn->ksnc_rx_list,
+				list_add_tail(&conn->ksnc_rx_list,
 						   &sched->kss_rx_conns);
 			} else {
 				conn->ksnc_rx_scheduled = 0;
@@ -1454,7 +1480,7 @@ int ksocknal_scheduler(void *arg)
 			did_something = 1;
 		}
 
-		if (!list_empty (&sched->kss_tx_conns)) {
+		if (!list_empty(&sched->kss_tx_conns)) {
 			LIST_HEAD(zlist);
 
 			if (!list_empty(&sched->kss_zombie_noop_txs)) {
@@ -1465,7 +1491,7 @@ int ksocknal_scheduler(void *arg)
 
 			conn = list_entry(sched->kss_tx_conns.next,
 					      ksock_conn_t, ksnc_tx_list);
-			list_del (&conn->ksnc_tx_list);
+			list_del(&conn->ksnc_tx_list);
 
 			LASSERT(conn->ksnc_tx_scheduled);
 			LASSERT(conn->ksnc_tx_ready);
@@ -1496,7 +1522,8 @@ int ksocknal_scheduler(void *arg)
 			rc = ksocknal_process_transmit(conn, tx);
 
 			if (rc = -ENOMEM || rc = -EAGAIN) {
-				/* Incomplete send: replace tx on HEAD of tx_queue */
+				/* Incomplete send: replace tx on HEAD of
+				 * tx_queue */
 				spin_lock_bh(&sched->kss_lock);
 				list_add(&tx->tx_list,
 					     &conn->ksnc_tx_queue);
@@ -1535,7 +1562,7 @@ int ksocknal_scheduler(void *arg)
 				rc = wait_event_interruptible_exclusive(
 					sched->kss_waitq,
 					!ksocknal_sched_cansleep(sched));
-				LASSERT (rc = 0);
+				LASSERT(rc = 0);
 			} else {
 				cond_resched();
 			}
@@ -1553,7 +1580,7 @@ int ksocknal_scheduler(void *arg)
  * Add connection to kss_rx_conns of scheduler
  * and wakeup the scheduler.
  */
-void ksocknal_read_callback (ksock_conn_t *conn)
+void ksocknal_read_callback(ksock_conn_t *conn)
 {
 	ksock_sched_t *sched;
 
@@ -1570,7 +1597,7 @@ void ksocknal_read_callback (ksock_conn_t *conn)
 		/* extra ref for scheduler */
 		ksocknal_conn_addref(conn);
 
-		wake_up (&sched->kss_waitq);
+		wake_up(&sched->kss_waitq);
 	}
 	spin_unlock_bh(&sched->kss_lock);
 }
@@ -1579,7 +1606,7 @@ void ksocknal_read_callback (ksock_conn_t *conn)
  * Add connection to kss_tx_conns of scheduler
  * and wakeup the scheduler.
  */
-void ksocknal_write_callback (ksock_conn_t *conn)
+void ksocknal_write_callback(ksock_conn_t *conn)
 {
 	ksock_sched_t *sched;
 
@@ -1591,20 +1618,20 @@ void ksocknal_write_callback (ksock_conn_t *conn)
 
 	if (!conn->ksnc_tx_scheduled && /* not being progressed */
 	    !list_empty(&conn->ksnc_tx_queue)) { /* packets to send */
-		list_add_tail (&conn->ksnc_tx_list,
+		list_add_tail(&conn->ksnc_tx_list,
 				   &sched->kss_tx_conns);
 		conn->ksnc_tx_scheduled = 1;
 		/* extra ref for scheduler */
 		ksocknal_conn_addref(conn);
 
-		wake_up (&sched->kss_waitq);
+		wake_up(&sched->kss_waitq);
 	}
 
 	spin_unlock_bh(&sched->kss_lock);
 }
 
 static ksock_proto_t *
-ksocknal_parse_proto_version (ksock_hello_msg_t *hello)
+ksocknal_parse_proto_version(ksock_hello_msg_t *hello)
 {
 	__u32 version = 0;
 
@@ -1634,8 +1661,8 @@ ksocknal_parse_proto_version (ksock_hello_msg_t *hello)
 	if (hello->kshm_magic = le32_to_cpu(LNET_PROTO_TCP_MAGIC)) {
 		lnet_magicversion_t *hmv = (lnet_magicversion_t *)hello;
 
-		CLASSERT(sizeof (lnet_magicversion_t) =
-			 offsetof (ksock_hello_msg_t, kshm_src_nid));
+		CLASSERT(sizeof(lnet_magicversion_t) =
+			 offsetof(ksock_hello_msg_t, kshm_src_nid));
 
 		if (hmv->version_major = cpu_to_le16 (KSOCK_PROTO_V1_MAJOR) &&
 		    hmv->version_minor = cpu_to_le16 (KSOCK_PROTO_V1_MINOR))
@@ -1646,8 +1673,8 @@ ksocknal_parse_proto_version (ksock_hello_msg_t *hello)
 }
 
 int
-ksocknal_send_hello (lnet_ni_t *ni, ksock_conn_t *conn,
-		     lnet_nid_t peer_nid, ksock_hello_msg_t *hello)
+ksocknal_send_hello(lnet_ni_t *ni, ksock_conn_t *conn,
+		    lnet_nid_t peer_nid, ksock_hello_msg_t *hello)
 {
 	/* CAVEAT EMPTOR: this byte flips 'ipaddrs' */
 	ksock_net_t *net = (ksock_net_t *)ni->ni_data;
@@ -1684,9 +1711,9 @@ ksocknal_invert_type(int type)
 }
 
 int
-ksocknal_recv_hello (lnet_ni_t *ni, ksock_conn_t *conn,
-		     ksock_hello_msg_t *hello, lnet_process_id_t *peerid,
-		     __u64 *incarnation)
+ksocknal_recv_hello(lnet_ni_t *ni, ksock_conn_t *conn,
+		    ksock_hello_msg_t *hello, lnet_process_id_t *peerid,
+		    __u64 *incarnation)
 {
 	/* Return < 0	fatal error
 	 *	0	  success
@@ -1707,17 +1734,18 @@ ksocknal_recv_hello (lnet_ni_t *ni, ksock_conn_t *conn,
 	timeout = active ? *ksocknal_tunables.ksnd_timeout :
 			    lnet_acceptor_timeout();
 
-	rc = libcfs_sock_read(sock, &hello->kshm_magic, sizeof (hello->kshm_magic), timeout);
+	rc = libcfs_sock_read(sock, &hello->kshm_magic,
+			      sizeof(hello->kshm_magic), timeout);
 	if (rc != 0) {
 		CERROR("Error %d reading HELLO from %pI4h\n",
 			rc, &conn->ksnc_ipaddr);
-		LASSERT (rc < 0);
+		LASSERT(rc < 0);
 		return rc;
 	}
 
 	if (hello->kshm_magic != LNET_PROTO_MAGIC &&
 	    hello->kshm_magic != __swab32(LNET_PROTO_MAGIC) &&
-	    hello->kshm_magic != le32_to_cpu (LNET_PROTO_TCP_MAGIC)) {
+	    hello->kshm_magic != le32_to_cpu(LNET_PROTO_TCP_MAGIC)) {
 		/* Unexpected magic! */
 		CERROR("Bad magic(1) %#08x (%#08x expected) from %pI4h\n",
 		       __cpu_to_le32 (hello->kshm_magic),
@@ -1772,7 +1800,8 @@ ksocknal_recv_hello (lnet_ni_t *ni, ksock_conn_t *conn,
 	*incarnation = hello->kshm_src_incarnation;
 
 	if (hello->kshm_src_nid = LNET_NID_ANY) {
-		CERROR("Expecting a HELLO hdr with a NID, but got LNET_NID_ANY from %pI4h\n",
+		CERROR(
+		       "Expecting a HELLO hdr with a NID, but got LNET_NID_ANY from %pI4h\n",
 		       &conn->ksnc_ipaddr);
 		return -EPROTO;
 	}
@@ -1781,7 +1810,8 @@ ksocknal_recv_hello (lnet_ni_t *ni, ksock_conn_t *conn,
 	    conn->ksnc_port > LNET_ACCEPTOR_MAX_RESERVED_PORT) {
 		/* Userspace NAL assigns peer process ID from socket */
 		recv_id.pid = conn->ksnc_port | LNET_PID_USERFLAG;
-		recv_id.nid = LNET_MKNID(LNET_NIDNET(ni->ni_nid), conn->ksnc_ipaddr);
+		recv_id.nid = LNET_MKNID(LNET_NIDNET(ni->ni_nid),
+					 conn->ksnc_ipaddr);
 	} else {
 		recv_id.nid = hello->kshm_src_nid;
 		recv_id.pid = hello->kshm_src_pid;
@@ -1804,7 +1834,8 @@ ksocknal_recv_hello (lnet_ni_t *ni, ksock_conn_t *conn,
 
 	if (peerid->pid != recv_id.pid ||
 	    peerid->nid != recv_id.nid) {
-		LCONSOLE_ERROR_MSG(0x130, "Connected successfully to %s on host %pI4h, but they claimed they were %s; please check your Lustre configuration.\n",
+		LCONSOLE_ERROR_MSG(0x130,
+				   "Connected successfully to %s on host %pI4h, but they claimed they were %s; please check your Lustre configuration.\n",
 				   libcfs_id2str(*peerid),
 				   &conn->ksnc_ipaddr,
 				   libcfs_id2str(recv_id));
@@ -1828,7 +1859,7 @@ ksocknal_recv_hello (lnet_ni_t *ni, ksock_conn_t *conn,
 }
 
 static int
-ksocknal_connect (ksock_route_t *route)
+ksocknal_connect(ksock_route_t *route)
 {
 	LIST_HEAD(zombies);
 	ksock_peer_t *peer = route->ksnr_peer;
@@ -1840,7 +1871,8 @@ ksocknal_connect (ksock_route_t *route)
 	int rc = 0;
 
 	deadline = cfs_time_add(cfs_time_current(),
-				cfs_time_seconds(*ksocknal_tunables.ksnd_timeout));
+				cfs_time_seconds(
+					*ksocknal_tunables.ksnd_timeout));
 
 	write_lock_bh(&ksocknal_data.ksnd_global_lock);
 
@@ -1864,7 +1896,8 @@ ksocknal_connect (ksock_route_t *route)
 		if (peer->ksnp_accepting > 0) {
 			CDEBUG(D_NET,
 			       "peer %s(%d) already connecting to me, retry later.\n",
-			       libcfs_nid2str(peer->ksnp_id.nid), peer->ksnp_accepting);
+			       libcfs_nid2str(peer->ksnp_id.nid),
+			       peer->ksnp_accepting);
 			retry_later = 1;
 		}
 
@@ -1878,7 +1911,7 @@ ksocknal_connect (ksock_route_t *route)
 		} else if ((wanted & (1 << SOCKLND_CONN_BULK_IN)) != 0) {
 			type = SOCKLND_CONN_BULK_IN;
 		} else {
-			LASSERT ((wanted & (1 << SOCKLND_CONN_BULK_OUT)) != 0);
+			LASSERT((wanted & (1 << SOCKLND_CONN_BULK_OUT)) != 0);
 			type = SOCKLND_CONN_BULK_OUT;
 		}
 
@@ -1930,9 +1963,10 @@ ksocknal_connect (ksock_route_t *route)
 			 * but the race is resolved quickly usually,
 			 * so min_reconnectms should be good heuristic */
 			route->ksnr_retry_interval -				cfs_time_seconds(*ksocknal_tunables.ksnd_min_reconnectms)/1000;
+				cfs_time_seconds(
+				*ksocknal_tunables.ksnd_min_reconnectms)/1000;
 			route->ksnr_timeout = cfs_time_add(cfs_time_current(),
-							   route->ksnr_retry_interval);
+						   route->ksnr_retry_interval);
 		}
 
 		ksocknal_launch_connection_locked(route);
@@ -1951,12 +1985,14 @@ ksocknal_connect (ksock_route_t *route)
 	route->ksnr_retry_interval *= 2;
 	route->ksnr_retry_interval  		max(route->ksnr_retry_interval,
-		    cfs_time_seconds(*ksocknal_tunables.ksnd_min_reconnectms)/1000);
+		    cfs_time_seconds(
+			    *ksocknal_tunables.ksnd_min_reconnectms)/1000);
 	route->ksnr_retry_interval  		min(route->ksnr_retry_interval,
-		    cfs_time_seconds(*ksocknal_tunables.ksnd_max_reconnectms)/1000);
+		    cfs_time_seconds(
+			    *ksocknal_tunables.ksnd_max_reconnectms)/1000);
 
-	LASSERT (route->ksnr_retry_interval != 0);
+	LASSERT(route->ksnr_retry_interval != 0);
 	route->ksnr_timeout = cfs_time_add(cfs_time_current(),
 					   route->ksnr_retry_interval);
 
@@ -1967,10 +2003,10 @@ ksocknal_connect (ksock_route_t *route)
 
 		/* ksnp_tx_queue is queued on a conn on successful
 		 * connection for V1.x and V2.x */
-		if (!list_empty (&peer->ksnp_conns)) {
+		if (!list_empty(&peer->ksnp_conns)) {
 			conn = list_entry(peer->ksnp_conns.next,
 					      ksock_conn_t, ksnc_list);
-			LASSERT (conn->ksnc_proto = &ksocknal_protocol_v3x);
+			LASSERT(conn->ksnc_proto = &ksocknal_protocol_v3x);
 		}
 
 		/* take all the blocked packets while I've got the lock and
@@ -2106,7 +2142,7 @@ ksocknal_connd_get_route_locked(signed long *timeout_p)
 	now = cfs_time_current();
 
 	/* connd_routes can contain both pending and ordinary routes */
-	list_for_each_entry (route, &ksocknal_data.ksnd_connd_routes,
+	list_for_each_entry(route, &ksocknal_data.ksnd_connd_routes,
 				 ksnr_connd_list) {
 
 		if (route->ksnr_retry_interval = 0 ||
@@ -2122,7 +2158,7 @@ ksocknal_connd_get_route_locked(signed long *timeout_p)
 }
 
 int
-ksocknal_connd (void *arg)
+ksocknal_connd(void *arg)
 {
 	spinlock_t *connd_lock = &ksocknal_data.ksnd_connd_lock;
 	ksock_connreq_t *cr;
@@ -2159,8 +2195,8 @@ ksocknal_connd (void *arg)
 
 		if (!list_empty(&ksocknal_data.ksnd_connd_connreqs)) {
 			/* Connection accepted by the listener */
-			cr = list_entry(ksocknal_data.ksnd_connd_connreqs. \
-					    next, ksock_connreq_t, ksncr_list);
+			cr = list_entry(ksocknal_data.ksnd_connd_connreqs.next,
+					ksock_connreq_t, ksncr_list);
 
 			list_del(&cr->ksncr_list);
 			spin_unlock_bh(connd_lock);
@@ -2182,7 +2218,7 @@ ksocknal_connd (void *arg)
 			route = ksocknal_connd_get_route_locked(&timeout);
 		}
 		if (route != NULL) {
-			list_del (&route->ksnr_connd_list);
+			list_del(&route->ksnr_connd_list);
 			ksocknal_data.ksnd_connd_connecting++;
 			spin_unlock_bh(connd_lock);
 			dropped_lock = 1;
@@ -2190,7 +2226,8 @@ ksocknal_connd (void *arg)
 			if (ksocknal_connect(route)) {
 				/* consecutive retry */
 				if (cons_retry++ > SOCKNAL_INSANITY_RECONN) {
-					CWARN("massive consecutive re-connecting to %pI4h\n",
+					CWARN(
+					      "massive consecutive re-connecting to %pI4h\n",
 					      &route->ksnr_ipaddr);
 					cons_retry = 0;
 				}
@@ -2216,7 +2253,8 @@ ksocknal_connd (void *arg)
 
 		/* Nothing to do for 'timeout'  */
 		set_current_state(TASK_INTERRUPTIBLE);
-		add_wait_queue_exclusive(&ksocknal_data.ksnd_connd_waitq, &wait);
+		add_wait_queue_exclusive(&ksocknal_data.ksnd_connd_waitq,
+					 &wait);
 		spin_unlock_bh(connd_lock);
 
 		nloops = 0;
@@ -2233,15 +2271,16 @@ ksocknal_connd (void *arg)
 }
 
 static ksock_conn_t *
-ksocknal_find_timed_out_conn (ksock_peer_t *peer)
+ksocknal_find_timed_out_conn(ksock_peer_t *peer)
 {
 	/* We're called with a shared lock on ksnd_global_lock */
 	ksock_conn_t *conn;
 	struct list_head *ctmp;
 
-	list_for_each (ctmp, &peer->ksnp_conns) {
+	list_for_each(ctmp, &peer->ksnp_conns) {
 		int error;
-		conn = list_entry (ctmp, ksock_conn_t, ksnc_list);
+
+		conn = list_entry(ctmp, ksock_conn_t, ksnc_list);
 
 		/* Don't need the {get,put}connsock dance to deref ksnc_sock */
 		LASSERT(!conn->ksnc_closing);
@@ -2254,19 +2293,22 @@ ksocknal_find_timed_out_conn (ksock_peer_t *peer)
 
 			switch (error) {
 			case ECONNRESET:
-				CNETERR("A connection with %s (%pI4h:%d) was reset; it may have rebooted.\n",
+				CNETERR(
+					"A connection with %s (%pI4h:%d) was reset; it may have rebooted.\n",
 					libcfs_id2str(peer->ksnp_id),
 					&conn->ksnc_ipaddr,
 					conn->ksnc_port);
 				break;
 			case ETIMEDOUT:
-				CNETERR("A connection with %s (%pI4h:%d) timed out; the network or node may be down.\n",
+				CNETERR(
+					"A connection with %s (%pI4h:%d) timed out; the network or node may be down.\n",
 					libcfs_id2str(peer->ksnp_id),
 					&conn->ksnc_ipaddr,
 					conn->ksnc_port);
 				break;
 			default:
-				CNETERR("An unexpected network error %d occurred with %s (%pI4h:%d\n",
+				CNETERR(
+					"An unexpected network error %d occurred with %s (%pI4h:%d\n",
 					error,
 					libcfs_id2str(peer->ksnp_id),
 					&conn->ksnc_ipaddr,
@@ -2282,7 +2324,8 @@ ksocknal_find_timed_out_conn (ksock_peer_t *peer)
 				     conn->ksnc_rx_deadline)) {
 			/* Timed out incomplete incoming message */
 			ksocknal_conn_addref(conn);
-			CNETERR("Timeout receiving from %s (%pI4h:%d), state %d wanted %d left %d\n",
+			CNETERR(
+				"Timeout receiving from %s (%pI4h:%d), state %d wanted %d left %d\n",
 				libcfs_id2str(peer->ksnp_id),
 				&conn->ksnc_ipaddr,
 				conn->ksnc_port,
@@ -2299,7 +2342,8 @@ ksocknal_find_timed_out_conn (ksock_peer_t *peer)
 			/* Timed out messages queued for sending or
 			 * buffered in the socket's send buffer */
 			ksocknal_conn_addref(conn);
-			CNETERR("Timeout sending data to %s (%pI4h:%d) the network or that node may be down.\n",
+			CNETERR(
+				"Timeout sending data to %s (%pI4h:%d) the network or that node may be down.\n",
 				libcfs_id2str(peer->ksnp_id),
 				&conn->ksnc_ipaddr,
 				conn->ksnc_port);
@@ -2318,16 +2362,16 @@ ksocknal_flush_stale_txs(ksock_peer_t *peer)
 
 	write_lock_bh(&ksocknal_data.ksnd_global_lock);
 
-	while (!list_empty (&peer->ksnp_tx_queue)) {
-		tx = list_entry (peer->ksnp_tx_queue.next,
+	while (!list_empty(&peer->ksnp_tx_queue)) {
+		tx = list_entry(peer->ksnp_tx_queue.next,
 				     ksock_tx_t, tx_list);
 
 		if (!cfs_time_aftereq(cfs_time_current(),
 				      tx->tx_deadline))
 			break;
 
-		list_del (&tx->tx_list);
-		list_add_tail (&tx->tx_list, &stale_txs);
+		list_del(&tx->tx_list);
+		list_add_tail(&tx->tx_list, &stale_txs);
 	}
 
 	write_unlock_bh(&ksocknal_data.ksnd_global_lock);
@@ -2342,7 +2386,8 @@ ksocknal_send_keepalive_locked(ksock_peer_t *peer)
 	ksock_conn_t *conn;
 	ksock_tx_t *tx;
 
-	if (list_empty(&peer->ksnp_conns)) /* last_alive will be updated by create_conn */
+	/* last_alive will be updated by create_conn */
+	if (list_empty(&peer->ksnp_conns))
 		return 0;
 
 	if (peer->ksnp_proto != &ksocknal_protocol_v3x)
@@ -2351,7 +2396,8 @@ ksocknal_send_keepalive_locked(ksock_peer_t *peer)
 	if (*ksocknal_tunables.ksnd_keepalive <= 0 ||
 	    time_before(cfs_time_current(),
 			cfs_time_add(peer->ksnp_last_alive,
-				     cfs_time_seconds(*ksocknal_tunables.ksnd_keepalive))))
+				     cfs_time_seconds(
+				     *ksocknal_tunables.ksnd_keepalive))))
 		return 0;
 
 	if (time_before(cfs_time_current(), peer->ksnp_send_keepalive))
@@ -2397,7 +2443,7 @@ ksocknal_send_keepalive_locked(ksock_peer_t *peer)
 
 
 static void
-ksocknal_check_peer_timeouts (int idx)
+ksocknal_check_peer_timeouts(int idx)
 {
 	struct list_head *peers = &ksocknal_data.ksnd_peers[idx];
 	ksock_peer_t *peer;
@@ -2420,12 +2466,12 @@ ksocknal_check_peer_timeouts (int idx)
 			goto again;
 		}
 
-		conn = ksocknal_find_timed_out_conn (peer);
+		conn = ksocknal_find_timed_out_conn(peer);
 
 		if (conn != NULL) {
 			read_unlock(&ksocknal_data.ksnd_global_lock);
 
-			ksocknal_close_conn_and_siblings (conn, -ETIMEDOUT);
+			ksocknal_close_conn_and_siblings(conn, -ETIMEDOUT);
 
 			/* NB we won't find this one again, but we can't
 			 * just proceed with the next peer, since we dropped
@@ -2436,9 +2482,9 @@ ksocknal_check_peer_timeouts (int idx)
 
 		/* we can't process stale txs right here because we're
 		 * holding only shared lock */
-		if (!list_empty (&peer->ksnp_tx_queue)) {
+		if (!list_empty(&peer->ksnp_tx_queue)) {
 			ksock_tx_t *tx -				list_entry (peer->ksnp_tx_queue.next,
+				list_entry(peer->ksnp_tx_queue.next,
 						ksock_tx_t, tx_list);
 
 			if (cfs_time_aftereq(cfs_time_current(),
@@ -2483,12 +2529,13 @@ ksocknal_check_peer_timeouts (int idx)
 		spin_unlock(&peer->ksnp_lock);
 		read_unlock(&ksocknal_data.ksnd_global_lock);
 
-		CERROR("Total %d stale ZC_REQs for peer %s detected; the oldest(%p) timed out %ld secs ago, resid: %d, wmem: %d\n",
+		CERROR(
+		       "Total %d stale ZC_REQs for peer %s detected; the oldest(%p) timed out %ld secs ago, resid: %d, wmem: %d\n",
 		       n, libcfs_nid2str(peer->ksnp_id.nid), tx,
 		       cfs_duration_sec(cfs_time_current() - deadline),
 		       resid, conn->ksnc_sock->sk->sk_wmem_queued);
 
-		ksocknal_close_conn_and_siblings (conn, -ETIMEDOUT);
+		ksocknal_close_conn_and_siblings(conn, -ETIMEDOUT);
 		ksocknal_conn_decref(conn);
 		goto again;
 	}
@@ -2497,7 +2544,7 @@ ksocknal_check_peer_timeouts (int idx)
 }
 
 int
-ksocknal_reaper (void *arg)
+ksocknal_reaper(void *arg)
 {
 	wait_queue_t wait;
 	ksock_conn_t *conn;
@@ -2518,11 +2565,11 @@ ksocknal_reaper (void *arg)
 
 	while (!ksocknal_data.ksnd_shuttingdown) {
 
-		if (!list_empty (&ksocknal_data.ksnd_deathrow_conns)) {
-			conn = list_entry (ksocknal_data. \
-					       ksnd_deathrow_conns.next,
-					       ksock_conn_t, ksnc_list);
-			list_del (&conn->ksnc_list);
+		if (!list_empty(&ksocknal_data.ksnd_deathrow_conns)) {
+			conn = list_entry(
+					ksocknal_data.ksnd_deathrow_conns.next,
+					ksock_conn_t, ksnc_list);
+			list_del(&conn->ksnc_list);
 
 			spin_unlock_bh(&ksocknal_data.ksnd_reaper_lock);
 
@@ -2533,10 +2580,10 @@ ksocknal_reaper (void *arg)
 			continue;
 		}
 
-		if (!list_empty (&ksocknal_data.ksnd_zombie_conns)) {
-			conn = list_entry (ksocknal_data.ksnd_zombie_conns.\
-					       next, ksock_conn_t, ksnc_list);
-			list_del (&conn->ksnc_list);
+		if (!list_empty(&ksocknal_data.ksnd_zombie_conns)) {
+			conn = list_entry(ksocknal_data.ksnd_zombie_conns.next,
+					  ksock_conn_t, ksnc_list);
+			list_del(&conn->ksnc_list);
 
 			spin_unlock_bh(&ksocknal_data.ksnd_reaper_lock);
 
@@ -2546,7 +2593,7 @@ ksocknal_reaper (void *arg)
 			continue;
 		}
 
-		if (!list_empty (&ksocknal_data.ksnd_enomem_conns)) {
+		if (!list_empty(&ksocknal_data.ksnd_enomem_conns)) {
 			list_add(&enomem_conns,
 				     &ksocknal_data.ksnd_enomem_conns);
 			list_del_init(&ksocknal_data.ksnd_enomem_conns);
@@ -2556,10 +2603,10 @@ ksocknal_reaper (void *arg)
 
 		/* reschedule all the connections that stalled with ENOMEM... */
 		nenomem_conns = 0;
-		while (!list_empty (&enomem_conns)) {
-			conn = list_entry (enomem_conns.next,
+		while (!list_empty(&enomem_conns)) {
+			conn = list_entry(enomem_conns.next,
 					       ksock_conn_t, ksnc_tx_list);
-			list_del (&conn->ksnc_tx_list);
+			list_del(&conn->ksnc_tx_list);
 
 			sched = conn->ksnc_scheduler;
 
@@ -2596,7 +2643,7 @@ ksocknal_reaper (void *arg)
 				chunk = 1;
 
 			for (i = 0; i < chunk; i++) {
-				ksocknal_check_peer_timeouts (peer_index);
+				ksocknal_check_peer_timeouts(peer_index);
 				peer_index = (peer_index + 1) %
 					     ksocknal_data.ksnd_peer_hash_size;
 			}
@@ -2613,16 +2660,16 @@ ksocknal_reaper (void *arg)
 		ksocknal_data.ksnd_reaper_waketime  			cfs_time_add(cfs_time_current(), timeout);
 
-		set_current_state (TASK_INTERRUPTIBLE);
-		add_wait_queue (&ksocknal_data.ksnd_reaper_waitq, &wait);
+		set_current_state(TASK_INTERRUPTIBLE);
+		add_wait_queue(&ksocknal_data.ksnd_reaper_waitq, &wait);
 
 		if (!ksocknal_data.ksnd_shuttingdown &&
-		    list_empty (&ksocknal_data.ksnd_deathrow_conns) &&
-		    list_empty (&ksocknal_data.ksnd_zombie_conns))
+		    list_empty(&ksocknal_data.ksnd_deathrow_conns) &&
+		    list_empty(&ksocknal_data.ksnd_zombie_conns))
 			schedule_timeout(timeout);
 
-		set_current_state (TASK_RUNNING);
-		remove_wait_queue (&ksocknal_data.ksnd_reaper_waitq, &wait);
+		set_current_state(TASK_RUNNING);
+		remove_wait_queue(&ksocknal_data.ksnd_reaper_waitq, &wait);
 
 		spin_lock_bh(&ksocknal_data.ksnd_reaper_lock);
 	}
diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
index caeb347..d8f4960 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
@@ -176,7 +176,8 @@ ksocknal_lib_send_kiov(ksock_conn_t *conn, ksock_tx_t *tx)
 		    nob < tx->tx_resid)
 			msg.msg_flags |= MSG_MORE;
 
-		rc = kernel_sendmsg(sock, &msg, (struct kvec *)scratchiov, niov, nob);
+		rc = kernel_sendmsg(sock, &msg, (struct kvec *)scratchiov,
+				    niov, nob);
 
 		for (i = 0; i < niov; i++)
 			kunmap(kiov[i].kiov_page);
@@ -250,7 +251,8 @@ ksocknal_lib_recv_iov(ksock_conn_t *conn)
 				fragnob = sum;
 
 			conn->ksnc_rx_csum = ksocknal_csum(conn->ksnc_rx_csum,
-							   iov[i].iov_base, fragnob);
+							   iov[i].iov_base,
+							   fragnob);
 		}
 		conn->ksnc_msg.ksm_csum = saved_csum;
 	}
@@ -286,7 +288,8 @@ ksocknal_lib_kiov_vmap(lnet_kiov_t *kiov, int niov,
 
 	for (nob = i = 0; i < niov; i++) {
 		if ((kiov[i].kiov_offset != 0 && i > 0) ||
-		    (kiov[i].kiov_offset + kiov[i].kiov_len != PAGE_CACHE_SIZE && i < niov - 1))
+		    (kiov[i].kiov_offset + kiov[i].kiov_len !+		     PAGE_CACHE_SIZE && i < niov - 1))
 			return NULL;
 
 		pages[i] = kiov[i].kiov_page;
@@ -358,9 +361,9 @@ ksocknal_lib_recv_kiov(ksock_conn_t *conn)
 			LASSERT(i < niov);
 
 			/* Dang! have to kmap again because I have nowhere to
-                         * stash the mapped address.  But by doing it while the
-                         * page is still mapped, the kernel just bumps the map
-                         * count and returns me the address it stashed. */
+			 * stash the mapped address.  But by doing it while the
+			 * page is still mapped, the kernel just bumps the map
+			 * count and returns me the address it stashed. */
 			base = kmap(kiov[i].kiov_page) + kiov[i].kiov_offset;
 			fragnob = kiov[i].kiov_len;
 			if (fragnob > sum)
@@ -404,7 +407,8 @@ ksocknal_lib_csum_tx(ksock_tx_t *tx)
 			base = kmap(tx->tx_kiov[i].kiov_page) +
 			       tx->tx_kiov[i].kiov_offset;
 
-			csum = ksocknal_csum(csum, base, tx->tx_kiov[i].kiov_len);
+			csum = ksocknal_csum(csum, base,
+					     tx->tx_kiov[i].kiov_len);
 
 			kunmap(tx->tx_kiov[i].kiov_page);
 		}
@@ -423,7 +427,8 @@ ksocknal_lib_csum_tx(ksock_tx_t *tx)
 }
 
 int
-ksocknal_lib_get_conn_tunables(ksock_conn_t *conn, int *txmem, int *rxmem, int *nagle)
+ksocknal_lib_get_conn_tunables(ksock_conn_t *conn, int *txmem, int *rxmem,
+			       int *nagle)
 {
 	struct socket *sock = conn->ksnc_sock;
 	int len;
@@ -666,7 +671,6 @@ ksocknal_lib_set_callback(struct socket *sock,  ksock_conn_t *conn)
 	sock->sk->sk_user_data = conn;
 	sock->sk->sk_data_ready = ksocknal_data_ready;
 	sock->sk->sk_write_space = ksocknal_write_space;
-	return;
 }
 
 void
@@ -682,8 +686,6 @@ ksocknal_lib_reset_callback(struct socket *sock, ksock_conn_t *conn)
 	 * on ksnd_global_lock (to serialise with me) and NOOP if
 	 * sk_user_data is NULL. */
 	sock->sk->sk_user_data = NULL;
-
-	return ;
 }
 
 int
diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.h b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.h
index f556388..8524630 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.h
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.h
@@ -71,7 +71,7 @@ static inline __u32 ksocknal_csum(__u32 crc, unsigned char const *p, size_t len)
 	return crc32_le(crc, p, len);
 #else
 	while (len-- > 0)
-		crc = ((crc + 0x100) & ~0xff) | ((crc + *p++) & 0xff) ;
+		crc = ((crc + 0x100) & ~0xff) | ((crc + *p++) & 0xff);
 	return crc;
 #endif
 }
diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_proto.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_proto.c
index 1938d6a..7d767df 100644
--- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_proto.c
+++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_proto.c
@@ -65,7 +65,8 @@ ksocknal_next_tx_carrier(ksock_conn_t *conn)
 	} else {
 		conn->ksnc_tx_carrier = list_entry(tx->tx_list.next,
 						       ksock_tx_t, tx_list);
-		LASSERT(conn->ksnc_tx_carrier->tx_msg.ksm_type = tx->tx_msg.ksm_type);
+		LASSERT(conn->ksnc_tx_carrier->tx_msg.ksm_type =
+			tx->tx_msg.ksm_type);
 	}
 }
 
@@ -198,16 +199,20 @@ ksocknal_queue_tx_zcack_v3(ksock_conn_t *conn,
 	}
 
 	if (tx->tx_msg.ksm_zc_cookies[0] = 0) {
-		/* NOOP tx has only one ZC-ACK cookie, can carry at least one more */
+		/* NOOP tx has only one ZC-ACK cookie, can carry at least
+		 * one more */
 		if (tx->tx_msg.ksm_zc_cookies[1] > cookie) {
-			tx->tx_msg.ksm_zc_cookies[0] = tx->tx_msg.ksm_zc_cookies[1];
+			tx->tx_msg.ksm_zc_cookies[0] +				tx->tx_msg.ksm_zc_cookies[1];
 			tx->tx_msg.ksm_zc_cookies[1] = cookie;
 		} else {
 			tx->tx_msg.ksm_zc_cookies[0] = cookie;
 		}
 
-		if (tx->tx_msg.ksm_zc_cookies[0] - tx->tx_msg.ksm_zc_cookies[1] > 2) {
-			/* not likely to carry more ACKs, skip it to simplify logic */
+		if (tx->tx_msg.ksm_zc_cookies[0] -
+		    tx->tx_msg.ksm_zc_cookies[1] > 2) {
+			/* not likely to carry more ACKs, skip it to
+			 * simplify logic */
 			ksocknal_next_tx_carrier(conn);
 		}
 
@@ -241,7 +246,8 @@ ksocknal_queue_tx_zcack_v3(ksock_conn_t *conn,
 		}
 
 	} else {
-		/* ksm_zc_cookies[0] < ksm_zc_cookies[1], it is range of cookies */
+		/* ksm_zc_cookies[0] < ksm_zc_cookies[1], it is range
+		 * of cookies */
 		if (cookie >= tx->tx_msg.ksm_zc_cookies[0] &&
 		    cookie <= tx->tx_msg.ksm_zc_cookies[1]) {
 			CWARN("%s: duplicated ZC cookie: %llu\n",
@@ -428,7 +434,8 @@ ksocknal_handle_zcack(ksock_conn_t *conn, __u64 cookie1, __u64 cookie2)
 				     &peer->ksnp_zc_req_list, tx_zc_list) {
 		__u64 c = tx->tx_msg.ksm_zc_cookies[0];
 
-		if (c = cookie1 || c = cookie2 || (cookie1 < c && c < cookie2)) {
+		if (c = cookie1 || c = cookie2 ||
+		    (cookie1 < c && c < cookie2)) {
 			tx->tx_msg.ksm_zc_cookies[0] = 0;
 			list_del(&tx->tx_zc_list);
 			list_add(&tx->tx_zc_list, &zlist);
@@ -507,9 +514,8 @@ ksocknal_send_hello_v1(ksock_conn_t *conn, ksock_hello_msg_t *hello)
 	if (hello->kshm_nips = 0)
 		goto out;
 
-	for (i = 0; i < (int) hello->kshm_nips; i++) {
+	for (i = 0; i < (int) hello->kshm_nips; i++)
 		hello->kshm_ips[i] = __cpu_to_le32 (hello->kshm_ips[i]);
-	}
 
 	rc = libcfs_sock_write(sock, hello->kshm_ips,
 			       hello->kshm_nips * sizeof(__u32),
@@ -544,7 +550,8 @@ ksocknal_send_hello_v2(ksock_conn_t *conn, ksock_hello_msg_t *hello)
 		LNET_UNLOCK();
 	}
 
-	rc = libcfs_sock_write(sock, hello, offsetof(ksock_hello_msg_t, kshm_ips),
+	rc = libcfs_sock_write(sock, hello,
+			       offsetof(ksock_hello_msg_t, kshm_ips),
 			       lnet_acceptor_timeout());
 
 	if (rc != 0) {
@@ -645,7 +652,8 @@ out:
 }
 
 static int
-ksocknal_recv_hello_v2(ksock_conn_t *conn, ksock_hello_msg_t *hello, int timeout)
+ksocknal_recv_hello_v2(ksock_conn_t *conn, ksock_hello_msg_t *hello,
+		       int timeout)
 {
 	struct socket *sock = conn->ksnc_sock;
 	int rc;
@@ -658,7 +666,8 @@ ksocknal_recv_hello_v2(ksock_conn_t *conn, ksock_hello_msg_t *hello, int timeout
 
 	rc = libcfs_sock_read(sock, &hello->kshm_src_nid,
 			      offsetof(ksock_hello_msg_t, kshm_ips) -
-				       offsetof(ksock_hello_msg_t, kshm_src_nid),
+				       offsetof(ksock_hello_msg_t,
+						kshm_src_nid),
 			      timeout);
 	if (rc != 0) {
 		CERROR("Error %d reading HELLO from %pI4h\n",
@@ -720,7 +729,8 @@ ksocknal_pack_msg_v1(ksock_tx_t *tx)
 	tx->tx_iov[0].iov_base = &tx->tx_lnetmsg->msg_hdr;
 	tx->tx_iov[0].iov_len  = sizeof(lnet_hdr_t);
 
-	tx->tx_resid = tx->tx_nob = tx->tx_lnetmsg->msg_len + sizeof(lnet_hdr_t);
+	tx->tx_resid = tx->tx_nob = tx->tx_lnetmsg->msg_len +
+				    sizeof(lnet_hdr_t);
 }
 
 static void
@@ -733,14 +743,18 @@ ksocknal_pack_msg_v2(ksock_tx_t *tx)
 
 		tx->tx_msg.ksm_u.lnetmsg.ksnm_hdr = tx->tx_lnetmsg->msg_hdr;
 		tx->tx_iov[0].iov_len = sizeof(ksock_msg_t);
-		tx->tx_resid = tx->tx_nob = sizeof(ksock_msg_t) + tx->tx_lnetmsg->msg_len;
+		tx->tx_resid = tx->tx_nob = sizeof(ksock_msg_t) +
+					    tx->tx_lnetmsg->msg_len;
 	} else {
 		LASSERT(tx->tx_msg.ksm_type = KSOCK_MSG_NOOP);
 
-		tx->tx_iov[0].iov_len = offsetof(ksock_msg_t, ksm_u.lnetmsg.ksnm_hdr);
-		tx->tx_resid = tx->tx_nob = offsetof(ksock_msg_t,  ksm_u.lnetmsg.ksnm_hdr);
+		tx->tx_iov[0].iov_len = offsetof(ksock_msg_t,
+						 ksm_u.lnetmsg.ksnm_hdr);
+		tx->tx_resid = tx->tx_nob = offsetof(ksock_msg_t,
+						     ksm_u.lnetmsg.ksnm_hdr);
 	}
-	/* Don't checksum before start sending, because packet can be piggybacked with ACK */
+	/* Don't checksum before start sending, because packet can be
+	 * piggybacked with ACK */
 }
 
 static void
-- 
1.7.1

