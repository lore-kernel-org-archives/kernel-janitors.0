Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C41C433FE
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Oct 2021 23:32:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C3146139E
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Oct 2021 23:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbhJDXel (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 4 Oct 2021 19:34:41 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:56769 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhJDXek (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Oct 2021 19:34:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633390371; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=N0Lm93LT7QNg1MNSBSoacIBhLBmQwpQUMR9ztlqn3eU=;
 b=mN2b4W1nt7RgODuhlCms9LHLPvIrsMNetOgNmkv7HmtDrOotUNh1hwyhZ1NKxKq28exaC8c+
 RQO639JZFBiNYr7U/2DjLrhH1AG4DtskFd//8sduko1I1ir/fcjPCaSkt89CaD9Kk6E5/UAD
 JTOpxHVlE/mpMX/RQpekNblwuhw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5NDExNyIsICJrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 615b8f219ffb413149d60e9f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 23:32:49
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 13845C43617; Mon,  4 Oct 2021 23:32:49 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34CC4C4338F;
        Mon,  4 Oct 2021 23:32:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 04 Oct 2021 16:32:48 -0700
From:   abhinavk@codeaurora.org
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Archit Taneja <architt@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm/disp: fix endian bug in debugfs code
In-Reply-To: <20211004134721.GD11689@kili>
References: <20211004134721.GD11689@kili>
Message-ID: <78c418eef8881553e223fdc39b1e6b84@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2021-10-04 06:47, Dan Carpenter wrote:
> The "vbif->features" is type unsigned long but the debugfs file
> is treating it as a u32 type.  This will work in little endian
> systems, but the correct thing is to change the debugfs to use
> an unsigned long.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> You might wonder why this code has so many casts.  It's required 
> because
> this data is const.  Which is fine because the file is read only.
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> index 21d20373eb8b..e645a886e3c6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> @@ -305,8 +305,8 @@ void dpu_debugfs_vbif_init(struct dpu_kms
> *dpu_kms, struct dentry *debugfs_root)
> 
>  		debugfs_vbif = debugfs_create_dir(vbif_name, entry);
> 
> -		debugfs_create_u32("features", 0600, debugfs_vbif,
> -			(u32 *)&vbif->features);
> +		debugfs_create_ulong("features", 0600, debugfs_vbif,
> +				     (unsigned long *)&vbif->features);
> 
>  		debugfs_create_u32("xin_halt_timeout", 0400, debugfs_vbif,
>  			(u32 *)&vbif->xin_halt_timeout);
