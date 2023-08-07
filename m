Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297E8C001B0
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Aug 2023 13:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbjHGNCH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Aug 2023 09:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbjHGNCG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Aug 2023 09:02:06 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66CE1BC
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Aug 2023 06:02:04 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so37722005e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Aug 2023 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691413323; x=1692018123;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FpyfDN0eJfDxw+M0r25gq3OoqMM9xi4hx56P+54Pp9g=;
        b=tqzDXiI8OZMqGeDi30tZrTrIMm4sAr8CR7r3GNw8azJFWYk4fdljWuFyz4nHdG1pJZ
         MNoSQAINoB5jmCrh1QmJA2pjNV0vRoX2qXYp4LBBUxbBryTN2nQyHmu0ZYQDBY99oBec
         +YqoTrNG5Bk3/RGlqQAi/wyNVeD6kDKw7W6OiZqSCMQSRm/KWDzHDtTcxkKojxAtjqpk
         lQDUb/iXmx9tLWeIb6ybWXBBIoY0TJv8tQ9zX2LeQcfSypLYaYk0nDXBn2kET2BrIgao
         QA6c7e9eaS1WUis6pnjcHfVId1H4JoKEgO1rvr2MCaSFtdUL3ot7CX80EUnRcTOuEV5b
         /9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691413323; x=1692018123;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpyfDN0eJfDxw+M0r25gq3OoqMM9xi4hx56P+54Pp9g=;
        b=P3WswksV+IDmxZ4w07ttlUZB429SLgnnX6C/UJSlHIHdemLNRHuoV4/Ry95l6VNkam
         p/7DhpxzL+ujUJnQyWDvkOn8tzr2uf9/3JdjhA5G1zMQdBDOeii0Wr/mL2j4aQf4uAX5
         dSTu76mdgXgZyijs3qRn8vA7Td9nKeo9So0wpeeTEluqzbkOB/z+pjoEHR23L6/6MRFn
         K43vAolkXaEKQQ7Pq2jJG/KeSpmbRche0cpNNXA0/4RUbjCEvsc32PDqL5IOU1NIhlKP
         WhtwQtpEMq6NmYeKj18YyzvwgwcjYC+rZ793e6I7AHzkekzmhX+NJGjgWH2d8KfxiJl6
         Puig==
X-Gm-Message-State: AOJu0YyC1cO/zUbakuzGMWTutXUmUzN2mAg0J+y4myKpUylOugmXwZzj
        oT/ebMMXNCVKzQhGqLBNVdnOrw==
X-Google-Smtp-Source: AGHT+IE9xxt35dprXlSxGKthWWSScFtz1rP1Vo++Uz8EQ9YlkYF9+Z7IRPzk0CsRud7BA6OTyf4zCA==
X-Received: by 2002:a05:6000:1203:b0:317:759a:8ca8 with SMTP id e3-20020a056000120300b00317759a8ca8mr5018336wrx.67.1691413321798;
        Mon, 07 Aug 2023 06:02:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a2-20020a5d4d42000000b00317ca89f6c5sm10423456wru.107.2023.08.07.06.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 06:02:01 -0700 (PDT)
Date:   Mon, 7 Aug 2023 16:01:53 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Justin Chen <justin.chen@broadcom.com>
Cc:     Florian Fainelli <florian.fainelli@broadcom.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: bcmasp: Prevent array undereflow in
 bcmasp_netfilt_get_init()
Message-ID: <b3b47b25-01fc-4d9f-a6c3-e037ad4d71d7@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "loc" value comes from the user and it can be negative leading to an
an array underflow when we check "priv->net_filters[loc].claimed".  Fix
this by changing the type to u32.

Fixes: c5d511c49587 ("net: bcmasp: Add support for wake on net filters")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Recent code.  Only needed on net-next.

 drivers/net/ethernet/broadcom/asp2/bcmasp.c | 2 +-
 drivers/net/ethernet/broadcom/asp2/bcmasp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
index eb35ced1c8ba..d63d321f3e7b 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -640,7 +640,7 @@ bool bcmasp_netfilt_check_dup(struct bcmasp_intf *intf,
  * If no more open filters return NULL
  */
 struct bcmasp_net_filter *bcmasp_netfilt_get_init(struct bcmasp_intf *intf,
-						  int loc, bool wake_filter,
+						  u32 loc, bool wake_filter,
 						  bool init)
 {
 	struct bcmasp_net_filter *nfilter = NULL;
diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.h b/drivers/net/ethernet/broadcom/asp2/bcmasp.h
index 6bfcaa7f95a8..5b512f7f5e94 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.h
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.h
@@ -566,7 +566,7 @@ void bcmasp_disable_all_filters(struct bcmasp_intf *intf);
 void bcmasp_core_clock_set_intf(struct bcmasp_intf *intf, bool en);
 
 struct bcmasp_net_filter *bcmasp_netfilt_get_init(struct bcmasp_intf *intf,
-						  int loc, bool wake_filter,
+						  u32 loc, bool wake_filter,
 						  bool init);
 
 bool bcmasp_netfilt_check_dup(struct bcmasp_intf *intf,
-- 
2.39.2

