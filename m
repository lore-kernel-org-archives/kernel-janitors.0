Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE66C43460
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 08:28:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAB536145B
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 08:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhENI3g (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 May 2021 04:29:36 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3686 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbhENI3c (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 May 2021 04:29:32 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FhM6T6wQYz1BMBS;
        Fri, 14 May 2021 16:25:37 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.176.189) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 14 May 2021 16:28:12 +0800
From:   Qiheng Lin <linqiheng@huawei.com>
To:     <linqiheng@huawei.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
CC:     <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] drm/vmwgfx: Fix return value check in vmw_setup_pci_resources()
Date:   Fri, 14 May 2021 16:28:12 +0800
Message-ID: <20210514082812.1697-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.189]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In case of error, the function devm_ioremap() returns NULL pointer not ERR_PTR().
The IS_ERR() test in the return value check should be replaced with NULL test.
After that, the error code -ENOMEM should be returned.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 5cf3a5bf539f..6f5ea00973e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -719,10 +719,10 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		dev->rmmio = devm_ioremap(dev->drm.dev,
 					  rmmio_start,
 					  rmmio_size);
-		if (IS_ERR(dev->rmmio)) {
+		if (!dev->rmmio) {
 			DRM_ERROR("Failed mapping registers mmio memory.\n");
 			pci_release_regions(pdev);
-			return PTR_ERR(dev->rmmio);
+			return -ENOMEM;
 		}
 	} else if (pci_id == VMWGFX_PCI_ID_SVGA2) {
 		dev->io_start = pci_resource_start(pdev, 0);

