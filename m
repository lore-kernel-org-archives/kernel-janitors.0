From: Mike Shuey <shuey@purdue.edu>
Date: Thu, 21 May 2015 19:50:46 +0000
Subject: [PATCH 10/13] staging: lustre: lnet: lnet: checkpatch.pl fixes
Message-Id: <1432237849-53947-24-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
In-Reply-To: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org, Mike Shuey <shuey@purdue.edu>

Fix many checkpatch.pl warnings.

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 drivers/staging/lustre/lnet/lnet/acceptor.c    |   69 ++++++++++++++---------
 drivers/staging/lustre/lnet/lnet/api-ni.c      |   18 ++++--
 drivers/staging/lustre/lnet/lnet/config.c      |    2 +-
 drivers/staging/lustre/lnet/lnet/lib-eq.c      |    4 +-
 drivers/staging/lustre/lnet/lnet/lib-md.c      |    4 +-
 drivers/staging/lustre/lnet/lnet/lib-ptl.c     |    9 ++-
 drivers/staging/lustre/lnet/lnet/router.c      |   17 ++++--
 drivers/staging/lustre/lnet/lnet/router_proc.c |   16 ++++--
 8 files changed, 88 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/lustre/lnet/lnet/acceptor.c b/drivers/staging/lustre/lnet/lnet/acceptor.c
