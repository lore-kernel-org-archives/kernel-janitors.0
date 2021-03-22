Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42E0C433DB
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Mar 2021 15:08:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7103B6198B
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Mar 2021 15:08:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhCVPHv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 Mar 2021 11:07:51 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:35998 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbhCVPHZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Mar 2021 11:07:25 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12MExIxc040244;
        Mon, 22 Mar 2021 15:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ywu7PyqFTIuSjcHWouBKSIGMmmCyhnNSnVi8w+rnj7I=;
 b=luftmhc1GMkDnZorlwaJ1p2eGTDypjL3rNs3dKqkF54/rP79NsSmvGjbl8x4cCsT6tk/
 DuVEtdzzYpil7ShWORJh3QvRU0lE4n3LSW0rhsp1fYr7l3REm5uhuqLz9d+dqqtraU3V
 dLZpDAHCEzSCeAUsONQK3F1G/rYzivlGRtrNWYaq9OY654R0RUx2mtTheg/FwQGzN159
 HpfA3OSr2CwOCqygod2rADaJxpMA0RcZ0RT7xn7fUjY4GZZY+k737TP8/RRbQOjmfQ7u
 YUkOhzPuaIjJ7nGhgihPhIcJe19dl7tBhUrHH5PpfFqftGJbwuzTMNyKijl+fkvAhkZ3 OA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 37d90mbt0q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Mar 2021 15:07:19 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12MF0c3P079308;
        Mon, 22 Mar 2021 15:07:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 37dtyw703p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Mar 2021 15:07:17 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12MF6uQW016166;
        Mon, 22 Mar 2021 15:06:57 GMT
Received: from mwanda (/10.175.191.120)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 22 Mar 2021 15:06:55 +0000
Date:   Mon, 22 Mar 2021 18:06:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Manish Chopra <manishc@marvell.com>, Coiby Xu <coiby.xu@gmail.com>
Cc:     GR-Linux-NIC-Dev@marvell.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: qlge: fix an error code in probe()
Message-ID: <YFiyicHI189PXrha@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103220109
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103220109
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If alloc_etherdev_mq() fails then return -ENOMEM instead of success.
The "err = 0;" triggers an unused assignment now so remove that as
well.

Fixes: 953b94009377 ("staging: qlge: Initialize devlink health dump framework")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/qlge/qlge_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 2682a0e474bd..e11470910ef3 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -4549,7 +4549,7 @@ static int qlge_probe(struct pci_dev *pdev,
 	struct net_device *ndev = NULL;
 	struct devlink *devlink;
 	static int cards_found;
-	int err = 0;
+	int err;
 
 	devlink = devlink_alloc(&qlge_devlink_ops, sizeof(struct qlge_adapter));
 	if (!devlink)
@@ -4560,8 +4560,10 @@ static int qlge_probe(struct pci_dev *pdev,
 	ndev = alloc_etherdev_mq(sizeof(struct qlge_netdev_priv),
 				 min(MAX_CPUS,
 				     netif_get_num_default_rss_queues()));
-	if (!ndev)
+	if (!ndev) {
+		err = -ENOMEM;
 		goto devlink_free;
+	}
 
 	ndev_priv = netdev_priv(ndev);
 	ndev_priv->qdev = qdev;
-- 
2.30.2

