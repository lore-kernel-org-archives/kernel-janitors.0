Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA45C7EE25
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jun 2023 07:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbjFLH7A (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jun 2023 03:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234422AbjFLH6m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 03:58:42 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE163AAC
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 00:57:42 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f7a8089709so41878935e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 00:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686556658; x=1689148658;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dh3m5EnGq8oDqy/skIsgoVVe8sQWqfH3fJBF1zMWlPI=;
        b=h72P768ezA7D9ZxvT+e6RQNXhj9IW29U0NJMoEHLU8fSlSAbVCZwrv3sbEzbvtWAv/
         W2Ob+QBxrEObDKpKMwHP6jOzeoqm0+H9TbP95gqsAKY3k+3fejWOH1l1U1/fc2xgEGqh
         kYGWhnapk0oSsUNnTl8hzrbDmTZQc21ayHaG5a3LQa/puFRv/OJQ6TDr8XFvGaGcdA8y
         dvLHnooTJi5ZxuNl9J0aOnJJuJNpHIcnQSuS7Y8rAvB8WQxo5g75sxEOa7bHMT436bp7
         0m4fkE3LvhIR5CKAoixL33iq/lO/do36CztMXJMb6SMfpy2owmup5JaTEnIvRv5jKLOU
         1iBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686556658; x=1689148658;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dh3m5EnGq8oDqy/skIsgoVVe8sQWqfH3fJBF1zMWlPI=;
        b=lbJETfqcqRbgmMqN4Y+N157uSNgEUqaBgV/s4RvtDzZ1rDr+JBQjEiQH4JAa4sT2pJ
         enTyZcPfsOQqNFj3/YRnyXeG0Bid8pIbzRt1zS0BQh093HVlVo4c8mVoWlVeZxQgwO7n
         suo8LHmpM4CwBPNhfX39DNgLtOJ2v5W3TBANdx65vW9Pi2i9VJ7JM3IOABkaUO3KQxKe
         v1QMS/kkEyeUDC36IdxsrWDexwgFr4DSrQ4D5v4YFM3/emSSavjjCjUArdjXJoOWkYGu
         BqX71dCFQHt/rJWrkIrU3W8ZVVgyNTuvJnwnkgcFRV5Tk9tHd2ffxItaeKdOuPKqX89o
         L7Cg==
X-Gm-Message-State: AC+VfDwOYaox51YT9EWNMgOkU2SrAFS4qp4OkuZhESvLihWUkAEKPcgl
        3PTzgS68zNgC/uugMcLjmLCTenFhwRcr8QoauWk=
X-Google-Smtp-Source: ACHHUZ5NOulkn52aJFVhJpPQjfRvd4WRSv9OntbZbQl/v5lKtkgZnVS8/sISV9nt3mxXMuAR4iLnTg==
X-Received: by 2002:adf:e551:0:b0:30f:c6f9:dc0f with SMTP id z17-20020adfe551000000b0030fc6f9dc0fmr216207wrm.63.1686554338123;
        Mon, 12 Jun 2023 00:18:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e16-20020adffc50000000b0030fbb834074sm3838418wrs.15.2023.06.12.00.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 00:18:56 -0700 (PDT)
Date:   Mon, 12 Jun 2023 10:18:50 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Siddharth Vadapalli <s-vadapalli@ti.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Roger Quadros <rogerq@kernel.org>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: ethernet: ti: am65-cpsw: Call of_node_put() on
 error path
Message-ID: <e3012f0c-1621-40e6-bf7d-03c276f6e07f@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code returns directly but it should instead call of_node_put()
to drop some reference counts.

Fixes: dab2b265dd23 ("net: ethernet: ti: am65-cpsw: Add support for SERDES configuration")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 11cbcd9e2c72..bebcfd5e6b57 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2068,7 +2068,7 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
 		/* Initialize the Serdes PHY for the port */
 		ret = am65_cpsw_init_serdes_phy(dev, port_np, port);
 		if (ret)
-			return ret;
+			goto of_node_put;
 
 		port->slave.mac_only =
 				of_property_read_bool(port_np, "ti,mac-only");
-- 
2.39.2

