Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44748C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Fri, 25 Jun 2021 15:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20CD261864
	for <kernel-janitors@archiver.kernel.org>; Fri, 25 Jun 2021 15:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbhFYPHM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 25 Jun 2021 11:07:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59600 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230172AbhFYPHL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Jun 2021 11:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624633490;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U784+kGQqcCr9NWBnyFTpTP/sKm8NiDEcS8cZIq6yn8=;
        b=S6dIAlSheseIQRfdczSNkQrehkhub4a+OfE1IM3dlZkPOtZTVmZsFe5KoLEy9zNXvnOKIn
        4qdOwl1o/fPGfFHNhAV43KTJbqwTAABszqLyYyHyo/G2RY6npqVAIuSHuFplesNztmtTiW
        jC1g7tVY6WhD+fWW8qHX25AD6Mjx/k0=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-R6whGtjUOPuDJVQ4zqpu7g-1; Fri, 25 Jun 2021 11:04:49 -0400
X-MC-Unique: R6whGtjUOPuDJVQ4zqpu7g-1
Received: by mail-io1-f71.google.com with SMTP id p7-20020a5d8d070000b02904c0978ed194so7171849ioj.10
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Jun 2021 08:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=U784+kGQqcCr9NWBnyFTpTP/sKm8NiDEcS8cZIq6yn8=;
        b=Yt4zAjrkACWFQambViNLhKTDYukTdqA4MFvKsTgZa2W2rmcx6yNc/+nfIx1C4YQ75Q
         0/5pmzhDDAawySu8RfWYf+x+9KG3qsoJo9mnvy3FE0XATeGXFxMvOn2wpZPu7kuzFrP+
         DNVm7EHmGGiMbo5vLTwHggwRSl94XwcYSHeTCwIXA0LD5nOJpqXAt/d87RKkxXbqNGPB
         sazzw+4pVwk7E7AK5n3XD6E03xpJ6U0W0Vb1pmH1eRqySjGHfDdGgl601HH8dgw+wP1k
         SjQpIsar+wtdyNmtEI4w21FSjz+N8af+BE6k8Xa0eGl2vE7wIgQeUzq4o6JmeODboEKG
         7K9A==
X-Gm-Message-State: AOAM530LQYcWdeug4xzeHiWnBQ8S1jOyAL2Z3/lcOFki8G2f2EfEla5a
        /h+a2thi9x+fLqeUsLoFhFvjZw65eHpz3HQyroLLKB+my1yXvBKoIDedGF+6jB2orWcLk0nUful
        PNp0yC70RAoG7j7+Euwj6jpn+c+Od
X-Received: by 2002:a05:6638:22b8:: with SMTP id z24mr9807422jas.45.1624633488179;
        Fri, 25 Jun 2021 08:04:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzHo3Pd4rMQyb88LBoWup/eibouQovuOWOs36nrmVeMMSDgJerkFrYbrEbXTS/xEUTpliAzg==
X-Received: by 2002:a05:6638:22b8:: with SMTP id z24mr9807409jas.45.1624633488077;
        Fri, 25 Jun 2021 08:04:48 -0700 (PDT)
Received: from redhat.com (c-73-14-100-188.hsd1.co.comcast.net. [73.14.100.188])
        by smtp.gmail.com with ESMTPSA id m184sm3393220ioa.17.2021.06.25.08.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 08:04:47 -0700 (PDT)
Date:   Fri, 25 Jun 2021 09:04:46 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Kirti Wankhede <kwankhede@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, kvm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] vfio/mdpy: Fix memory leak of object
 mdev_state->vconfig
Message-ID: <20210625090446.46da71e7.alex.williamson@redhat.com>
In-Reply-To: <20210622183710.28954-1-colin.king@canonical.com>
References: <20210622183710.28954-1-colin.king@canonical.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 22 Jun 2021 19:37:10 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where the call to vfio_register_group_dev fails the error
> return path kfree's mdev_state but not mdev_state->vconfig. Fix this
> by kfree'ing mdev_state->vconfig before returning.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 437e41368c01 ("vfio/mdpy: Convert to use vfio_register_group_dev()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  samples/vfio-mdev/mdpy.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
> index 7e9c9df0f05b..393c9df6f6a0 100644
> --- a/samples/vfio-mdev/mdpy.c
> +++ b/samples/vfio-mdev/mdpy.c
> @@ -261,6 +261,7 @@ static int mdpy_probe(struct mdev_device *mdev)
>  
>  	ret = vfio_register_group_dev(&mdev_state->vdev);
>  	if (ret) {
> +		kfree(mdev_state->vconfig);
>  		kfree(mdev_state);
>  		return ret;
>  	}

Applied to vfio next branch for v5.14, thanks!

Alex

