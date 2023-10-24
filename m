Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CDBC07545
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 08:57:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbjJXI5V (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 04:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234102AbjJXI5N (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 04:57:13 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3518A10D9
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 01:57:10 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-408425c7c10so35190125e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698137828; x=1698742628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o1HAmH70/geFTRqCb9RHZrirH+PCMEWAn0+VgVFuR2A=;
        b=kbc56PavhA8WGG2rF4+m5RsrzZ+FUnr51UDhLyYe7DFGFfsFZlS0LdZhTq0xgfYi4k
         9OnOMdZWk2ebHcyyHa2XbSCe/hF3jH/2a9tI2vOKujIS9/iOtVD5hLD6t5KHJ50WB/+i
         XaYZh+NLJyWN59CXtGFvna3CONvwr0J06Z1z8jnn74U388tJDQb/xyLv4dU7Bjp5bQly
         NBhiFaQTXCStd69z8uVJSt7EoZzS+JvYLsvLcHM/IQ51qZntv9x2e+6B20MAjVNO8f96
         PyPfaW1PsD43m5nLUOma18r9hum7H2UsdbFnHf85zOyIl5vjxmctqmsAzFFPcwhiflER
         LzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698137828; x=1698742628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1HAmH70/geFTRqCb9RHZrirH+PCMEWAn0+VgVFuR2A=;
        b=tdeBJ7eeOv6HbFIQRUQHJ/URG6sNgGZ08CpLmrsv0DwScStGoXz9DNyyA2SKYOI0Fu
         Euon11pfh7zmS+hcas6b3XFcFyIvPWbyNiOBW4uuvJ6s7MIbafUpJK0x5VDhU2ATRbIl
         l7pG8nz20A9JWn3y4Cj5O7PgzIyOvMrgQoqzNGn+IM7nqhNWS3f3cvPWMJWv0Kopw+KO
         l+LesOtiu8ld1i2G0C5/ljxkXULiWxJ+0tlIcs4oxOvEYS3/17rDme0BlM1Wg4NLC2sK
         /c5pe29ncKiojxAIW+NrTTDyobyzoY2Rg5kGWRJU0O2+/lzmqi4ysjy1XR6XrxUCfsIq
         ZD6A==
X-Gm-Message-State: AOJu0YxrmpcxFs5Lq3StQfBw2mcOvTgZG8Zb5n7iNby/aIvaR4fX31cM
        HD2yDvnMkXS7oo4EOIJBz4YcGA==
X-Google-Smtp-Source: AGHT+IGkAYsKA/HUn8pYOLHaNca+xO7jujkOy2wG6M5LZmaseReMixb0RQFxXNhSsQmm6lKk+pZupQ==
X-Received: by 2002:a05:600c:4f94:b0:408:404b:dc2d with SMTP id n20-20020a05600c4f9400b00408404bdc2dmr9617797wmq.30.1698137828566;
        Tue, 24 Oct 2023 01:57:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x10-20020a05600c21ca00b003feea62440bsm11218241wmj.43.2023.10.24.01.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 01:57:08 -0700 (PDT)
Date:   Tue, 24 Oct 2023 11:57:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc:     Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Laurent Fert <laurent.fert@intel.com>,
        kernel-janitors@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] stm class: Fix a double free in
 stm_register_device()
Message-ID: <a06a7839-8ce4-4f7e-9018-eaa03e40b8ee@kadam.mountain>
References: <ddaf5742-931b-4cdd-820b-72808ddf4fdf@moroto.mountain>
 <d2ea6034-738d-4161-a9fb-b2d2b1b134ae@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2ea6034-738d-4161-a9fb-b2d2b1b134ae@foss.st.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 24, 2023 at 10:42:48AM +0200, Amelie Delaunay wrote:
> Hi Dan,
> 
> On 10/24/23 07:01, Dan Carpenter wrote:
> > The put_device(&stm->dev) call will trigger stm_device_release() which
> > frees "stm" so the vfree(stm) on the next line is a double free.
> > 
> > Fixes: 389b6699a2aa ("stm class: Fix stm device initialization order")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/hwtracing/stm/core.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> > index 534fbefc7f6a..7315f7d3910d 100644
> > --- a/drivers/hwtracing/stm/core.c
> > +++ b/drivers/hwtracing/stm/core.c
> > @@ -868,8 +868,10 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
> >   		return -ENOMEM;
> >   	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
> > -	if (stm->major < 0)
> > -		goto err_free;
> > +	if (stm->major < 0) {
> > +		vfree(stm);
> > +		return stm->major;
> 
> isn't there a use-after-free of stm here?
> 

Oh crap.  How did I not catch that before sending...  :(  Sorry!
Thanks for catching this.  I will investigate my QC process and resend.

regards,
dan carpenter


