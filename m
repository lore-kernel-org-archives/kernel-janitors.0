Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F930C00A5A
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Jan 2023 06:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjASGvN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Jan 2023 01:51:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjASGvL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Jan 2023 01:51:11 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71DF960489
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Jan 2023 22:51:08 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id i4so223072wrs.9
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Jan 2023 22:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/DJ3YR/mwXkVm0qrVUuOsd9Y6kXfdKw0V70qz6kY7Y=;
        b=oWjvoN1tvRpAXLalnl5XUcf+U5x9IB/KxQRLmYnAWRqbyvKotQ3VFZ7f2NYgFANMkQ
         ZLOVbK93th4rlGbpXhPQr/eozanBSXfR2UCDQbrnhDHiIDk02DU5qi+hbb/INpsesRi1
         eqarEsaOtOGqAQpRh/Be6DVnRCbq8bHITxnoj6Bui2MWNSSO51I4B5b5SB3pjwVqh2VP
         lbIn8ZMXpo9dr+NuALkMULPcnctSHT6KwvpUd9yd33Lt2m1bzRDeSZ2EIADo3LAHKQ7I
         SJYolGzB225SP4nhcqM7G/sEXDXNjQZWuzpRrBCYwkc0/sCf0FSSFGaVP1JYh+EAzCbf
         dXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/DJ3YR/mwXkVm0qrVUuOsd9Y6kXfdKw0V70qz6kY7Y=;
        b=B4VkBAEihD49NyN6O3XAyYojoPeWUuQ5rkWIRnUVjiuJ+o6k3g+hwQVI/QrIX2LlST
         bxhhcTXdKcJSk4rO4ab1gzUhWE6UzYLC7P1K2ubqnlbsfOv9U0XKFU4Xc94ErUPN/eAu
         /dIFXaurMuj/4VNpFqwoXBcTq+tnJ30lJyQUOe5LyIiPlOcQinPDdOYjBu5/f8jKoG3p
         MMpoPAYjgHIrcEqthMCYDB+fDrZoHO5DO0J2WjqAqMWZKur93qQGznIhdiHdgr+9zdHO
         0rsa90zyv/qAFMH6oeJLdlckyUWIaLlWKutApECVysxTlSlwad/RKWZgorbwguVsMH5R
         sRdg==
X-Gm-Message-State: AFqh2kobbJ+ocfaYurzlYQVFCEtLXdw+Slt8awObhzOXUGvL7JGkTbAe
        Tsa5PbQgUtd1tNsJo/e15EtoMVTVyGZFSQ==
X-Google-Smtp-Source: AMrXdXu/drsOiIDYqIqtk4VD/SYcqhjRNNSGa78rS+ww23F5ceyQwyjXKYGJVBrm3hTQq+NrouLc3g==
X-Received: by 2002:a5d:50d0:0:b0:2bd:d9ae:41d4 with SMTP id f16-20020a5d50d0000000b002bdd9ae41d4mr8226240wrt.44.1674111066958;
        Wed, 18 Jan 2023 22:51:06 -0800 (PST)
Received: from [192.168.0.103] ([77.126.105.148])
        by smtp.gmail.com with ESMTPSA id q15-20020adfab0f000000b002bde7999cd6sm15042762wrc.61.2023.01.18.22.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 22:51:06 -0800 (PST)
Message-ID: <cddf991f-cdf0-4054-5d0d-3955403d4f5c@gmail.com>
Date:   Thu, 19 Jan 2023 08:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [bug report] net/mlx5e: kTLS, Add debugfs
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, Gal Pressman <gal@nvidia.com>,
        tariq Toukan <tariqt@nvidia.com>
References: <Y8UhtLhI3fEeRA++@kili>
From:   Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <Y8UhtLhI3fEeRA++@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 16/01/2023 12:06, Dan Carpenter wrote:
> Hello Tariq Toukan,
> 
> The patch 0fedee1ae9ef: "net/mlx5e: kTLS, Add debugfs" from May 3,
> 2022, leads to the following Smatch static checker warning:
> 
> 	drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls_tx.c:897 mlx5e_tls_tx_debugfs_init()
> 	warn: 'tls->debugfs.dfs_tx' is an error pointer or valid
> 
> drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls_tx.c
>      890 static void mlx5e_tls_tx_debugfs_init(struct mlx5e_tls *tls,
>      891                                       struct dentry *dfs_root)
>      892 {
>      893         if (IS_ERR_OR_NULL(dfs_root))
>      894                 return;
>      895
>      896         tls->debugfs.dfs_tx = debugfs_create_dir("tx", dfs_root);
> --> 897         if (!tls->debugfs.dfs_tx)
> 
> This isn't NULL, but also the correct way to write debugsf code is to
> delete the error checking.  There are some exceptions where the driver
> dereferences ->dfs_tx directly to get the inode size or whatever, but it
> doesn't apply in this case.
> 
>      898                 return;
>      899
>      900         debugfs_create_size_t("pool_size", 0400, tls->debugfs.dfs_tx,
>      901                               &tls->tx_pool->size);
>      902 }
> 
> regards,
> dan carpenter

Hi Dan,

Thanks for your report.
We'll analyze and handle soon.

Regards,
Tariq
