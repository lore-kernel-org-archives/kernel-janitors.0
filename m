Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9903C433ED
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Apr 2021 21:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C70161260
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Apr 2021 21:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242977AbhDFVNu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Apr 2021 17:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40374 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241654AbhDFVNt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Apr 2021 17:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617743620;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n0hWxJLVmdsricryI3Rst9nD37DLk4CPYNA3q9HyKGA=;
        b=U/LxtqZ6aWK8FrKlCHVfYDuT4hypRZlHVOXk+IwPdyV/gXrGQSiOqd6US3fHB4ZKZ8Ceo6
        IBTxlNKoPwxHG3dYDM9nPj2uFSfK/G1ygKF4bJDl4paKONjThOVKL5moP0jfbkegWz8WOH
        xZIr7XM7UsCswOVV/6haPJXfQLetKzc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-iUN6MgDFPYOXR2ArXQllsg-1; Tue, 06 Apr 2021 17:13:39 -0400
X-MC-Unique: iUN6MgDFPYOXR2ArXQllsg-1
Received: by mail-qt1-f197.google.com with SMTP id w2so10911648qts.18
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Apr 2021 14:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n0hWxJLVmdsricryI3Rst9nD37DLk4CPYNA3q9HyKGA=;
        b=FMdKKXydO5vdnFuvmfF76ca6FTzqdhQYhUY6TYMEPYHyOJRNjEJEWfJlAAyF10D0sJ
         +Gt9bPfJwnmbkNVy0t81cxua37LdNbzHFmbRx6Ga4HJE9ZSRD7US5VuFMiXvTGH2Ql4Z
         tomDth/k5TVh1fl4BSFLxATYjcLEybPG98J20KGF8X0vvwYrU+73t9xUdSNIebW+hnPu
         jUtcr0vNTW7nvqGZNVu1Z/s2ljNunUGUsccRDnUHAbFDktgOf+70PhYShMa/Azu7eBti
         hmNKs0Jf5X6HkYIppCX3Hqbw/3SUcmlLov/lTelswIobrNoTVSpUqfDw5y7f1Zbas3R+
         S8KQ==
X-Gm-Message-State: AOAM532VHDq4nm43kYR8GX72iFaooFagL2Gmj4yDZ5fGUxEl/Un5dL5h
        cJapviL7vxmmQ3VUoJZ6cX6Y5/DjgxBVwDVaxyb06I80nJYCsuofR0ZcfJAve+LmNjmOsQK6d4b
        l7lCcw67q+NNvlXX0a10UjTtGMJrI
X-Received: by 2002:ac8:6c57:: with SMTP id z23mr14454876qtu.155.1617743618663;
        Tue, 06 Apr 2021 14:13:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvIEKe5NEFfjLI+xWqaKNhUTCtlcBMeB9iljRNEmRUAfwEbQMtz5cIl77hzWbFWgBhB1CLLA==
X-Received: by 2002:ac8:6c57:: with SMTP id z23mr14454854qtu.155.1617743618434;
        Tue, 06 Apr 2021 14:13:38 -0700 (PDT)
Received: from loberhel7laptop ([2600:6c64:4e7f:cee0:ccad:a4ca:9a69:d8bc])
        by smtp.gmail.com with ESMTPSA id a10sm16963948qkh.122.2021.04.06.14.13.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Apr 2021 14:13:37 -0700 (PDT)
Message-ID: <fe8cdf3bede40b46716bf94b0760db6d47a13187.camel@redhat.com>
Subject: Re: [PATCH][next] net/mlx5: Fix bit-wise and with zero
From:   Laurence Oberman <loberman@redhat.com>
To:     Colin King <colin.king@canonical.com>,
        Boris Pismenny <borisp@nvidia.com>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Raed Salem <raeds@nvidia.com>, Huy Nguyen <huyn@mellanox.com>,
        netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 06 Apr 2021 17:13:36 -0400
In-Reply-To: <20210406165346.430535-1-colin.king@canonical.com>
References: <20210406165346.430535-1-colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 2021-04-06 at 17:53 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The bit-wise and of the action field with
> MLX5_ACCEL_ESP_ACTION_DECRYPT
> is incorrect as MLX5_ACCEL_ESP_ACTION_DECRYPT is zero and not
> intended
> to be a bit-flag. Fix this by using the == operator as was originally
> intended.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: 7dfee4b1d79e ("net/mlx5: IPsec, Refactor SA handle creation
> and destruction")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/fpga/ipsec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fpga/ipsec.c
> b/drivers/net/ethernet/mellanox/mlx5/core/fpga/ipsec.c
> index d43a05e77f67..0b19293cdd74 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/fpga/ipsec.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/fpga/ipsec.c
> @@ -850,7 +850,7 @@ mlx5_fpga_ipsec_release_sa_ctx(struct
> mlx5_fpga_ipsec_sa_ctx *sa_ctx)
>  		return;
>  	}
>  
> -	if (sa_ctx->fpga_xfrm->accel_xfrm.attrs.action &
> +	if (sa_ctx->fpga_xfrm->accel_xfrm.attrs.action ==
>  	    MLX5_ACCEL_ESP_ACTION_DECRYPT)
>  		ida_free(&fipsec->halloc, sa_ctx->sa_handle);
>  

Looks correct to me with enum mlx5_accel_esp_action action;

Reviewed-by Laurence Oberman <loberman@redhat.com>

