Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36419C4743D
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 12:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F9E961357
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 12:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhFEMto (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 5 Jun 2021 08:49:44 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:52662 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhFEMtn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 5 Jun 2021 08:49:43 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 155CjPDq116627;
        Sat, 5 Jun 2021 12:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=iMFhXKZLxPG0U9nDS7/IRnpnxvmykwkh+VOS7a5x93Q=;
 b=gI8bTImaSUOtkWDQcfXvuluzZvcRzuxG4QklvjlKr+TKXIPNka+2jaGHVsfVziAOIh5s
 uFQ0uDcqDdLGB7984ERDCjPJR5di/tUQRYPH6C1DFbK4Ygd2kjhK2FxCLae8rkEg3h2m
 LXT06CSaeCUTLmeth9MIrYgEgNryLrYGA17Lk9VaRaHHmV5bDCF142rsQWaNZsXZLIj5
 VxPgLmBIJVRk/YPO4/D1aPs/8+90IMRlURt7DQMxHYHZUwkN2srkqYTI7HmtQnGulL+M
 brovj/hpymbGE9u/tVb4ooQxuLpZcfDg9E2qb++S6XQhhKiRLaJ0vss3LYN+tazoGOog fg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 38yxsc8efe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 05 Jun 2021 12:47:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 155CjfH4172447;
        Sat, 5 Jun 2021 12:47:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 3906sk5wjm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 05 Jun 2021 12:47:51 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 155ClokD176432;
        Sat, 5 Jun 2021 12:47:50 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 3906sk5wjd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 05 Jun 2021 12:47:50 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 155ClmEm025450;
        Sat, 5 Jun 2021 12:47:49 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 05 Jun 2021 05:47:47 -0700
Date:   Sat, 5 Jun 2021 15:47:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Jason Wang <jasowang@redhat.com>, Eli Cohen <elic@nvidia.com>,
        Stefano Garzarella <sgarzare@redhat.com>,
        virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] vdpa: fix error code in vp_vdpa_probe()
Message-ID: <YLtyYE8TinOl3IhO@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: 2ENbIDQKvlMH5Q4t1XboRyzZPlVdeU0m
X-Proofpoint-GUID: 2ENbIDQKvlMH5Q4t1XboRyzZPlVdeU0m
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10005 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106050092
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return -ENOMEM if vp_modern_map_vq_notify() fails.  Currently it
returns success.

Fixes: 11d8ffed00b2 ("vp_vdpa: switch to use vp_modern_map_vq_notify()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/vdpa/virtio_pci/vp_vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
index c76ebb531212..e5d92db728d3 100644
--- a/drivers/vdpa/virtio_pci/vp_vdpa.c
+++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
@@ -442,6 +442,7 @@ static int vp_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			vp_modern_map_vq_notify(mdev, i,
 						&vp_vdpa->vring[i].notify_pa);
 		if (!vp_vdpa->vring[i].notify) {
+			ret = -ENOMEM;
 			dev_warn(&pdev->dev, "Fail to map vq notify %d\n", i);
 			goto err;
 		}
-- 
2.30.2

