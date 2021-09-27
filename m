Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EFBC433FE
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Sep 2021 08:30:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4C046103B
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Sep 2021 08:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbhI0Ib5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 27 Sep 2021 04:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbhI0Ib5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Sep 2021 04:31:57 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569E8C061575
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Sep 2021 01:30:19 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i4so73854870lfv.4
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Sep 2021 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GA+w/7Fz7pakq81lfEfoU3pvOJjsT/IRnVhcz7mumtU=;
        b=PqTM8Z1XyThr8zP1E88HEWwxMztdEkgS/wFDGnZ2Hs5wm4Uqwe7AIcFdo6m02qfgZu
         YWUws2qQZBc8xVg+76rHPY1oSmoQapqoVDn4mCR98TuaR047XnaAOVaC05kYQ00/NsyJ
         wUYZ8LML2ZCJlQxtglPY5b+XZ1apHJPn4VEJJWHPD+ppNd7MEz/ORS7HJAzBt5nVFyda
         cQVTY/M2rgCJwV7tkNN69UV9v5Gfs9hwq2hFlDfITZFeR7ovUVw+Kt5rHw5PVFnFhOHw
         d3BIyZ7osifz3oXJTFsSQkVBdD+bBpwBe2sBBpAI2nQQiLJ20hNfFzkeLJP+eZuC9DTG
         CwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GA+w/7Fz7pakq81lfEfoU3pvOJjsT/IRnVhcz7mumtU=;
        b=vu9ftHmLRihKYlLXbZoeMwXjYjb6ZiLsVC5ONCtxHavQO58YnWVDDHvsGER8lrRu1r
         /IBsIDRTbQlmc6UbwBDVlhMgt1JfyAKRBctqs5THlgvIuN3bRuZ/zMqPlkvt5TgSYtCG
         eupnd63uLWG85S3rqu3+rIkZsgQclJKwPczrufhDyAOUonJKTYID/kkDLl1zYieYlAnk
         TcyxOwKpOWZ5Uh7iEnNtTU5WTrGPbt1wNYwxBZ2ZOvqiOCXNf+ETcFPPRKJwism+T0F1
         VArH5RHeiP5UQf34yp2XuValHe/JL1o0WBOEVbQQ9dmviLzeUQtbixnd+l5n7fQxwKpy
         YKmg==
X-Gm-Message-State: AOAM530w3yEnlVWkE+ILshoT4Zc+pShc7w00dKlOM4rckS/LLn/q+JfI
        VsI52tKCfpJnDceTBEd/ItyK9iAsMJAUYD3XMMU=
X-Google-Smtp-Source: ABdhPJwYHjyBP7mZhAmpgLhGWAsbaUV7IlU5kun3EgVI7EacBVOexLL13DDFGMMullGRY6HEuHbKqUqQ8T3lZpWCQxM=
X-Received: by 2002:a2e:9901:: with SMTP id v1mr26572450lji.384.1632731417725;
 Mon, 27 Sep 2021 01:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210927081628.GA10186@kili>
In-Reply-To: <20210927081628.GA10186@kili>
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Mon, 27 Sep 2021 10:30:06 +0200
Message-ID: <CAMeQTsaobgz5kc7m+2_xfqzTVd_zF3Ae=Htscc0JjG3B-cdegg@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Fix error code in probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Sep 27, 2021 at 10:16 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The error code is stored in "dev_priv", not "dev".  The "dev" pointer
> isn't initialized yet.
>

Hi Dan,
This is already addressed in:
https://patchwork.kernel.org/project/dri-devel/patch/20210924094040.3631675-1-yangyingliang@huawei.com/

-Patrik

> Fixes: c2f17e60cbe1 ("drm/gma500: Embed struct drm_device in struct drm_psb_private")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/gma500/psb_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 3d036d2a3b29..7a10bb39ef0b 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -454,7 +454,7 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
>         dev_priv = devm_drm_dev_alloc(&pdev->dev, &driver, struct drm_psb_private, dev);
>         if (IS_ERR(dev_priv))
> -               return PTR_ERR(dev);
> +               return PTR_ERR(dev_priv);
>         dev = &dev_priv->dev;
>
>         pci_set_drvdata(pdev, dev);
> --
> 2.20.1
>
