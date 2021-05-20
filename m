Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E157C433B4
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 13:27:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3D42610A2
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 13:27:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238818AbhETN2v (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 May 2021 09:28:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4559 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbhETN2v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 May 2021 09:28:51 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fm9Sn0gz5zqV4v;
        Thu, 20 May 2021 21:24:41 +0800 (CST)
Received: from dggeml759-chm.china.huawei.com (10.1.199.138) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 21:27:27 +0800
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 20 May 2021 21:27:27 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
        "Kirti Wankhede" <kwankhede@nvidia.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
CC:     <kvm@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next v2] samples: vfio-mdev: fix error handing in mdpy_fb_probe()
Date:   Thu, 20 May 2021 13:36:41 +0000
Message-ID: <20210520133641.1421378-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fix to return a negative error code from the framebuffer_alloc() error
handling case instead of 0, also release regions in some error handing
cases.

Fixes: cacade1946a4 ("sample: vfio mdev display - guest driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 -> v2: add missing regions release.
---
 samples/vfio-mdev/mdpy-fb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
index 21dbf63d6e41..9ec93d90e8a5 100644
--- a/samples/vfio-mdev/mdpy-fb.c
+++ b/samples/vfio-mdev/mdpy-fb.c
@@ -117,22 +117,27 @@ static int mdpy_fb_probe(struct pci_dev *pdev,
 	if (format != DRM_FORMAT_XRGB8888) {
 		pci_err(pdev, "format mismatch (0x%x != 0x%x)\n",
 			format, DRM_FORMAT_XRGB8888);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_release_regions;
 	}
 	if (width < 100	 || width > 10000) {
 		pci_err(pdev, "width (%d) out of range\n", width);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_release_regions;
 	}
 	if (height < 100 || height > 10000) {
 		pci_err(pdev, "height (%d) out of range\n", height);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_release_regions;
 	}
 	pci_info(pdev, "mdpy found: %dx%d framebuffer\n",
 		 width, height);
 
 	info = framebuffer_alloc(sizeof(struct mdpy_fb_par), &pdev->dev);
-	if (!info)
+	if (!info) {
+		ret = -ENOMEM;
 		goto err_release_regions;
+	}
 	pci_set_drvdata(pdev, info);
 	par = info->par;
 

