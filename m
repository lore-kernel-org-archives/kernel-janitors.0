Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908B3EB64DC
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 Jul 2023 09:50:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbjGQJuQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 Jul 2023 05:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjGQJuO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Jul 2023 05:50:14 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6EC13D
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 02:50:09 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3141c3a7547so4073442f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689587408; x=1692179408;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHlCYgjw3sGv5X4Rh41zT7Cz0UApml3bPiXbTYKgKB4=;
        b=uZn+r1p4QIZuoah4Ce+XfaOMOBX6Cm212+xmfzaNY9nI8ClKQQPurJnYlgHvkb2plk
         LkjcTRNlRA7v7NCsFrWp+bnH+BK8MPMzELnviSYlipTvbJqwcoLxFkYugBaiwDelsHlj
         7CKb5gU9vlyhzAlf4EbGFTIu4SXAA322IHFEYLMfk4WM5TUEZ39i6mTf9tcxXZP7eg5E
         socjfxUGHfJN0z0bTdDTit2Ckx7aMR0BvSQxK6FtRqERMajXK+hZQY3P8e4lR+qZObAc
         WsI2v+K5GMGWY/CyiWrdquwtW5OzYiXDDAL4ewaAsu49fuGY7+dBFM2wllJy9xZdE7t+
         g0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689587408; x=1692179408;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UHlCYgjw3sGv5X4Rh41zT7Cz0UApml3bPiXbTYKgKB4=;
        b=FBA9saGifb9UIEo5IKpkSYOBcYnACup8T3JPY+kMtn0gyrYggLFr9x4KPsbYGbOcDC
         Fx4lBx8Ixe7fftCXtnHSA9yCko8+6kctzRpjoWUNZhq3EBExFaoR0vfl9LiNSfV+6mLm
         lmSAnqFJTRKaULkw05pPYhF/m/GmhD/xdM7jL1+6zZANsNCDNPq2UnxzOqk4SLJzZeLw
         la+6FmLf4Tbxnfv5QrHHbFI06Fp23aqkEw4E5NH6CUMJc0iyhj7NeoFWTNvF6Z0NYBav
         sdnknTGm0Qaay2U7xD0T6LWOcejJ6pWR8/5NXpzM8xoJ23puE02s/Wlqq7NQQroM3AxJ
         Nm4A==
X-Gm-Message-State: ABy/qLZBpGSJ17IoLwc5JRO+bpJ2kN/+qK6vaRVQj7Hi0f9RfCuGwtlh
        bGoB53cdOlquOjaYLkfw4N3qlw==
X-Google-Smtp-Source: APBJJlEHj8jCF+PkdN/BQGzBoi07gP3rBR7YQ7C285CjbtyZLwYfRuqMJGOiSRTSk2SWV3gcvBoynA==
X-Received: by 2002:adf:f044:0:b0:313:efed:9162 with SMTP id t4-20020adff044000000b00313efed9162mr8459155wro.59.1689587407918;
        Mon, 17 Jul 2023 02:50:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r7-20020a5d6947000000b00313fd294d6csm19002391wrw.7.2023.07.17.02.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 02:50:06 -0700 (PDT)
Date:   Mon, 17 Jul 2023 12:50:02 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc:     linux1394-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] firewire: core: put GFP_ATOMIC back in fw_node_create()
Message-ID: <e300faf3-ad5c-4702-a022-128c8c983e21@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This was recently changed from GFP_ATOMIC to GFP_KERNEL, but it
needs to be GFP_ATOMIC so change it back.  The problematic
call tree is:

fw_core_handle_bus_reset() <- spin_lock_irqsave(&card->lock, flags);
-> build_tree()
   -> fw_node_create() <- sleeping allocation

Fixes: 06f45435d985 ("firewire: core: obsolete usage of GFP_ATOMIC at building node tree")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firewire/core-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firewire/core-topology.c b/drivers/firewire/core-topology.c
index 88466b663482..f40c81534381 100644
--- a/drivers/firewire/core-topology.c
+++ b/drivers/firewire/core-topology.c
@@ -101,7 +101,7 @@ static struct fw_node *fw_node_create(u32 sid, int port_count, int color)
 {
 	struct fw_node *node;
 
-	node = kzalloc(struct_size(node, ports, port_count), GFP_KERNEL);
+	node = kzalloc(struct_size(node, ports, port_count), GFP_ATOMIC);
 	if (node == NULL)
 		return NULL;
 
-- 
2.39.2

