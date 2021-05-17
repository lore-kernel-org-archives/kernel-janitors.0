Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E299DC433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 08:58:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6788611BD
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 08:58:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235806AbhEQI72 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 May 2021 04:59:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:54032 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235760AbhEQI72 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 May 2021 04:59:28 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14H8mV6v031184;
        Mon, 17 May 2021 08:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=NzpXTJModC0Ot0dVk1rnqM4xwhNeiQvKOw+8+A3BrMI=;
 b=oJwOC6Z0Fu3R0Lm2CkgtxisBEdXMeKekIMEMn+CjqpEM9Q16i1QgfhEwHPS515DEyR92
 lkujNBLoq3tKtbJYpMzeck/RA4tfJcg4VmjuH8GTUZS2dQBmqnKEDuY6O+ZImQurlyRb
 bcV4iW7bc+E/du7dqElOZzp8bTqhPVsJ21ZjL1+AN/Va1j/gfMjQzLmYCQ6Mvivz+xhH
 hkTBbSDNucD7yjawqLCtK4bWQIKNFunMmFuSsQ2s3g1ot7UABs+uqwQHOpGWum5FKaOH
 3kTacPofftEUYd5z189Nv8AeZOKsUzQvYA2tVBbS3xZjw4ci1TWV/XKyVMnaHe6+EDig 0Q== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 38kfhwg3uj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 08:58:06 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14H8lq3O122591;
        Mon, 17 May 2021 08:58:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38j644tm1w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 08:58:06 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14H8w5Mm011605;
        Mon, 17 May 2021 08:58:05 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 38j644tm0d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 May 2021 08:58:05 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14H8w3fd020047;
        Mon, 17 May 2021 08:58:03 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 17 May 2021 01:58:02 -0700
Date:   Mon, 17 May 2021 11:57:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Chris Snook <chris.snook@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc:     Zekun Shen <bruceshenzk@gmail.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 1/2 net-next] alx: fix a double unlock in alx_probe()
Message-ID: <YKIwFAmmm2W2XocO@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: HAcNKcM_uMKqIerWJ7Qjc9rn_GU74mKj
X-Proofpoint-ORIG-GUID: HAcNKcM_uMKqIerWJ7Qjc9rn_GU74mKj
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We're not holding the lock at this point so "goto unlock;" should be
"goto unmap;"

Fixes: 4a5fe57e7751 ("alx: use fine-grained locking instead of RTNL")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/atheros/alx/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/atheros/alx/main.c b/drivers/net/ethernet/atheros/alx/main.c
index e8884879a50f..45e380f3b065 100644
--- a/drivers/net/ethernet/atheros/alx/main.c
+++ b/drivers/net/ethernet/atheros/alx/main.c
@@ -1859,7 +1859,7 @@ static int alx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	err = register_netdev(netdev);
 	if (err) {
 		dev_err(&pdev->dev, "register netdevice failed\n");
-		goto out_unlock;
+		goto out_unmap;
 	}
 
 	netdev_info(netdev,
-- 
2.30.2

