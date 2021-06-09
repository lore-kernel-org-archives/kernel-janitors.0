Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12B0C48BD1
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:24:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB93F611AE
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238793AbhFIK0t (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 06:26:49 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38483 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238766AbhFIK0r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 06:26:47 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lqvOD-0007LP-4r; Wed, 09 Jun 2021 10:24:49 +0000
From:   Colin King <colin.king@canonical.com>
To:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2][next][V2] net: usb: asix: ax88772: Fix less than zero comparison of a u16
Date:   Wed,  9 Jun 2021 11:24:48 +0100
Message-Id: <20210609102448.182798-2-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609102448.182798-1-colin.king@canonical.com>
References: <20210609102448.182798-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The comparison of the u16 priv->phy_addr < 0 is always false because
phy_addr is unsigned. Fix this by assigning the return from the call
to function asix_read_phy_addr to int ret and using this for the
less than zero error check comparison.

Fixes: 7e88b11a862a ("net: usb: asix: refactor asix_read_phy_addr() and handle errors on return")
Addresses-Coverity: ("Unsigned compared against 0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: fix up return check.

---
 drivers/net/usb/ax88172a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/ax88172a.c b/drivers/net/usb/ax88172a.c
index 2e2081346740..530947d7477b 100644
--- a/drivers/net/usb/ax88172a.c
+++ b/drivers/net/usb/ax88172a.c
@@ -205,11 +205,11 @@ static int ax88172a_bind(struct usbnet *dev, struct usb_interface *intf)
 		goto free;
 	}
 
-	priv->phy_addr = asix_read_phy_addr(dev, priv->use_embdphy);
-	if (priv->phy_addr < 0) {
-		ret = priv->phy_addr;
+	ret = asix_read_phy_addr(dev, priv->use_embdphy);
+	if (ret < 0)
 		goto free;
-	}
+
+	priv->phy_addr = ret;
 
 	ax88172a_reset_phy(dev, priv->use_embdphy);
 
-- 
2.31.1

