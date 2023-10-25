Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E861FC25B47
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 07:22:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbjJYHWd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 03:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjJYHWc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 03:22:32 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C1290
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 00:22:30 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40790b0a224so41694045e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698218549; x=1698823349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hdORY/llP69sRSlv9NhobOQ3dEsflNMyYLviK4glBbA=;
        b=G6/s3sjXYtRjVbYJbZccWnLQ6t14wZueQy3SQytG66Ze51/xQfrc6w964Bnr8paB3M
         LUPqOoWpTCN+jYtrBwAwcA8/8hvgDZ/XYWBF07AhSru2w3Mi+5fx4psGKgAeAyvAtswj
         WwWHvvzv2SDgtOu/EsxyU96Ou6UyOZxcO4SXugBT7QD6sJLLch1V8+vIqGPn4YEkCzK8
         5pTBvxHmqOL51Cco5oDAEiAn5U7cRbeG8u7vHj1siKBItnc0pHukaOyGehWLcE3uUVyi
         GW7OnYls5DL9bDFp8K5M3PkRFzCPi9B1ejd2Sa+gFP0TO7Hi1xJHNBoTpCHWau/h94Al
         mmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698218549; x=1698823349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdORY/llP69sRSlv9NhobOQ3dEsflNMyYLviK4glBbA=;
        b=CQn34l94O5nipLf5qrWqPtvD3LNgtR74ZFUqq6lNOGGziOKVJXtSK8qljIJktEg9Cd
         cV2rohIdFSL0+oe/rcrlqp9FRukLJJTz6ow1iTCFel1xnGF/8OxkbX6YC5B0nqQn4h4M
         xXljCNU/P7pZMRVc5xMgaK120vRYr59kHd5jH+oq1Wfl+xqIwh3GSXQ3z01k4OJmFX1K
         c0X3ZHvo8IFIPcCybfx6htMn+Ifx0LbnzklQ5kQn//O/ivfgjqB7pTEE2n/b2QCo+gpg
         EdD3xEMw2nM95WvPqehW1kAecBS8KbvF50TScogLXCwb/ZqsTAkRyxAyRvjAiqO4djko
         8kLw==
X-Gm-Message-State: AOJu0YzJxaqcFB2iEAIjKoI8Qm2mUos5w+EGH6QZJiJCN0o7syMbQCOV
        wSZUsmDOPz2msoWGUAZuKbem9Q==
X-Google-Smtp-Source: AGHT+IFDYUU9ARNOvmmMv+jUZ9P8USEqwoez5YQ/5UKtUgW6SbWLflZhKazIkdHQzq+NamCRR1EWUg==
X-Received: by 2002:a05:600c:3b90:b0:408:37aa:4766 with SMTP id n16-20020a05600c3b9000b0040837aa4766mr10826498wms.5.1698218548924;
        Wed, 25 Oct 2023 00:22:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c158700b00405718cbeadsm465073wmf.1.2023.10.25.00.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:22:28 -0700 (PDT)
Date:   Wed, 25 Oct 2023 10:22:24 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc:     Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Laurent Fert <laurent.fert@intel.com>,
        kernel-janitors@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] stm class: Fix a double free in
 stm_register_device()
Message-ID: <966465d8-2eef-4292-82b4-58d18f84285e@kadam.mountain>
References: <ddaf5742-931b-4cdd-820b-72808ddf4fdf@moroto.mountain>
 <d2ea6034-738d-4161-a9fb-b2d2b1b134ae@foss.st.com>
 <a06a7839-8ce4-4f7e-9018-eaa03e40b8ee@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a06a7839-8ce4-4f7e-9018-eaa03e40b8ee@kadam.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 24, 2023 at 11:57:05AM +0300, Dan Carpenter wrote:
> On Tue, Oct 24, 2023 at 10:42:48AM +0200, Amelie Delaunay wrote:
> > Hi Dan,
> > 
> > On 10/24/23 07:01, Dan Carpenter wrote:
> > > The put_device(&stm->dev) call will trigger stm_device_release() which
> > > frees "stm" so the vfree(stm) on the next line is a double free.
> > > 
> > > Fixes: 389b6699a2aa ("stm class: Fix stm device initialization order")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >   drivers/hwtracing/stm/core.c | 10 +++++-----
> > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> > > index 534fbefc7f6a..7315f7d3910d 100644
> > > --- a/drivers/hwtracing/stm/core.c
> > > +++ b/drivers/hwtracing/stm/core.c
> > > @@ -868,8 +868,10 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
> > >   		return -ENOMEM;
> > >   	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
> > > -	if (stm->major < 0)
> > > -		goto err_free;
> > > +	if (stm->major < 0) {
> > > +		vfree(stm);
> > > +		return stm->major;
> > 
> > isn't there a use-after-free of stm here?
> > 
> 
> Oh crap.  How did I not catch that before sending...  :(  Sorry!
> Thanks for catching this.  I will investigate my QC process and resend.

The problem is that I run my devel version of Smatch which just prints
and overwhelming amount of nonsense so I missed the bug in the noise.
This isn't the first time this has been an issue.  :(  I've changed my
QC scripts to run the devel version and the released version.

regards,
dan carpenter

