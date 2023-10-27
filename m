Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF18AC25B47
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Oct 2023 12:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345823AbjJ0MTK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Oct 2023 08:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345780AbjJ0MTJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Oct 2023 08:19:09 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3966FA
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Oct 2023 05:19:06 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32d81864e3fso1290787f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Oct 2023 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698409145; x=1699013945; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1EzbclxQ3u34ehr5EAcmOA1Z6rmxefKbVbR6r26szvQ=;
        b=XwHhpskL8IMdjxs09mtAzuwbK1DWk5NkdAaXMBzQfz44wgf9HBjsJiY78Xt7NfKjiv
         RKmGfJXZQU0mE75L3DjUvdN3djaXrhQh2YhqS74Zw9YKIvSbbyxBnhnLrXxd8S8kz8Hs
         Z86cF3ReCvLJxpcemdNVhuNuvvTtg1XRl0opkkwzpgKcHv2RzSoBhjUTXpX2+Yum829F
         3iat7ZN5EjG7Jgrj0skU83qs/cxnAIaFVxuifllOv7C4xdSGp7zo+fuTQy4Xtt0IH3hj
         CJnlHmui4fcMmqEFUptAkOP0e615x+oTY8o0EAcFF9r6orNu7S/6DRV6bVjxLrs1oxbk
         lrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698409145; x=1699013945;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1EzbclxQ3u34ehr5EAcmOA1Z6rmxefKbVbR6r26szvQ=;
        b=Ja1EgqIqMQ/lv7CyUZHk1Kedkvfv74UZAKweyldBx0VeGSvoXw4sv4diB2WMZKo0NJ
         u4WeEVeCIJl1SSqpKOdPLQzbxaSmR2p0jW6kZAEqwQ0EdCZe1O6u5TpjxhI8uhW4D8qi
         dCaxRyDvokls5tyxOtGpyPu0Uoc3PmELtDctlQueX7RPfO44HXtAQ3x0SeQrccPwGC+D
         eUbchDDBDtbrXUONQ6k4oBPVPxMpmlbCNmb/KMj8ZSeVkySbchZhw5Nt0i2LX2kGkgFo
         5UPJ7wfg2KXDKLE4Jh4B9IKXpnYiwjZzFzmaK4MpRBx/08HdtV93jl2E1tllEuscoS3y
         iBLA==
X-Gm-Message-State: AOJu0YzcIyZu2gBqkIRz5o2dM7K8DQFfeDDxlDRvxVsZmVquEtUQqpJd
        T1pwTdpsahZ/OcgMZ7PvBTBWsg==
X-Google-Smtp-Source: AGHT+IGaTuV20uSRVXSnwziXt58hhE17/CHwj+ungjmuHjw+I0pFjFq7hF25shZR6uJCilkIM/3gLA==
X-Received: by 2002:a5d:5002:0:b0:32d:88dc:b219 with SMTP id e2-20020a5d5002000000b0032d88dcb219mr2084219wrt.45.1698409144589;
        Fri, 27 Oct 2023 05:19:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r16-20020a5d4950000000b0032d81837433sm1658047wrs.30.2023.10.27.05.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 05:19:04 -0700 (PDT)
Date:   Fri, 27 Oct 2023 15:19:01 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Murali Karicheri <m-karicheri2@ti.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        YueHaibing <yuehaibing@huawei.com>,
        Ziyang Xuan <william.xuanziyang@huawei.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] hsr: Prevent use after free in prp_create_tagged_frame()
Message-ID: <57af1f28-7f57-4a96-bcd3-b7a0f2340845@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The prp_fill_rct() function can fail.  In that situation, it frees the
skb and returns NULL.  Meanwhile on the success path, it returns the
original skb.  So it's straight forward to fix bug by using the returned
value.

Fixes: 451d8123f897 ("net: prp: add packet handling support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/hsr/hsr_forward.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index b71dab630a87..80cdc6f6b34c 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -342,9 +342,7 @@ struct sk_buff *prp_create_tagged_frame(struct hsr_frame_info *frame,
 	skb = skb_copy_expand(frame->skb_std, 0,
 			      skb_tailroom(frame->skb_std) + HSR_HLEN,
 			      GFP_ATOMIC);
-	prp_fill_rct(skb, frame, port);
-
-	return skb;
+	return prp_fill_rct(skb, frame, port);
 }
 
 static void hsr_deliver_master(struct sk_buff *skb, struct net_device *dev,
-- 
2.42.0

