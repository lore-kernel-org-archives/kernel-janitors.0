Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D72C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 20 Jul 2022 19:49:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbiGTTt4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 20 Jul 2022 15:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiGTTtz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Jul 2022 15:49:55 -0400
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr [80.12.242.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103F072EEA
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Jul 2022 12:49:50 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id EFhbo8PoIAeI9EFhbo9xJ4; Wed, 20 Jul 2022 21:49:49 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 20 Jul 2022 21:49:49 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org
Subject: [PATCH] caif: Fix bitmap data type in "struct caifsock"
Date:   Wed, 20 Jul 2022 21:49:46 +0200
Message-Id: <b7a88272148a30cf2d0a97f2e82260a0dcb370a1.1658346566.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Bitmap are "unsigned long", so use it instead of a "u32" to make things
more explicit.

While at it, remove some useless cast (and leading spaces) when using the
bitmap API.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/caif/caif_socket.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/net/caif/caif_socket.c b/net/caif/caif_socket.c
index 251e666ba9a2..748be7253248 100644
--- a/net/caif/caif_socket.c
+++ b/net/caif/caif_socket.c
@@ -47,7 +47,7 @@ enum caif_states {
 struct caifsock {
 	struct sock sk; /* must be first member */
 	struct cflayer layer;
-	u32 flow_state;
+	unsigned long flow_state;
 	struct caif_connect_request conn_req;
 	struct mutex readlock;
 	struct dentry *debugfs_socket_dir;
@@ -56,38 +56,32 @@ struct caifsock {
 
 static int rx_flow_is_on(struct caifsock *cf_sk)
 {
-	return test_bit(RX_FLOW_ON_BIT,
-			(void *) &cf_sk->flow_state);
+	return test_bit(RX_FLOW_ON_BIT, &cf_sk->flow_state);
 }
 
 static int tx_flow_is_on(struct caifsock *cf_sk)
 {
-	return test_bit(TX_FLOW_ON_BIT,
-			(void *) &cf_sk->flow_state);
+	return test_bit(TX_FLOW_ON_BIT, &cf_sk->flow_state);
 }
 
 static void set_rx_flow_off(struct caifsock *cf_sk)
 {
-	 clear_bit(RX_FLOW_ON_BIT,
-		 (void *) &cf_sk->flow_state);
+	clear_bit(RX_FLOW_ON_BIT, &cf_sk->flow_state);
 }
 
 static void set_rx_flow_on(struct caifsock *cf_sk)
 {
-	 set_bit(RX_FLOW_ON_BIT,
-			(void *) &cf_sk->flow_state);
+	set_bit(RX_FLOW_ON_BIT, &cf_sk->flow_state);
 }
 
 static void set_tx_flow_off(struct caifsock *cf_sk)
 {
-	 clear_bit(TX_FLOW_ON_BIT,
-		(void *) &cf_sk->flow_state);
+	clear_bit(TX_FLOW_ON_BIT, &cf_sk->flow_state);
 }
 
 static void set_tx_flow_on(struct caifsock *cf_sk)
 {
-	 set_bit(TX_FLOW_ON_BIT,
-		(void *) &cf_sk->flow_state);
+	set_bit(TX_FLOW_ON_BIT, &cf_sk->flow_state);
 }
 
 static void caif_read_lock(struct sock *sk)
-- 
2.34.1