index 69d4b19..21af335 100644
--- a/drivers/staging/lustre/lnet/lnet/acceptor.c
+++ b/drivers/staging/lustre/lnet/lnet/acceptor.c
@@ -99,38 +99,42 @@ lnet_connect_console_error(int rc, lnet_nid_t peer_nid,
 	switch (rc) {
 	/* "normal" errors */
 	case -ECONNREFUSED:
-		CNETERR("Connection to %s at host %pI4h on port %d was refused: check that Lustre is running on that node.\n",
-			libcfs_nid2str(peer_nid),
-			&peer_ip, peer_port);
+		CNETERR(
+			"Connection to %s at host %pI4h on port %d was refused: check that Lustre is running on that node.\n",
+			libcfs_nid2str(peer_nid), &peer_ip, peer_port);
 		break;
 	case -EHOSTUNREACH:
 	case -ENETUNREACH:
-		CNETERR("Connection to %s at host %pI4h was unreachable: the network or that node may be down, or Lustre may be misconfigured.\n",
+		CNETERR(
+			"Connection to %s at host %pI4h was unreachable: the network or that node may be down, or Lustre may be misconfigured.\n",
 			libcfs_nid2str(peer_nid), &peer_ip);
 		break;
 	case -ETIMEDOUT:
-		CNETERR("Connection to %s at host %pI4h on port %d took too long: that node may be hung or experiencing high load.\n",
-			libcfs_nid2str(peer_nid),
-			&peer_ip, peer_port);
+		CNETERR(
+			"Connection to %s at host %pI4h on port %d took too long: that node may be hung or experiencing high load.\n",
+			libcfs_nid2str(peer_nid), &peer_ip, peer_port);
 		break;
 	case -ECONNRESET:
-		LCONSOLE_ERROR_MSG(0x11b, "Connection to %s at host %pI4h on port %d was reset: is it running a compatible version of Lustre and is %s one of its NIDs?\n",
-				   libcfs_nid2str(peer_nid),
-				   &peer_ip, peer_port,
-				   libcfs_nid2str(peer_nid));
+		LCONSOLE_ERROR_MSG(0x11b,
+				   "Connection to %s at host %pI4h on port %d was reset: is it running a compatible version of Lustre and is %s one of its NIDs?\n",
+				   libcfs_nid2str(peer_nid), &peer_ip,
+				   peer_port, libcfs_nid2str(peer_nid));
 		break;
 	case -EPROTO:
-		LCONSOLE_ERROR_MSG(0x11c, "Protocol error connecting to %s at host %pI4h on port %d: is it running a compatible version of Lustre?\n",
-				   libcfs_nid2str(peer_nid),
-				   &peer_ip, peer_port);
+		LCONSOLE_ERROR_MSG(0x11c,
+				   "Protocol error connecting to %s at host %pI4h on port %d: is it running a compatible version of Lustre?\n",
+				   libcfs_nid2str(peer_nid), &peer_ip,
+				   peer_port);
 		break;
 	case -EADDRINUSE:
-		LCONSOLE_ERROR_MSG(0x11d, "No privileged ports available to connect to %s at host %pI4h on port %d\n",
+		LCONSOLE_ERROR_MSG(0x11d,
+				   "No privileged ports available to connect to %s at host %pI4h on port %d\n",
 				   libcfs_nid2str(peer_nid),
 				   &peer_ip, peer_port);
 		break;
 	default:
-		LCONSOLE_ERROR_MSG(0x11e, "Unexpected error %d connecting to %s at host %pI4h on port %d\n",
+		LCONSOLE_ERROR_MSG(0x11e,
+				   "Unexpected error %d connecting to %s at host %pI4h on port %d\n",
 				   rc, libcfs_nid2str(peer_nid),
 				   &peer_ip, peer_port);
 		break;
@@ -238,7 +242,8 @@ lnet_accept(struct socket *sock, __u32 magic)
 					       accept_timeout);
 
 			if (rc != 0)
-				CERROR("Error sending magic+version in response to LNET magic from %pI4h: %d\n",
+				CERROR(
+				       "Error sending magic+version in response to LNET magic from %pI4h: %d\n",
 				       &peer_ip, rc);
 			return -EPROTO;
 		}
@@ -250,7 +255,8 @@ lnet_accept(struct socket *sock, __u32 magic)
 		else
 			str = "unrecognised";
 
-		LCONSOLE_ERROR_MSG(0x11f, "Refusing connection from %pI4h magic %08x: %s acceptor protocol\n",
+		LCONSOLE_ERROR_MSG(0x11f,
+				   "Refusing connection from %pI4h magic %08x: %s acceptor protocol\n",
 				   &peer_ip, magic, str);
 		return -EPROTO;
 	}
@@ -261,7 +267,8 @@ lnet_accept(struct socket *sock, __u32 magic)
 			      sizeof(cr.acr_version),
 			      accept_timeout);
 	if (rc != 0) {
-		CERROR("Error %d reading connection request version from %pI4h\n",
+		CERROR(
+			"Error %d reading connection request version from %pI4h\n",
 			rc, &peer_ip);
 		return -EIO;
 	}
@@ -284,7 +291,8 @@ lnet_accept(struct socket *sock, __u32 magic)
 				       accept_timeout);
 
 		if (rc != 0)
-			CERROR("Error sending magic+version in response to version %d from %pI4h: %d\n",
+			CERROR(
+			       "Error sending magic+version in response to version %d from %pI4h: %d\n",
 			       peer_version, &peer_ip, rc);
 		return -EPROTO;
 	}
@@ -294,7 +302,8 @@ lnet_accept(struct socket *sock, __u32 magic)
 			      offsetof(lnet_acceptor_connreq_t, acr_nid),
 			      accept_timeout);
 	if (rc != 0) {
-		CERROR("Error %d reading connection request from %pI4h\n",
+		CERROR(
+			"Error %d reading connection request from %pI4h\n",
 			rc, &peer_ip);
 		return -EIO;
 	}
@@ -307,7 +316,8 @@ lnet_accept(struct socket *sock, __u32 magic)
 	    ni->ni_nid != cr.acr_nid) { /* right NET, wrong NID! */
 		if (ni != NULL)
 			lnet_ni_decref(ni);
-		LCONSOLE_ERROR_MSG(0x120, "Refusing connection from %pI4h for %s: No matching NI\n",
+		LCONSOLE_ERROR_MSG(0x120,
+				   "Refusing connection from %pI4h for %s: No matching NI\n",
 				   &peer_ip, libcfs_nid2str(cr.acr_nid));
 		return -EPERM;
 	}
@@ -315,7 +325,8 @@ lnet_accept(struct socket *sock, __u32 magic)
 	if (ni->ni_lnd->lnd_accept = NULL) {
 		/* This catches a request for the loopback LND */
 		lnet_ni_decref(ni);
-		LCONSOLE_ERROR_MSG(0x121, "Refusing connection from %pI4h for %s: NI doesn not accept IP connections\n",
+		LCONSOLE_ERROR_MSG(0x121,
+				  "Refusing connection from %pI4h for %s: NI doesn not accept IP connections\n",
 				  &peer_ip, libcfs_nid2str(cr.acr_nid));
 		return -EPERM;
 	}
@@ -347,10 +358,12 @@ lnet_acceptor(void *arg)
 				0, accept_port, accept_backlog);
 	if (rc != 0) {
 		if (rc = -EADDRINUSE)
-			LCONSOLE_ERROR_MSG(0x122, "Can't start acceptor on port %d: port already in use\n",
+			LCONSOLE_ERROR_MSG(0x122,
+					   "Can't start acceptor on port %d: port already in use\n",
 					   accept_port);
 		else
-			LCONSOLE_ERROR_MSG(0x123, "Can't start acceptor on port %d: unexpected error %d\n",
+			LCONSOLE_ERROR_MSG(0x123,
+					   "Can't start acceptor on port %d: unexpected error %d\n",
 					   accept_port, rc);
 
 		lnet_acceptor_state.pta_sock = NULL;
@@ -390,7 +403,8 @@ lnet_acceptor(void *arg)
 		}
 
 		if (secure && peer_port > LNET_ACCEPTOR_MAX_RESERVED_PORT) {
-			CERROR("Refusing connection from %pI4h: insecure port %d\n",
+			CERROR(
+			       "Refusing connection from %pI4h: insecure port %d\n",
 			       &peer_ip, peer_port);
 			goto failed;
 		}
@@ -398,7 +412,8 @@ lnet_acceptor(void *arg)
 		rc = libcfs_sock_read(newsock, &magic, sizeof(magic),
 				      accept_timeout);
 		if (rc != 0) {
-			CERROR("Error %d reading connection request from %pI4h\n",
+			CERROR(
+				"Error %d reading connection request from %pI4h\n",
 				rc, &peer_ip);
 			goto failed;
 		}
diff --git a/drivers/staging/lustre/lnet/lnet/api-ni.c b/drivers/staging/lustre/lnet/lnet/api-ni.c
index 2230eb0..6af8a5f 100644
--- a/drivers/staging/lustre/lnet/lnet/api-ni.c
+++ b/drivers/staging/lustre/lnet/lnet/api-ni.c
@@ -74,7 +74,8 @@ lnet_get_networks(void)
 	int rc;
 
 	if (*networks != 0 && *ip2nets != 0) {
-		LCONSOLE_ERROR_MSG(0x101, "Please specify EITHER 'networks' or 'ip2nets' but not both at once\n");
+		LCONSOLE_ERROR_MSG(0x101,
+				   "Please specify EITHER 'networks' or 'ip2nets' but not both at once\n");
 		return NULL;
 	}
 
@@ -189,7 +190,8 @@ static void lnet_assert_wire_constants(void)
 	/* Checks for struct ptl_handle_wire_t */
 	CLASSERT((int)sizeof(lnet_handle_wire_t) = 16);
 	CLASSERT((int)offsetof(lnet_handle_wire_t, wh_interface_cookie) = 0);
-	CLASSERT((int)sizeof(((lnet_handle_wire_t *)0)->wh_interface_cookie) = 8);
+	CLASSERT((int)sizeof(((lnet_handle_wire_t *)0)->wh_interface_cookie) =
+		8);
 	CLASSERT((int)offsetof(lnet_handle_wire_t, wh_object_cookie) = 8);
 	CLASSERT((int)sizeof(((lnet_handle_wire_t *)0)->wh_object_cookie) = 8);
 
@@ -1085,7 +1087,8 @@ lnet_startup_lndnis(void)
 		mutex_unlock(&the_lnet.ln_lnd_mutex);
 
 		if (rc != 0) {
-			LCONSOLE_ERROR_MSG(0x105, "Error %d starting up LNI %s\n",
+			LCONSOLE_ERROR_MSG(0x105,
+					   "Error %d starting up LNI %s\n",
 					   rc, libcfs_lnd2str(lnd->lnd_type));
 			lnet_net_lock(LNET_LOCK_EX);
 			lnd->lnd_refcount--;
@@ -1141,7 +1144,8 @@ lnet_startup_lndnis(void)
 
 	if (the_lnet.ln_eq_waitni != NULL && nicount > 1) {
 		lnd_type = the_lnet.ln_eq_waitni->ni_lnd->lnd_type;
-		LCONSOLE_ERROR_MSG(0x109, "LND %s can only run single-network\n",
+		LCONSOLE_ERROR_MSG(0x109,
+				   "LND %s can only run single-network\n",
 				   libcfs_lnd2str(lnd_type));
 		goto failed;
 	}
@@ -1187,7 +1191,8 @@ LNetInit(void)
 	LASSERT(the_lnet.ln_cpt_number > 0);
 	if (the_lnet.ln_cpt_number > LNET_CPT_MAX) {
 		/* we are under risk of consuming all lh_cookie */
-		CERROR("Can't have %d CPTs for LNet (max allowed is %d), please change setting of CPT-table and retry\n",
+		CERROR(
+		       "Can't have %d CPTs for LNet (max allowed is %d), please change setting of CPT-table and retry\n",
 		       the_lnet.ln_cpt_number, LNET_CPT_MAX);
 		return -1;
 	}
@@ -1749,7 +1754,8 @@ lnet_ping_target_fini(void)
 }
 
 int
-lnet_ping(lnet_process_id_t id, int timeout_ms, lnet_process_id_t *ids, int n_ids)
+lnet_ping(lnet_process_id_t id, int timeout_ms, lnet_process_id_t *ids,
+	  int n_ids)
 {
 	lnet_handle_eq_t eqh;
 	lnet_handle_md_t mdh;
diff --git a/drivers/staging/lustre/lnet/lnet/config.c b/drivers/staging/lustre/lnet/lnet/config.c
index 70bc809..8359480 100644
--- a/drivers/staging/lustre/lnet/lnet/config.c
+++ b/drivers/staging/lustre/lnet/lnet/config.c
@@ -27,7 +27,7 @@
  * Copyright (c) 2007, 2010, Oracle and/or its affiliates. All rights reserved.
  * Use is subject to license terms.
  *
- * Copyright (c) 2012, Intel Corporation.
+ * Copyright (c) 2012, 2014, Intel Corporation.
  */
 /*
  * This file is part of Lustre, http://www.lustre.org/
diff --git a/drivers/staging/lustre/lnet/lnet/lib-eq.c b/drivers/staging/lustre/lnet/lnet/lib-eq.c
index 368bde9..0c01834 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-eq.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-eq.c
@@ -82,7 +82,9 @@ LNetEQAlloc(unsigned int count, lnet_eq_handler_t callback,
 	count = cfs_power2_roundup(count);
 
 	if (callback != LNET_EQ_HANDLER_NONE && count != 0)
-		CWARN("EQ callback is guaranteed to get every event, do you still want to set eqcount %d for polling event which will have locking overhead? Please contact with developer to confirm\n", count);
+		CWARN(
+		      "EQ callback is guaranteed to get every event, do you still want to set eqcount %d for polling event which will have locking overhead? Please contact with developer to confirm\n",
+		      count);
 
 	/* count can be 0 if only need callback, we can eliminate
 	 * overhead of enqueue event */
diff --git a/drivers/staging/lustre/lnet/lnet/lib-md.c b/drivers/staging/lustre/lnet/lnet/lib-md.c
index 5856c30..04b1955 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-md.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-md.c
@@ -144,7 +144,7 @@ lnet_md_build(lnet_libmd_t *lmd, lnet_md_t *umd, int unlink)
 
 		lmd->md_length = total_length;
 
-		if ((umd->options & LNET_MD_MAX_SIZE) != 0 && /* max size used */
+		if ((umd->options & LNET_MD_MAX_SIZE) != 0 &&/* max size used */
 		    (umd->max_size < 0 ||
 		     umd->max_size > total_length)) /* illegal max_size */
 			return -EINVAL;
@@ -154,7 +154,7 @@ lnet_md_build(lnet_libmd_t *lmd, lnet_md_t *umd, int unlink)
 		lmd->md_iov.iov[0].iov_base = umd->start;
 		lmd->md_iov.iov[0].iov_len = umd->length;
 
-		if ((umd->options & LNET_MD_MAX_SIZE) != 0 && /* max size used */
+		if ((umd->options & LNET_MD_MAX_SIZE) != 0 &&/* max size used */
 		    (umd->max_size < 0 ||
 		     umd->max_size > (int)umd->length)) /* illegal max_size */
 			return -EINVAL;
diff --git a/drivers/staging/lustre/lnet/lnet/lib-ptl.c b/drivers/staging/lustre/lnet/lnet/lib-ptl.c
index 84707c5..4735e9c 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-ptl.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-ptl.c
@@ -184,7 +184,8 @@ lnet_try_match_md(lnet_libmd_t *md,
 		mlength = info->mi_rlength;
 	} else if ((md->md_options & LNET_MD_TRUNCATE) = 0) {
 		/* this packet _really_ is too big */
-		CERROR("Matching packet from %s, match %llu length %d too big: %d left, %d allowed\n",
+		CERROR(
+		       "Matching packet from %s, match %llu length %d too big: %d left, %d allowed\n",
 		       libcfs_id2str(info->mi_id), info->mi_mbits,
 		       info->mi_rlength, md->md_length - offset, mlength);
 
@@ -192,7 +193,8 @@ lnet_try_match_md(lnet_libmd_t *md,
 	}
 
 	/* Commit to this ME/MD */
-	CDEBUG(D_NET, "Incoming %s index %x from %s of length %d/%d into md %#llx [%d] + %d\n",
+	CDEBUG(D_NET,
+	       "Incoming %s index %x from %s of length %d/%d into md %#llx [%d] + %d\n",
 	       (info->mi_opc = LNET_MD_OP_PUT) ? "put" : "get",
 	       info->mi_portal, libcfs_id2str(info->mi_id), mlength,
 	       info->mi_rlength, md->md_lh.lh_cookie, md->md_niov, offset);
@@ -685,7 +687,8 @@ lnet_ptl_attach_md(lnet_me_t *me, lnet_libmd_t *md,
 		if ((rc & LNET_MATCHMD_OK) != 0) {
 			list_add_tail(&msg->msg_list, matches);
 
-			CDEBUG(D_NET, "Resuming delayed PUT from %s portal %d match %llu offset %d length %d.\n",
+			CDEBUG(D_NET,
+			       "Resuming delayed PUT from %s portal %d match %llu offset %d length %d.\n",
 			       libcfs_id2str(info.mi_id),
 			       info.mi_portal, info.mi_mbits,
 			       info.mi_roffset, info.mi_rlength);
diff --git a/drivers/staging/lustre/lnet/lnet/router.c b/drivers/staging/lustre/lnet/lnet/router.c
index 96886a2..1f5629e 100644
--- a/drivers/staging/lustre/lnet/lnet/router.c
+++ b/drivers/staging/lustre/lnet/lnet/router.c
@@ -456,7 +456,8 @@ lnet_check_routes(void)
 
 				lnet_net_unlock(cpt);
 
-				CERROR("Routes to %s via %s and %s not supported\n",
+				CERROR(
+				       "Routes to %s via %s and %s not supported\n",
 				       libcfs_net2str(net),
 				       libcfs_nid2str(nid1),
 				       libcfs_nid2str(nid2));
@@ -1020,7 +1021,8 @@ lnet_router_checker_start(void)
 
 	if (check_routers_before_use &&
 	    dead_router_check_interval <= 0) {
-		LCONSOLE_ERROR_MSG(0x10a, "'dead_router_check_interval' must be set if 'check_routers_before_use' is set\n");
+		LCONSOLE_ERROR_MSG(0x10a,
+				   "'dead_router_check_interval' must be set if 'check_routers_before_use' is set\n");
 		return -EINVAL;
 	}
 
@@ -1321,7 +1323,8 @@ lnet_rtrpool_alloc_bufs(lnet_rtrbufpool_t *rbp, int nbufs, int cpt)
 		rb = lnet_new_rtrbuf(rbp, cpt);
 
 		if (rb = NULL) {
-			CERROR("Failed to allocate %d router bufs of %d pages\n",
+			CERROR(
+			       "Failed to allocate %d router bufs of %d pages\n",
 			       nbufs, rbp->rbp_npages);
 			return -ENOMEM;
 		}
@@ -1451,7 +1454,8 @@ lnet_rtrpools_alloc(int im_a_router)
 	} else if (!strcmp(forwarding, "enabled")) {
 		/* explicitly enabled */
 	} else {
-		LCONSOLE_ERROR_MSG(0x10b, "'forwarding' not set to either 'enabled' or 'disabled'\n");
+		LCONSOLE_ERROR_MSG(0x10b,
+				   "'forwarding' not set to either 'enabled' or 'disabled'\n");
 		return -EINVAL;
 	}
 
@@ -1511,7 +1515,7 @@ lnet_notify(lnet_ni_t *ni, lnet_nid_t nid, int alive, unsigned long when)
 	unsigned long now = cfs_time_current();
 	int cpt = lnet_cpt_of_nid(nid);
 
-	LASSERT(!in_interrupt ());
+	LASSERT(!in_interrupt());
 
 	CDEBUG(D_NET, "%s notifying %s: %s\n",
 		(ni = NULL) ? "userspace" : libcfs_nid2str(ni->ni_nid),
@@ -1528,7 +1532,8 @@ lnet_notify(lnet_ni_t *ni, lnet_nid_t nid, int alive, unsigned long when)
 
 	/* can't do predictions... */
 	if (cfs_time_after(when, now)) {
-		CWARN("Ignoring prediction from %s of %s %s %ld seconds in the future\n",
+		CWARN(
+		      "Ignoring prediction from %s of %s %s %ld seconds in the future\n",
 		      (ni = NULL) ? "userspace" : libcfs_nid2str(ni->ni_nid),
 		      libcfs_nid2str(nid), alive ? "up" : "down",
 		      cfs_duration_sec(cfs_time_sub(when, now)));
diff --git a/drivers/staging/lustre/lnet/lnet/router_proc.c b/drivers/staging/lustre/lnet/lnet/router_proc.c
index ee902dc..35f1d14 100644
--- a/drivers/staging/lustre/lnet/lnet/router_proc.c
+++ b/drivers/staging/lustre/lnet/lnet/router_proc.c
@@ -49,7 +49,8 @@ enum {
  */
 #define LNET_PROC_CPT_BITS	(LNET_CPT_BITS + 1)
 /* change version, 16 bits or 8 bits */
-#define LNET_PROC_VER_BITS	max_t(size_t, min_t(size_t, LNET_LOFFT_BITS, 64) / 4, 8)
+#define LNET_PROC_VER_BITS	max_t(size_t, min_t(size_t, LNET_LOFFT_BITS, \
+						    64) / 4, 8)
 
 #define LNET_PROC_HASH_BITS	LNET_PEER_HASH_BITS
 /*
@@ -396,7 +397,9 @@ static int proc_lnet_routers(struct ctl_table *table, int write,
 					      nrefs, nrtrrefs, alive_cnt,
 					      alive ? "up" : "down", last_ping,
 					      pingsent,
-					      cfs_duration_sec(cfs_time_sub(deadline, now)),
+					      cfs_duration_sec(
+						      cfs_time_sub(deadline,
+								   now)),
 					      down_ni, libcfs_nid2str(nid));
 			LASSERT(tmpstr + tmpsiz - s > 0);
 		}
@@ -791,17 +794,20 @@ static struct lnet_portal_rotors	portal_rotors[] = {
 	{
 		.pr_value = LNET_PTL_ROTOR_ON,
 		.pr_name  = "ON",
-		.pr_desc  = "round-robin dispatch all PUT messages for wildcard portals"
+		.pr_desc  +			"round-robin dispatch all PUT messages for wildcard portals"
 	},
 	{
 		.pr_value = LNET_PTL_ROTOR_RR_RT,
 		.pr_name  = "RR_RT",
-		.pr_desc  = "round-robin dispatch routed PUT message for wildcard portals"
+		.pr_desc  +			"round-robin dispatch routed PUT message for wildcard portals"
 	},
 	{
 		.pr_value = LNET_PTL_ROTOR_HASH_RT,
 		.pr_name  = "HASH_RT",
-		.pr_desc  = "dispatch routed PUT message by hashing source NID for wildcard portals"
+		.pr_desc  +			"dispatch routed PUT message by hashing source NID for wildcard portals"
 	},
 	{
 		.pr_value = -1,
-- 
1.7.1

