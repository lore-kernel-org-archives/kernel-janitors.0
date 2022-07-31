Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6315C3F6B0
	for <kernel-janitors@archiver.kernel.org>; Sun, 31 Jul 2022 20:02:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237850AbiGaUCC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 31 Jul 2022 16:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbiGaUCB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 31 Jul 2022 16:02:01 -0400
Received: from smtp.smtpout.orange.fr (smtp-11.smtpout.orange.fr [80.12.242.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E0ADF72
        for <kernel-janitors@vger.kernel.org>; Sun, 31 Jul 2022 13:02:00 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id IF8OoxSFa9RnzIF8OokYko; Sun, 31 Jul 2022 22:01:58 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 31 Jul 2022 22:01:58 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Deepak Rawat <drawat.floss@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/hyperv: Fix an error handling path in hyperv_vmbus_probe()
Date:   Sun, 31 Jul 2022 22:01:55 +0200
Message-Id: <7dfa372af3e35fbb1d6f157183dfef2e4512d3be.1659297696.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

hyperv_setup_vram() calls vmbus_allocate_mmio().
This must be undone in the error handling path of the probe, as already
done in the remove function.

This patch depends on	commit a0ab5abced55 ("drm/hyperv : Removing the
restruction of VRAM allocation with PCI bar size").
Without it, something like what is done in commit e048834c209a
("drm/hyperv: Fix device removal on Gen1 VMs") should be done.

Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 6d11e7938c83..fc8b4e045f5d 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -133,7 +133,6 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 	}
 
 	ret = hyperv_setup_vram(hv, hdev);
-
 	if (ret)
 		goto err_vmbus_close;
 
@@ -150,18 +149,20 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 
 	ret = hyperv_mode_config_init(hv);
 	if (ret)
-		goto err_vmbus_close;
+		goto err_free_mmio;
 
 	ret = drm_dev_register(dev, 0);
 	if (ret) {
 		drm_err(dev, "Failed to register drm driver.\n");
-		goto err_vmbus_close;
+		goto err_free_mmio;
 	}
 
 	drm_fbdev_generic_setup(dev, 0);
 
 	return 0;
 
+err_free_mmio:
+	vmbus_free_mmio(hv->mem->start, hv->fb_size);
 err_vmbus_close:
 	vmbus_close(hdev->channel);
 err_hv_set_drv_data:
-- 
2.34.1

