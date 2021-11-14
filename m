Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86891C433F5
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Nov 2021 19:02:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6054E61056
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Nov 2021 19:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236171AbhKNTFs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 14 Nov 2021 14:05:48 -0500
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:63691 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236204AbhKNTFr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 14 Nov 2021 14:05:47 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id mKlwmkSLSUGqlmKlxmi68i; Sun, 14 Nov 2021 20:02:38 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 14 Nov 2021 20:02:38 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     roopa@nvidia.com, nikolay@nvidia.com, davem@davemloft.net,
        kuba@kernel.org
Cc:     bridge@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] net: bridge: Slightly optimize 'find_portno()'
Date:   Sun, 14 Nov 2021 20:02:35 +0100
Message-Id: <00c39d09c8df7ad0673bf2043f6566d6ef08b789.1636916479.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The 'inuse' bitmap is local to this function. So we can use the
non-atomic '__set_bit()' to save a few cycles.

While at it, also remove some useless {}.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/bridge/br_if.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/bridge/br_if.c b/net/bridge/br_if.c
index c1183fef1f21..64b2d4fb50f5 100644
--- a/net/bridge/br_if.c
+++ b/net/bridge/br_if.c
@@ -397,10 +397,10 @@ static int find_portno(struct net_bridge *br)
 	if (!inuse)
 		return -ENOMEM;
 
-	set_bit(0, inuse);	/* zero is reserved */
-	list_for_each_entry(p, &br->port_list, list) {
-		set_bit(p->port_no, inuse);
-	}
+	__set_bit(0, inuse);	/* zero is reserved */
+	list_for_each_entry(p, &br->port_list, list)
+		__set_bit(p->port_no, inuse);
+
 	index = find_first_zero_bit(inuse, BR_MAX_PORTS);
 	bitmap_free(inuse);
 
-- 
2.30.2

