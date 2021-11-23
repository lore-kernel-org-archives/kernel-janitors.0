Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A62CC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Nov 2021 20:47:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238760AbhKWUuL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 Nov 2021 15:50:11 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:50334 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239118AbhKWUuK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Nov 2021 15:50:10 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id pcgtmIyUjBazopcgumCFhk; Tue, 23 Nov 2021 21:47:00 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 23 Nov 2021 21:47:00 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/2] drm/amdkfd: Slighly optimize 'init_doorbell_bitmap()'
Date:   Tue, 23 Nov 2021 21:46:58 +0100
Message-Id: <72ac7967f07e0794a8a06793407cf03f6a34e9fa.1637700315.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cebaed4e892db804eece363e07a3ddd04af0f7be.1637700315.git.christophe.jaillet@wanadoo.fr>
References: <cebaed4e892db804eece363e07a3ddd04af0f7be.1637700315.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The 'doorbell_bitmap' bitmap has just been allocated. So we can use the
non-atomic '__set_bit()' function to save a few cycles as no concurrent
access can happen.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
bitmap_set() could certainly also be use, but range checking would be
tricky.

v1 --> v2: No change
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 67bb1654becc..9158f9754a24 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1446,9 +1446,9 @@ static int init_doorbell_bitmap(struct qcm_process_device *qpd,
 
 	for (i = 0; i < KFD_MAX_NUM_OF_QUEUES_PER_PROCESS / 2; i++) {
 		if (i >= range_start && i <= range_end) {
-			set_bit(i, qpd->doorbell_bitmap);
-			set_bit(i + KFD_QUEUE_DOORBELL_MIRROR_OFFSET,
-				qpd->doorbell_bitmap);
+			__set_bit(i, qpd->doorbell_bitmap);
+			__set_bit(i + KFD_QUEUE_DOORBELL_MIRROR_OFFSET,
+				  qpd->doorbell_bitmap);
 		}
 	}
 
-- 
2.30.2

