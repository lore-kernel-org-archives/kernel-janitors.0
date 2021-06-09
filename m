Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E03AC48BCD
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 06:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5825E61263
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 06:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbhFIG6X (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 02:58:23 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:8105 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbhFIG6W (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 02:58:22 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G0HrJ5z5NzYsX5;
        Wed,  9 Jun 2021 14:53:36 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 14:56:26 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 9 Jun 2021
 14:56:25 +0800
From:   Baokun Li <libaokun1@huawei.com>
To:     <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
        "David Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Lyude Paul <lyude@redhat.com>
CC:     <weiyongjun1@huawei.com>, <yuehaibing@huawei.com>,
        <yangjihong1@huawei.com>, <yukuai3@huawei.com>,
        <libaokun1@huawei.com>, <dri-devel@lists.freedesktop.org>,
        <nouveau@lists.freedesktop.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next v2] drm/nouveau/fifo: use list_move instead of list_del/list_add in base.c
Date:   Wed, 9 Jun 2021 15:05:34 +0800
Message-ID: <20210609070534.1324550-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Using list_move() instead of list_del() + list_add() in base.c.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
V1->V2:
	CC mailist

 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index 2ed4ff05d207..1802ac78b78f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -79,8 +79,7 @@ nvkm_fifo_chan_inst_locked(struct nvkm_fifo *fifo, u64 inst)
 	struct nvkm_fifo_chan *chan;
 	list_for_each_entry(chan, &fifo->chan, head) {
 		if (chan->inst->addr == inst) {
-			list_del(&chan->head);
-			list_add(&chan->head, &fifo->chan);
+			list_move(&chan->head, &fifo->chan);
 			return chan;
 		}
 	}
@@ -109,8 +108,7 @@ nvkm_fifo_chan_chid(struct nvkm_fifo *fifo, int chid, unsigned long *rflags)
 	spin_lock_irqsave(&fifo->lock, flags);
 	list_for_each_entry(chan, &fifo->chan, head) {
 		if (chan->chid == chid) {
-			list_del(&chan->head);
-			list_add(&chan->head, &fifo->chan);
+			list_move(&chan->head, &fifo->chan);
 			*rflags = flags;
 			return chan;
 		}

