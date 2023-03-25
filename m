Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6CEC6FD1F
	for <kernel-janitors@archiver.kernel.org>; Sat, 25 Mar 2023 07:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbjCYHiN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 25 Mar 2023 03:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjCYHiM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Mar 2023 03:38:12 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E735267
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Mar 2023 00:38:11 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w9so16286138edc.3
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Mar 2023 00:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679729890;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMe3nqfGwrE4/PQT0itUFqNhZKrKZwY5HyXVUF5KYPQ=;
        b=k8oINqskF5lkI8TAVikmVmYxuUulwhnJuPRP6WLuAatw1JZdRj/ILP5faJvpR7QZlZ
         U8rf4ERn5CSjwl5CY53j2DH4cyalkDiVUN0hymY5hmHp9xFGjcd34ab4u91KUvg/jaWf
         9eI5H02iu8loaI05Zq/34gOY58f+7liblIU1sTaZ0djYU7n8/UOlJAF1igsVhijXaS+h
         hUrlBUTEvuzyKiGX/DcZYkoGqGD6TL3kEGiDy8EH/yM6upxDXcEojok6W3y6DgSU0ztA
         8jjRMDxaxqdbSzHUeV1aqGlge4Z8p/dH6Ns7RHWbgqkjm6yvx39BxHchuGNiprlSsPdA
         DjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679729890;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMe3nqfGwrE4/PQT0itUFqNhZKrKZwY5HyXVUF5KYPQ=;
        b=vwetl0u05ERna/gYhotN8VjFbsXhA0qkTADQ5xLJ06liGq91asxtb9qPPL93jIr06Y
         fRXHZAOmC/7uG6WigVf6xwkP3OIx/RtFIajZAxLtwPRbVVRhvhSdD2Opzl+HSY4LAs4x
         w8Tr48pLePRtj9KF2J99Azs05HY5PTYRAPLpRYBCCCI8UN4zWDfOPSQAatcAZBGbkdm0
         tIi+7VHavJf3HyU10TfgFL6JYJxqiU09lN+2Hy15lFkJ0ZKm5FItEcKPmSktWmTuwVTN
         rvCg0emZTop7aAeQI75Jd9skc8lhhCbtYyOB9Y71Sg85lJor1oM3lf0RqZJa5Wo1mzAM
         HbCw==
X-Gm-Message-State: AAQBX9e6WkdzB/j4PWasBX1EOuQXBTdnbJyr6Oi+mAiCBETZ72W/XTiJ
        FrU0j0UamI6viWwcmq8NdQ00tfulx5Ma0g==
X-Google-Smtp-Source: AKy350amzrvvDAPcJmjT/MW/lArcD+gy9h2O6GdxrW1IilaL7G+wWknN/ARjMzLUyk2nF4x1j8+P/Q==
X-Received: by 2002:a17:906:6144:b0:930:28d6:4581 with SMTP id p4-20020a170906614400b0093028d64581mr5483164ejl.59.1679729889729;
        Sat, 25 Mar 2023 00:38:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709063bc800b0093341746105sm9583752ejf.117.2023.03.25.00.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:38:09 -0700 (PDT)
Date:   Sat, 25 Mar 2023 10:38:04 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     jk@codeconstruct.com.au
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] mctp: Add route input to socket tests
Message-ID: <4ad204f0-94cf-46c5-bdab-49592addf315@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Jeremy Kerr,

The patch 8892c0490779: "mctp: Add route input to socket tests" from
Oct 3, 2021, leads to the following Smatch static checker warning:

	net/mctp/test/route-test.c:357 mctp_test_route_input_sk()
	error: dereferencing freed memory 'skb'

net/mctp/test/route-test.c
    331 static void mctp_test_route_input_sk(struct kunit *test)
    332 {
    333         const struct mctp_route_input_sk_test *params;
    334         struct sk_buff *skb, *skb2;
    335         struct mctp_test_route *rt;
    336         struct mctp_test_dev *dev;
    337         struct socket *sock;
    338         int rc;
    339 
    340         params = test->param_value;
    341 
    342         __mctp_route_test_init(test, &dev, &rt, &sock);
    343 
    344         skb = mctp_test_create_skb_data(&params->hdr, &params->type);
    345         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, skb);
    346 
    347         skb->dev = dev->ndev;
    348         __mctp_cb(skb);
    349 
    350         rc = mctp_route_input(&rt->rt, skb);
                                               ^^^
Freed here.

    351 
    352         if (params->deliver) {
    353                 KUNIT_EXPECT_EQ(test, rc, 0);
    354 
    355                 skb2 = skb_recv_datagram(sock->sk, MSG_DONTWAIT, &rc);
    356                 KUNIT_EXPECT_NOT_ERR_OR_NULL(test, skb2);
--> 357                 KUNIT_EXPECT_EQ(test, skb->len, 1);
                                              ^^^
Use after free.

    358 
    359                 skb_free_datagram(sock->sk, skb2);
    360 
    361         } else {
    362                 KUNIT_EXPECT_NE(test, rc, 0);
    363                 skb2 = skb_recv_datagram(sock->sk, MSG_DONTWAIT, &rc);
    364                 KUNIT_EXPECT_NULL(test, skb2);
    365         }
    366 
    367         __mctp_route_test_fini(test, dev, rt, sock);
    368 }

regards,
dan carpenter
