Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0829C77B7A
	for <kernel-janitors@archiver.kernel.org>; Sat, 20 May 2023 09:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbjETJtE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 20 May 2023 05:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjETJtD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 20 May 2023 05:49:03 -0400
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759EA1BD
        for <kernel-janitors@vger.kernel.org>; Sat, 20 May 2023 02:49:01 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id 0JCrqmyLhJVoz0JCrqxvws; Sat, 20 May 2023 11:48:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1684576139;
        bh=PFeiTJVHke4bEGuoYNcOkxZOFogPE/KWv3YrygEuprE=;
        h=From:To:Cc:Subject:Date;
        b=ZZmnYIxhy2r+fBlx5gImUrUjp5VJ9heiJfdHbrg1D9u+rGIDidIrJ35WOrhesnvkQ
         /zVnMJfVC8VgwYqsmlgG8Gq62luUVWWYXiUx+4mGp3YoZdFqxDvbRFtA4FfYU4nIfs
         UODreIOmfBaKoj71ZRxnIUVzdHzBpU/rzx9shW4BdVf5O6PmM8nHzKYw29XSpNXUFJ
         uuYmg62rpeDQ4VHEocHUk0njr5LJfzB+VFh6FMaiDDUQrtOOff1sCKLVrJNCHnWq//
         C1ad6e4+An+BM2jVUL6gMeJL+0o8tDzJhtCWvrrs5iFW6XFzMEXSbld+Z+OsZ9+tYt
         eM7uYsJZ6D9hg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 May 2023 11:48:59 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org
Subject: [PATCH net] 3c589_cs: Fix an error handling path in tc589_probe()
Date:   Sat, 20 May 2023 11:48:55 +0200
Message-Id: <d8593ae867b24c79063646e36f9b18b0790107cb.1684575975.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Should tc589_config() fail, some resources need to be released as already
done in the remove function.

Fixes: 15b99ac17295 ("[PATCH] pcmcia: add return value to _config() functions")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/3com/3c589_cs.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/3com/3c589_cs.c b/drivers/net/ethernet/3com/3c589_cs.c
index 82f94b1635bf..5267e9dcd87e 100644
--- a/drivers/net/ethernet/3com/3c589_cs.c
+++ b/drivers/net/ethernet/3com/3c589_cs.c
@@ -195,6 +195,7 @@ static int tc589_probe(struct pcmcia_device *link)
 {
 	struct el3_private *lp;
 	struct net_device *dev;
+	int ret;
 
 	dev_dbg(&link->dev, "3c589_attach()\n");
 
@@ -218,7 +219,15 @@ static int tc589_probe(struct pcmcia_device *link)
 
 	dev->ethtool_ops = &netdev_ethtool_ops;
 
-	return tc589_config(link);
+	ret = tc589_config(link);
+	if (ret)
+		goto err_free_netdev;
+
+	return 0;
+
+err_free_netdev:
+	free_netdev(dev);
+	return ret;
 }
 
 static void tc589_detach(struct pcmcia_device *link)
-- 
2.34.1

