Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F8BC2B9F4
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 22:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 224FC60FF1
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 22:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhFVWWF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 18:22:05 -0400
Received: from pb-smtp21.pobox.com ([173.228.157.53]:57022 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhFVWWF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 18:22:05 -0400
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id C38E6135459;
        Tue, 22 Jun 2021 18:19:48 -0400 (EDT)
        (envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
        :to:subject:message-id:mime-version:content-type; s=sasl; bh=j8r
        QrshbvNd0uPBvyfgmlh5xUyZNgnP8aHq0npBHc5s=; b=S6tNnxTLNrfgPnlhKuP
        t+dVLKT6kSp6ZCZhcb2mN+iT2y4PHQH3OCZJ02hCru/zQk5hnw8TqjOUGb5KNkvm
        F8SPqt4P64a1aii8CIMWpy6Zlj+YM1UgOocFjmJxFRnnLjovPizMbw2lO48Rxyls
        tdBdiUIOPRr/ES0sjGYed58k=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id B2A3B135457;
        Tue, 22 Jun 2021 18:19:48 -0400 (EDT)
        (envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=date:from:to:subject:message-id:mime-version:content-type;
 s=2019-09.pbsmtp; bh=j8rQrshbvNd0uPBvyfgmlh5xUyZNgnP8aHq0npBHc5s=;
 b=bRZxLHQca0pRoZWecfLtVRADRv3eZynVKVxeSY89pSaht0JW1MP/8CW96JVcyy35LH+DBypA4cdFwnPva0sXjdire0q5sFF8X9KHxy2xQYONA9l7ofL2WoH54BNkyDQjX1We6gbgNd+tTgbu2GMHnh9AQZ1TtCFfUxZRx3aUISo=
Received: from oatmeal.darkphysics (unknown [24.19.107.226])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 03997135456;
        Tue, 22 Jun 2021 18:19:45 -0400 (EDT)
        (envelope-from tdavies@darkphysics.net)
Date:   Tue, 22 Jun 2021 15:19:40 -0700
From:   Tree Davies <tdavies@darkphysics.net>
To:     Tree Davies <tdavies@darkphysics.net>,
        kernel-janitors@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v1 1/1] net/e1000e: Fix spelling mistake "The" -> "This"
Message-ID: <20210622221938.GA30762@oatmeal.darkphysics>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Pobox-Relay-ID: F35D7A94-D3A7-11EB-98FB-FA9E2DDBB1FC-45285927!pb-smtp21.pobox.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a spelling mistake in the comment block.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 88e9035b75cf..ff267cf75ef8 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -7674,7 +7674,7 @@ static int e1000_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
  * @pdev: PCI device information struct
  *
  * e1000_remove is called by the PCI subsystem to alert the driver
- * that it should release a PCI device.  The could be caused by a
+ * that it should release a PCI device.  This could be caused by a
  * Hot-Plug event, or because the driver is going to be removed from
  * memory.
  **/
-- 
2.20.1

