Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A15C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon,  6 Dec 2021 08:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239705AbhLFIvt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 6 Dec 2021 03:51:49 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:48528 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239700AbhLFIvt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Dec 2021 03:51:49 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=guanjun@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UzZ675D_1638780498;
Received: from localhost(mailfrom:guanjun@linux.alibaba.com fp:SMTPD_---0UzZ675D_1638780498)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 06 Dec 2021 16:48:19 +0800
From:   'Guanjun' <guanjun@linux.alibaba.com>
To:     mst@redhat.com, xieyongji@bytedance.com
Cc:     jasowang@redhat.com, virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH V2 1/1] vduse: moving kvfree into caller
Date:   Mon,  6 Dec 2021 16:48:18 +0800
Message-Id: <1638780498-55571-1-git-send-email-guanjun@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Guanjun <guanjun@linux.alibaba.com>

This free action should be moved into caller 'vduse_ioctl' in
concert with the allocation.

No functional change.

Signed-off-by: Guanjun <guanjun@linux.alibaba.com>
---
 drivers/vdpa/vdpa_user/vduse_dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index c9204c62f339..477a5a592002 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -1355,7 +1355,6 @@ static int vduse_create_dev(struct vduse_dev_config *config,
 err_str:
 	vduse_dev_destroy(dev);
 err:
-	kvfree(config_buf);
 	return ret;
 }
 
@@ -1406,6 +1405,8 @@ static long vduse_ioctl(struct file *file, unsigned int cmd,
 		}
 		config.name[VDUSE_NAME_MAX - 1] = '\0';
 		ret = vduse_create_dev(&config, buf, control->api_version);
+		if (ret)
+			kvfree(buf);
 		break;
 	}
 	case VDUSE_DESTROY_DEV: {
-- 
2.27.0

