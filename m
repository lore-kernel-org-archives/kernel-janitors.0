Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5E3C43460
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 20:20:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A31FD61352
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 20:20:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239900AbhEQUVw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 May 2021 16:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239203AbhEQUVt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 May 2021 16:21:49 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38328C061573;
        Mon, 17 May 2021 13:20:32 -0700 (PDT)
Received: from dslb-084-059-234-229.084.059.pools.vodafone-ip.de ([84.59.234.229] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lijip-0001o4-6u; Mon, 17 May 2021 22:20:15 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 1/6] staging: rtl8188eu: use safe iterator in rtw_free_network_queue
Date:   Mon, 17 May 2021 22:18:21 +0200
Message-Id: <20210517201826.25150-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210516160613.30489-1-martin@kaiser.cx>
References: <20210516160613.30489-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

rtw_free_network_queue iterates over the scanned wireless networks and
calls _rtw_free_network for each of them. In some cases,
_rtw_free_network removes a network from the list.

We have to use list_for_each_entry_safe if we remove list entries while
we iterate over a list.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
 - use list_for_each_entry_safe

Without this patch, it's easy to get the driver into an endless loop by
scanning, connecting and disconnecting repeatedly.

wpa_supplicant -B -Dwext -i wlan0 -c /path/to/my/config...
while true ; do
   sleep 1
   wpa_cli reconfigure
   wpa_cli add_network
   wpa_cli set_network 0 ssid ...
   wpa_cli set_network 0 psk ...
   wpa_cli select_network 0
   sleep 6
   wpa_cli status
   wpa_cli disconnect 0
done

 drivers/staging/rtl8188eu/core/rtw_mlme.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
index 159465b073c2..ba73ac5325e2 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
@@ -199,19 +199,17 @@ struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 
 void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 {
-	struct list_head *phead, *plist;
-	struct wlan_network *pnetwork;
+	struct list_head *phead;
+	struct wlan_network *pnetwork, *temp;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct __queue *scanned_queue = &pmlmepriv->scanned_queue;
 
 	spin_lock_bh(&scanned_queue->lock);
 
 	phead = get_list_head(scanned_queue);
-	list_for_each(plist, phead) {
-		pnetwork = list_entry(plist, struct wlan_network, list);
-
+	list_for_each_entry_safe(pnetwork, temp, phead, list)
 		_rtw_free_network(pmlmepriv, pnetwork, isfreeall);
-	}
+
 	spin_unlock_bh(&scanned_queue->lock);
 }
 
-- 
2.20.1

