Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A2BC7EE23
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 11:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243227AbjEZLqK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 07:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243047AbjEZLqJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 07:46:09 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E06119
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 04:46:07 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96fbe7fbdd4so110934866b.3
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 04:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685101566; x=1687693566;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8bwapPzIksejMYPOzqAciWFpX9l//k+2i55qcaQ4U84=;
        b=p3WyE9ux4z7bTVG/oB1m/AWwln/iJau/yc6molMdnqw6xkXJYqkuoI1laOAsMHFpRR
         wCcLnR3pP6wY74NBo5me/FTomaeKpRxLxoZb9Ozb/w8LPfB5Ymfv8FmqOtCjnW5k+hiK
         Cvz73iX3brazRkjgGRbiwF50TshODMHl87v9hCVlvc3OBG00dsTzuchR/hqgR80xCDih
         xofXkqQRKXBss+g1xUgqmMWLe3uEIUxNoRrupxnJuk0pOIJcuOBxDnNgLhOg7hZPXudR
         AKcJjF8Vnaa9CQXbHbSmpQPBGWgw+hoZxlCvXocRBmmvhYw3mnsoI7DqtYrCTwUKPdZn
         SdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685101566; x=1687693566;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bwapPzIksejMYPOzqAciWFpX9l//k+2i55qcaQ4U84=;
        b=ct30U4yOZYASjV6tswG9Lck0k/xzP/zO2xx+yN5SlnVPpNStlK1UpxqL+99FhND2FQ
         5i7ihQhQ+kwnJai22pt4uOxdKMU206lY9bSKJ8tMFUUDtIdZvCs39visprHLDQATDr+u
         NK5mI6eXtXLruayS1hRIPfJrIGpkqi8Rz+CV65gzpTdKoTIXZzhz2TSksh3nJQ1421uj
         OyX+j1tj0ImverjAwCPWX7T6l212sdUutiN27knL1f2DarL68+URbFBLOpB7+Su7q1rQ
         dGWZyW5IvAGLG2bXI31TmePZAfi6ToAprAVmnzlNvIPQqSWgTVzAfYefXdaju1GXKAdU
         lBBQ==
X-Gm-Message-State: AC+VfDy4Cmx4lnbJ7enJdaQK+4z1SEeXVSB+G9119CBXFDQ8AM4ucSd7
        LZd8P7C3RA9wcJvsMRDWnSI+VQ==
X-Google-Smtp-Source: ACHHUZ73fSEuuH8M5GmwuCqDSX4tpkKYV/d7ZDsczAlnmbtNwJzOzfpLbhQJlSBHzvq+mLdAJUA5OA==
X-Received: by 2002:a17:907:6da7:b0:962:9ffa:be02 with SMTP id sb39-20020a1709076da700b009629ffabe02mr1835688ejc.36.1685101566472;
        Fri, 26 May 2023 04:46:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id le8-20020a170907170800b0096f803afbe3sm2079506ejc.66.2023.05.26.04.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 04:46:05 -0700 (PDT)
Date:   Fri, 26 May 2023 14:46:02 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     David Howells <dhowells@redhat.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Jiri Benc <jbenc@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: fix signedness bug in skb_splice_from_iter()
Message-ID: <99284df8-9190-4deb-ad7c-c0557614a1c8@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "len" variable needs to be signed for the error handling to work
correctly.

Fixes: 2e910b95329c ("net: Add a function to splice pages into an skbuff for MSG_SPLICE_PAGES")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/core/skbuff.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 653abd8a6975..57a8ba81ab39 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6932,7 +6932,8 @@ ssize_t skb_splice_from_iter(struct sk_buff *skb, struct iov_iter *iter,
 
 	while (iter->count > 0) {
 		ssize_t space, nr;
-		size_t off, len;
+		ssize_t len;
+		size_t off;
 
 		ret = -EMSGSIZE;
 		space = frag_limit - skb_shinfo(skb)->nr_frags;
-- 
2.39.2

