Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E99BC77B7C
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Apr 2023 20:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbjDTUoZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Apr 2023 16:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbjDTUoT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Apr 2023 16:44:19 -0400
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2ABE4A
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 13:44:16 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id pb8WpIj6fkuIhpb8WpSgq7; Thu, 20 Apr 2023 22:44:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1682023455;
        bh=a/xPA7tF/CGArRsFpwm1r+BaXbXOHoj1SyeyiFZc7Ow=;
        h=From:To:Cc:Subject:Date;
        b=OaSdxjWr68FBxCGG8hbo0vS4DKWX0NNIIIEp/bdFq016Hd/w9DvX0ITh2xvM6xYmn
         gQ2YqFCBgq+RkCNDXDw5QAzjNhtvsqz85OGRYL4bxraJQYQPUI8BQAx5gbVk0rPbu+
         wpQNSRjfbb2fjFnRt+rieHruLqwCM68p3WVnbGAmoG/a3ltWiUydNj0ZvvcE7b2URg
         0Y6/zAlrTmgabtK2VMYp6wonj3EJAkQRHowrg81Q3aU+ZGmXmZ7EbDrNGJUCX8wriV
         j0zCaVEy/fEPz5JVyLK2ru0tQWG2umnvVUEUuLEm5YAzRcxyzMxoaHuHlnmMjjN3oP
         FoDhnmwNLH7fA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 20 Apr 2023 22:44:15 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org
Subject: [PATCH net-next] net: dsa: b53: Slightly optimize b53_arl_read()
Date:   Thu, 20 Apr 2023 22:44:10 +0200
Message-Id: <c94fb1b4dcd9a04eff08cf9ba2444c348477e554.1682023416.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

When the 'free_bins' bitmap is cleared, it is better to use its full
maximum size instead of only the needed size.
This lets the compiler optimize it because the size is now known at compile
time. B53_ARLTBL_MAX_BIN_ENTRIES is small (i.e. currently 4), so a call to
memset() is saved.

Also, as 'free_bins' is local to the function, the non-atomic __set_bit()
can also safely be used here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/dsa/b53/b53_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 3464ce5e7470..8c55fe0e0747 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1627,7 +1627,7 @@ static int b53_arl_read(struct b53_device *dev, u64 mac,
 	if (ret)
 		return ret;
 
-	bitmap_zero(free_bins, dev->num_arl_bins);
+	bitmap_zero(free_bins, B53_ARLTBL_MAX_BIN_ENTRIES);
 
 	/* Read the bins */
 	for (i = 0; i < dev->num_arl_bins; i++) {
@@ -1641,7 +1641,7 @@ static int b53_arl_read(struct b53_device *dev, u64 mac,
 		b53_arl_to_entry(ent, mac_vid, fwd_entry);
 
 		if (!(fwd_entry & ARLTBL_VALID)) {
-			set_bit(i, free_bins);
+			__set_bit(i, free_bins);
 			continue;
 		}
 		if ((mac_vid & ARLTBL_MAC_MASK) != mac)
-- 
2.34.1

