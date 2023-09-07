Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88F8EC8742
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 17:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241728AbjIGRSH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242407AbjIGRSD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 13:18:03 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C063BC;
        Thu,  7 Sep 2023 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=62TySAHC1N1G9xqdoVRmmg5fUX1gEgCoM5TVnSAfm1w=;
  b=TKlOCVNtV4EtiX6/v665r/6e/F6v+j5ghyDiYIk8w4tR5gk+lwpMkTtg
   E9GEAdIev2+X/KVusJ8ooLvvJetyaRhccVDbFXBWkuxAyMUjrY4XWD4z9
   4SGHusWg+taayQm6FZymoPqYON3JzvWl2aRfdGwvHM+whC7FlPOOnyoIa
   8=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.02,234,1688421600"; 
   d="scan'208";a="65324657"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 11:55:30 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Justin Chen <justin.chen@broadcom.com>
Cc:     kernel-janitors@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] net: bcmasp: add missing of_node_put
Date:   Thu,  7 Sep 2023 11:55:12 +0200
Message-Id: <20230907095521.14053-3-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

for_each_available_child_of_node performs an of_node_get
on each iteration, so a break out of the loop requires an
of_node_put.

This was done using the Coccinelle semantic patch
iterators/for_each_child.cocci

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/net/ethernet/broadcom/asp2/bcmasp.c |    1 +
 1 file changed, 1 insertion(+)

diff -u -p a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -1300,6 +1300,7 @@ static int bcmasp_probe(struct platform_
 		if (!intf) {
 			dev_err(dev, "Cannot create eth interface %d\n", i);
 			bcmasp_remove_intfs(priv);
+			of_node_put(intf_node);
 			goto of_put_exit;
 		}
 		list_add_tail(&intf->list, &priv->intfs);

