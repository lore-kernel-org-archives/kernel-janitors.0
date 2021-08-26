Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C62C4320A
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Aug 2021 15:19:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD7BF61026
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Aug 2021 15:19:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242928AbhHZPUP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Aug 2021 11:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242890AbhHZPUM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Aug 2021 11:20:12 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D79C061757
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Aug 2021 08:19:25 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id t19so7061312ejr.8
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Aug 2021 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=COuDqpujOoWFpeeNNVgXjqNNoXXP7AkxPAE3chYS1Po=;
        b=JCyUqbkSSAxsyKHlPcDgr7bgu4xmtVHL3mMeRVZeb6qfMKAng357OP/E5hkg9aoStF
         2YJLuXDqu3P8xCXy6icac2IuDQFk7lYkkKSmPtacGNNVUJzsX7GoF7oskqD7a9IZMhUt
         bBjwW7mNnpLivO2nfPB1XMTWgU57F0xkiTWmn7kivQcxk42YyKKAcOVKwgGWgledhc4Y
         BLikzeGRCKF5ZLQDxcTM+THStdh4TYnu6CeTypxB8+0Lf5md2SprTcmKwWta3ec/oXuo
         Od6QcmkFPPgAHpo3rMTggu0bull0Ye8Uz6qc8AX4dSOoLAZsi4cilOcNWTQAqtdqV8rT
         ev5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=COuDqpujOoWFpeeNNVgXjqNNoXXP7AkxPAE3chYS1Po=;
        b=I8KlamjR6npYJpw9udirZxoYfk+wqLGP8skEGJGKmqWK+Bkd1VK1aORNOKJxEIucMm
         aRlmEZnHP8VH2dQ/VrhVPcDVBCEu2zyoQyKy+4Ihlyq2vX+julldX4PR6Lk25FaF2hVO
         VlDkpWwNNOSWpJG7CdcpqoDwFHSUaYuGJEAaEBSc8JE4tTBjyySL108NruSv0/wWK3jc
         Cen7E2/A0fB9JUYyaGWFsAi1bb4QiaZWVWJ5g13j9yYKzCktuj9s3mT2rbrceTKYJnQv
         khUn8wAhWxLB8LGiLHWo5MePj/+yKUBlKwLYmUlPeD7QPzDUSP10jkxulaj9y4MliVpA
         eaOA==
X-Gm-Message-State: AOAM530eYAJkpQdbOZ285r19B0ZMmBLHFR4KS/8/bq5sFyK9nZqjuBgq
        MdjyBlz5k33zvaKPZbPt+O8zAZ/Xwc6dETFSjItaYf5/def9ug==
X-Google-Smtp-Source: ABdhPJyO9KnFCBi21tKMJtf8QVpUf6kS1Qy8yS+zGqz9k+SUvHsTRbFtGWD/dcXGWHJXHIAvJfygTp1FMgk+XX8Vjkw=
X-Received: by 2002:a17:907:785a:: with SMTP id lb26mr4815912ejc.77.1629991163835;
 Thu, 26 Aug 2021 08:19:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:77d4:0:0:0:0:0 with HTTP; Thu, 26 Aug 2021 08:19:22
 -0700 (PDT)
X-Originating-IP: [5.35.24.211]
In-Reply-To: <6d8179f45f7139ecc8172c2d2c4988b943393c1e.camel@perches.com>
References: <20210826120108.12185-1-colin.king@canonical.com> <6d8179f45f7139ecc8172c2d2c4988b943393c1e.camel@perches.com>
From:   Denis Kirjanov <kda@linux-powerpc.org>
Date:   Thu, 26 Aug 2021 18:19:22 +0300
Message-ID: <CAOJe8K1zCRZH-0-+ekDQ5T3mX2cGv1X-gBt1eg4co5HNPP+2vQ@mail.gmail.com>
Subject: Re: [PATCH] cxgb4: clip_tbl: Fix spelling mistake "wont" -> "won't"
To:     Joe Perches <joe@perches.com>
Cc:     Colin King <colin.king@canonical.com>,
        Raju Rangoju <rajur@chelsio.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 8/26/21, Joe Perches <joe@perches.com> wrote:
> On Thu, 2021-08-26 at 13:01 +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There are spelling mistakes in dev_err and dev_info messages. Fix them.
> []
>> diff --git a/drivers/net/ethernet/chelsio/cxgb4/clip_tbl.c
>> b/drivers/net/ethernet/chelsio/cxgb4/clip_tbl.c
> []
>> @@ -120,7 +120,7 @@ int cxgb4_clip_get(const struct net_device *dev, const
>> u32 *lip, u8 v6)
>>  				write_unlock_bh(&ctbl->lock);
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  				dev_err(adap->pdev_dev,
>>  					"CLIP FW cmd failed with error %d, "
>> -					"Connections using %pI6c wont be "
>> +					"Connections using %pI6c won't be "
>>  					"offloaded",
>>  					ret, ce->addr6.sin6_addr.s6_addr);
>>  				return ret;
>> @@ -133,7 +133,7 @@ int cxgb4_clip_get(const struct net_device *dev, const
>> u32 *lip, u8 v6)
>>  	} else {
>>  		write_unlock_bh(&ctbl->lock);
>>  		dev_info(adap->pdev_dev, "CLIP table overflow, "
>> -			 "Connections using %pI6c wont be offloaded",
>> +			 "Connections using %pI6c won't be offloaded",
>>  			 (void *)lip);
>
> This is an unnecessary cast.
> And these could coalesce the format fragments and add newlines too.

and fix the leftover in the comment:
./t4_hw.c:7185:	 * set wont be sent when we are flashing FW.


>
>
>
