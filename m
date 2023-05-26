Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBFBC77B73
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 13:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243629AbjEZNjZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 09:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbjEZNjY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 09:39:24 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B0DF3
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 06:39:23 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-307d58b3efbso480207f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685108361; x=1687700361;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQe4D67cLwl8q+STJZyTgJruFga6QG8sQ8P+KxpYejc=;
        b=jc7V1YMBetwGSRvkKFZ+6dh8gJrr5wiQWRWwN8i3KAl27iedIHi+G+Bo1SclUN2ICY
         cqNx6JxMG4d31ML3G4MnsjjmN93dk234eFpRf3y2aXAMZd6X+WLFqBbGSd/cAmTJ4msq
         WnDrzQTLsrFINzP71zxQ6u+oUeYusxOoQW6olGTTqqiXP9UrJQuctZ3c9MsZhzSakHM0
         xqxfHzkwoVejRegr4S4uAdPcgTRsF5awHoo0A647hCiMe1jH0FhsnOlY//jkbTSLtTLG
         aBRxwRYI8qbFrQ5FqRPqAiVvipEkWQjhbXEVBBWqlZleXvtmYzxrGdLjoemJIKxPihkH
         l8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685108361; x=1687700361;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQe4D67cLwl8q+STJZyTgJruFga6QG8sQ8P+KxpYejc=;
        b=B4Y0HQOZAd1HbQggnMHauvDkyFVdkm8pyHceR11HAEUbfZyTUAIf1Cs1Pwx6gvIGw/
         PYhQ2ctIaDVYOtHmQVCHwyLc98uejPElErvrQsshfaMv3YAL6JVbZQVEYI2bWWigGgCs
         yP0SVjSSYgfuv3uucm7Vo0CMNHhBD1DFbtR2QCIeYAj92izRd217qbwXwf1V1n7FgEcT
         iAMLxjwZ2E1ffPv8sOw2uave1knihktAB8vDaw2/qXsWCxAKq7D5egoa2nkgJZaEBtXK
         2afloKC9cPfkz2uj8yTBGH/7JvbB/JMbxsuqQVtA/tHuUFHrCQ0Zsq8t8CwogERnwyUX
         GnfA==
X-Gm-Message-State: AC+VfDwH3MBOnMKrSd4LH79n4nWJ1Z/3smMRjYe1EDbqGug1wOM+arj6
        iDqfCH5XohY2x7E1FRxCuen3iA==
X-Google-Smtp-Source: ACHHUZ567Rfv8QITDsWSQhkOFgWyFK5JKKFtFu5uduajc0RdjdJBTa5ULiFPBK1LMD77u6Y+hEJFrQ==
X-Received: by 2002:adf:e8cc:0:b0:309:419b:925d with SMTP id k12-20020adfe8cc000000b00309419b925dmr1549281wrn.70.1685108361469;
        Fri, 26 May 2023 06:39:21 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a16-20020a5d4d50000000b003047ea78b42sm5185266wru.43.2023.05.26.06.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 06:39:18 -0700 (PDT)
Date:   Fri, 26 May 2023 16:39:15 +0300
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
Subject: [PATCH net-next v2] net: fix signedness bug in skb_splice_from_iter()
Message-ID: <366861a7-87c8-4bbf-9101-69dd41021d07@kili.mountain>
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
v2: tidy up a style mistake in v1.

 net/core/skbuff.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 653abd8a6975..7c4338221b17 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6931,8 +6931,8 @@ ssize_t skb_splice_from_iter(struct sk_buff *skb, struct iov_iter *iter,
 	unsigned int i;
 
 	while (iter->count > 0) {
-		ssize_t space, nr;
-		size_t off, len;
+		ssize_t space, nr, len;
+		size_t off;
 
 		ret = -EMSGSIZE;
 		space = frag_limit - skb_shinfo(skb)->nr_frags;
-- 
2.39.2

