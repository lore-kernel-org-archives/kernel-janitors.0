Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92F0CA0EC8
	for <kernel-janitors@archiver.kernel.org>; Mon, 11 Sep 2023 22:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239164AbjIKWpi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244277AbjIKTvN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 Sep 2023 15:51:13 -0400
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806F31A2
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Sep 2023 12:51:05 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id fmvuqjtZmmTYjfmvuqYQl7; Mon, 11 Sep 2023 21:50:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1694461858;
        bh=ZamjEVZ18uTTJvONVpJjngq/DbdaPZNJa1qgQbQpoRw=;
        h=From:To:Cc:Subject:Date;
        b=K9obfdGdVxHS2CYE7BBNg4g3et6obL90MC7iMj/0IaUB/W1GHPqeBy0547TCtk0Iw
         g5LmkU8HegOrtKi97dK0zjIG9bSiHQWs8hIPYY6463Wr7wTTzGdtM5CGN5pTErkKCi
         sSU1I8z/XVqwSJQvVZ32XUEWF+EG/3+5YkKkT/F3/s2KUYc0qpSr6DDwwnqZOe7Au0
         baUiJYEtIre5X/neoTE++KjllhD7DVruxTVCUYmzdRurnS0pdY3MC1BYmQ8IJfmS5W
         HZ7dDI5LChMHgZnfld0y35Y6zsXM0JA1ZhUrEtpEH2MEneNJN/hP6F14EHSm32bFYw
         QwF6I7ZXfBUQQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 11 Sep 2023 21:50:58 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Cai Huoqing <cai.huoqing@linux.dev>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org
Subject: [PATCH net-next] net: hinic: Use devm_kasprintf()
Date:   Mon, 11 Sep 2023 21:50:52 +0200
Message-Id: <198375f3b77b4a6bae4fdaefff7630414c0c89fe.1694461804.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use devm_kasprintf() instead of hand writing it.
This is less verbose and less error prone.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/huawei/hinic/hinic_tx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_tx.c b/drivers/net/ethernet/huawei/hinic/hinic_tx.c
index ad47ac51a139..9b60966736db 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_tx.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_tx.c
@@ -861,7 +861,7 @@ int hinic_init_txq(struct hinic_txq *txq, struct hinic_sq *sq,
 	struct hinic_qp *qp = container_of(sq, struct hinic_qp, sq);
 	struct hinic_dev *nic_dev = netdev_priv(netdev);
 	struct hinic_hwdev *hwdev = nic_dev->hwdev;
-	int err, irqname_len;
+	int err;
 
 	txq->netdev = netdev;
 	txq->sq = sq;
@@ -882,15 +882,13 @@ int hinic_init_txq(struct hinic_txq *txq, struct hinic_sq *sq,
 		goto err_alloc_free_sges;
 	}
 
-	irqname_len = snprintf(NULL, 0, "%s_txq%d", netdev->name, qp->q_id) + 1;
-	txq->irq_name = devm_kzalloc(&netdev->dev, irqname_len, GFP_KERNEL);
+	txq->irq_name = devm_kasprintf(&netdev->dev, GFP_KERNEL, "%s_txq%d",
+				       netdev->name, qp->q_id);
 	if (!txq->irq_name) {
 		err = -ENOMEM;
 		goto err_alloc_irqname;
 	}
 
-	sprintf(txq->irq_name, "%s_txq%d", netdev->name, qp->q_id);
-
 	err = hinic_hwdev_hw_ci_addr_set(hwdev, sq, CI_UPDATE_NO_PENDING,
 					 CI_UPDATE_NO_COALESC);
 	if (err)
-- 
2.34.1

