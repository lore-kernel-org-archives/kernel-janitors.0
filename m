Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86977EB8FAF
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Sep 2023 11:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235254AbjIFLYQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Sep 2023 07:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239387AbjIFLYQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Sep 2023 07:24:16 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FAB1987
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Sep 2023 04:23:57 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40037db2fe7so34316095e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Sep 2023 04:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693999436; x=1694604236; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnD5AsR+rQGEikt0Jm0WB+aaQ90cGSQSw3FwinvIwiE=;
        b=u8DWgxBGaSmNxN+4J36lAeI7U92xFah2GXT1U8iHCl3pvgLrtmeqHekw72KomrVm+u
         9yMw21S+p5O4APpde1dHu79ox7r93G7mI5cLA3MUP9cejn+7qb2LhKx3IzE43By3584x
         oUnzVfm50hR+EZl3FhEWPk4yn78Kc6OmCA3C/decnN+T7ZjspRnmFAxmKSRprOmU1nUm
         prUhwWIgOWfzgGqJfC+PMMc7J1LRo7lQM3mzUuo1TlvW0VNM+eZNqB8gf7YERuqh35du
         1L3wbvCkTwGPwfYiW45Fd3TBEumCKbefTAxsk5ejIzYdFcsdydjaoHo4D+PhwQUoSZNW
         HFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693999436; x=1694604236;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YnD5AsR+rQGEikt0Jm0WB+aaQ90cGSQSw3FwinvIwiE=;
        b=IqOAC3tTwtS8Tlad785JO8Chuf6lcl98I4wynH3gR/pG3RCtQgwOubSa7gk+ELog2n
         U6fz062Dj/h+UVaT/itFWnae7qFK6vTsMtpVk6Bzr0xXGEbb+E9zZfcZLQB3S+uQx07v
         1vdNvw5eRTSNGssntiXPcemoYRrcMev1fh6wbKcpuZodeUZq3DklqjRipyaLXJllcyl1
         JkxFNub1enzdOk71uCyigf2GQhzCCWawgQ9nzy3u01NW/viojBxRijXBU3aB3Ji7WAzh
         kMQebe1aITjaHaKyL1voiHvEkLfsskCaHx4ktk0Ow5XKNmSHqTFjE40ThHp7FvAH84zp
         VJig==
X-Gm-Message-State: AOJu0YwZrn3sNfLuEGZpKCEByrv/WgjxXJz6EmKk/nF0kkZdFTM81x+B
        GnvmHBI2RarV2/A0gbBeL3KKjA==
X-Google-Smtp-Source: AGHT+IGfYP3zQPLwT2yb30uf2wbJUO0eXJJuYp2woUe5QwMhi7INC4jOkYKyCpdhntKmPZhIYrk5yQ==
X-Received: by 2002:adf:f4d0:0:b0:317:58e4:e941 with SMTP id h16-20020adff4d0000000b0031758e4e941mr1878533wrp.33.1693999436178;
        Wed, 06 Sep 2023 04:23:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h8-20020a056000000800b0030647449730sm20357768wrx.74.2023.09.06.04.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 04:23:55 -0700 (PDT)
Date:   Wed, 6 Sep 2023 14:23:52 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Cheng Xu <chengyou@linux.alibaba.com>
Cc:     Kai Shen <kaishen@linux.alibaba.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] RDMA/erdma: Fix error code in erdma_create_scatter_mtt()
Message-ID: <1eb400d5-d8a3-4a8e-b3da-c43c6c377f86@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The erdma_create_scatter_mtt() function is supposed to return error
pointers.  Returning NULL will lead to an Oops.

Fixes: ed10435d3583 ("RDMA/erdma: Implement hierarchical MTT")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/infiniband/hw/erdma/erdma_verbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/erdma/erdma_verbs.c b/drivers/infiniband/hw/erdma/erdma_verbs.c
index dcccb6015232..70eaed59a67c 100644
--- a/drivers/infiniband/hw/erdma/erdma_verbs.c
+++ b/drivers/infiniband/hw/erdma/erdma_verbs.c
@@ -655,7 +655,7 @@ static struct erdma_mtt *erdma_create_scatter_mtt(struct erdma_dev *dev,
 
 	mtt = kzalloc(sizeof(*mtt), GFP_KERNEL);
 	if (!mtt)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	mtt->size = ALIGN(size, PAGE_SIZE);
 	mtt->buf = vzalloc(mtt->size);
-- 
2.39.2

