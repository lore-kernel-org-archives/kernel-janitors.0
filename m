Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B86C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Nov 2021 13:18:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235579AbhKWNVQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 Nov 2021 08:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhKWNVP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Nov 2021 08:21:15 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D328C061714
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Nov 2021 05:18:07 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id r11so91993171edd.9
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Nov 2021 05:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mAk8tA976gVRgEzEWN8fO9UK+O6cafDP3k8VmtTgX5w=;
        b=ZlcHuPsPs5XqPHlHybDOmOGrNh0qiyNBwmBCG5MB4Lqj+7XTkXVFtXN/1Bp2RyIIXu
         i48fr4vDpQ+vIVqE+c6N1UQ40mM0uWHN2ittBrl0AoO5M/goOw4ZJ2QQfUvWRym9OxqX
         AKgjmMyVwPBmlb2jbdkmaoP7EHV0XWlYMbVjWdFVA/CZthyt7zN5TU+hfgELnOz8dsyp
         IIxWtVWrwZleqvQeHWT8hJtWtBAasQS3BBvucCsFC5tOvMzCQWyAvpPAD/2+EEYYEQ2H
         GQ7HF8LIupcY1AtE9yZlvnbMKnS59JlhYiF166pcE9BpDVE0rTgRUla0v89TUv2MF+9J
         J1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mAk8tA976gVRgEzEWN8fO9UK+O6cafDP3k8VmtTgX5w=;
        b=aRyQWecHRS+1LnzkxxDYNjfzFDvWmnoTdIIAery2Iv7gk9SqYpiNV/sdb5Xo9bdEZz
         txOYXMQez9iFeNjK4/jJq6muocL8vVRtXiqGnyrzRU2xqwoNx86IFN1hOSmyHqMkaJxc
         U9Xo4orJVyxsJQpciXr3qSMmhVmzSFtmP9wHNi0X7PIqvYyxYmDieRWH9e1LyZwHuUnW
         qw6HgqGEH7gF+2VzlogLCCrSsXRX1ZdmGpFMdV0D7j3FjmGYfVICYgljx5SDRld3UCzM
         dQBg73tpH415OmP/3MgNTYxklngRuN/OsDvwG3FiT8+7/pBl/PQ6r+IO5zrH6AYny16/
         7dYQ==
X-Gm-Message-State: AOAM532S5QEcBzXwWBsxArzKq7hl96rFv9oCMQam/X9g6W87PVnjyCKJ
        L8nykm9Fr4goiaM+B3VCudaxme7oNqTR3u+9KWXHFw==
X-Google-Smtp-Source: ABdhPJx1jOOevAIf0UJxx8KjkdMLGW0E1fCsmiuRs/MXcyhAf3Xb3fawyNskFiVUpVxMyEiX4ns31HM0wPPcYLGnFQs=
X-Received: by 2002:a17:906:1b1b:: with SMTP id o27mr7495723ejg.279.1637673485902;
 Tue, 23 Nov 2021 05:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20211123083620.2366860-1-weiyongjun1@huawei.com>
In-Reply-To: <20211123083620.2366860-1-weiyongjun1@huawei.com>
From:   Etienne Carriere <etienne.carriere@linaro.org>
Date:   Tue, 23 Nov 2021 14:17:54 +0100
Message-ID: <CAN5uoS8_55fCRoUa67LQzWEtLgkf017fESPydht4QV4o_G800A@mail.gmail.com>
Subject: Re: [PATCH -next] firmware: arm_scmi: optee: Fix missing mutex_init()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 23 Nov 2021 at 09:23, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> The driver allocates the mutex but not initialize it.
> Use mutex_init() on it to initialize it correctly.
>
> Fixes: 5f90f189a052 ("firmware: arm_scmi: Add optee transport")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/firmware/arm_scmi/optee.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/firmware/arm_scmi/optee.c b/drivers/firmware/arm_scmi/optee.c
> index d9819b0197ec..901737c9f5f8 100644
> --- a/drivers/firmware/arm_scmi/optee.c
> +++ b/drivers/firmware/arm_scmi/optee.c
> @@ -506,6 +506,7 @@ static int scmi_optee_service_probe(struct device *dev)
>         agent->dev = dev;
>         agent->tee_ctx = tee_ctx;
>         INIT_LIST_HEAD(&agent->channel_list);
> +       mutex_init(&agent->mu);
>
>         ret = get_capabilities(agent);
>         if (ret)
>

`Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>`

Indeed. Thanks for the fix.
Etienne
