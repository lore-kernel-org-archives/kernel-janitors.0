Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA762C77B7A
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 May 2023 13:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjE2N2N (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 29 May 2023 09:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjE2N2M (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 May 2023 09:28:12 -0400
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDFC2A7
        for <kernel-janitors@vger.kernel.org>; Mon, 29 May 2023 06:28:09 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id 3curqP39nbOsk3curqbTYb; Mon, 29 May 2023 15:28:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1685366887;
        bh=8jgS5F8T526jeYM/4dx15aEEqAiDrCFfIRkSTI7woqQ=;
        h=From:To:Cc:Subject:Date;
        b=B1CYNAU5uH+zmapITZq52yzJm53tatvYvMoVN94JNW5oCzjeueGEMalpu1Bo+SQfb
         Y3kQLtegL41jHSu1+SQh9c7l4c949VyIPcCo+AOO/ayW6f33RmhiWBMBk4tSP8ViPM
         6ySkrEY3GBWekUIBp9+I67G6KwVC4WB8dRvocF6dKizbtpjjctbnlIq6fe09ijEoFI
         VYmhDpdU64IivgTJbognPSyAQBWqQjbGXkbD7OyAGhOh/J6zoLG2FEyGwGDmLaF3wm
         DTcVDAxIM4uLtzJeEnBU1LYwenDgu2AGtvVCBryFVg5RczCdduOArwj0b3Qrkr+IIb
         l66aNe9gB5F2w==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 29 May 2023 15:28:07 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        Oded Gabbay <ogabbay@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/ivpu: Use struct_size()
Date:   Mon, 29 May 2023 15:28:04 +0200
Message-Id: <0ae53be873c27c9a8740c4fe6d8e7cd1b1224994.1685366864.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use struct_size() instead of hand-writing it. It is less verbose, more
robust and more informative.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/accel/ivpu/ivpu_job.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 3c6f1e16cf2f..0a09bba8da24 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -289,15 +289,13 @@ ivpu_create_job(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
 {
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct ivpu_job *job;
-	size_t buf_size;
 	int ret;
 
 	ret = ivpu_rpm_get(vdev);
 	if (ret < 0)
 		return NULL;
 
-	buf_size = sizeof(*job) + bo_count * sizeof(struct ivpu_bo *);
-	job = kzalloc(buf_size, GFP_KERNEL);
+	job = kzalloc(struct_size(job, bos, bo_count), GFP_KERNEL);
 	if (!job)
 		goto err_rpm_put;
 
-- 
2.34.1

