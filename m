Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B24C433B4
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 10:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4FEF61168
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 10:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhDHKxm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Apr 2021 06:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhDHKxl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Apr 2021 06:53:41 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03055C061760
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Apr 2021 03:53:29 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i18so1637924wrm.5
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Apr 2021 03:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OBM1JnxONgzGFkr4ut7M8W7VWeQp4Tx5cMKl44jxVZg=;
        b=W1ie1LtSsXfd8qNPqE0euaZd9TYiLWF93YdHLJFlk4dgw3QvqltUpZfwgk34WS1Rjl
         eXkCtR4qHhLKkIXUOLz7q5SJnIQqelbTt04EH3VAKUvdDdHyxXfnv/n4LBo86MWCXTLF
         E5Y9qJ1JwKzvm8qJ3gJUGUA5YBgk0zTHabC5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OBM1JnxONgzGFkr4ut7M8W7VWeQp4Tx5cMKl44jxVZg=;
        b=EMIwQlbKSroYeLm7k89wcRsBvQyOg4+cE12anHA7oYOw5DOtY54NoySocXJpZYQB+R
         QN6deXcI10ojHzo17TqTeDEJS55KR9aHKIJW0zVvG/AGp3OkShkjak7uwRuCFgzYgjnZ
         yxPYLs8+W/0qQYRdfNRD53oiOX6LbWTROH891tehkAvWGNzZo83EdHDqCzD9uiyf4sI8
         3/55ZPobYcEApzSblaIEJMhXWB0fmvGSUG6kjPi+fq7hLKTDVBaqlP63OpJjh6HZq/2z
         UTtptD8A2gI7J+fU3lU0hr2PbQLZfy26aSiQspkds3penid7pGhj+hOHkm8RcGCcTeRL
         P7ng==
X-Gm-Message-State: AOAM530qqs9stG8moW49+PD3CgeGibymB2VtjalQ/Arjkvq70Ftmk76r
        lspG92IxNEF2mEpvLKzTx29UqQ==
X-Google-Smtp-Source: ABdhPJzoX0pzx4X75LrEk1/KMhWdkeBcpuldBytOXUY2TkaaJgb7rmKP+Jqn1Okk/9gkt635bgOwUg==
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr10204998wrw.331.1617879207815;
        Thu, 08 Apr 2021 03:53:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z1sm28651471wrs.89.2021.04.08.03.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 03:53:27 -0700 (PDT)
Date:   Thu, 8 Apr 2021 12:53:25 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp: fix a memset in zynqmp_dp_train()
Message-ID: <YG7gpWgz/AYIj+Hd@phenom.ffwll.local>
References: <YGLwCBMotnrKZu6P@mwanda>
 <abae16c0-6d76-f78f-133c-0a0d54bc60a9@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abae16c0-6d76-f78f-133c-0a0d54bc60a9@xilinx.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 07, 2021 at 12:17:49PM +0200, Michal Simek wrote:
> 
> 
> On 3/30/21 11:31 AM, Dan Carpenter wrote:
> > The dp->train_set[] for this driver is only two characters, not four so
> > this memsets too much.  Fortunately, this ends up corrupting a struct
> > hole and not anything important.
> > 
> > Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 99158ee67d02..59d1fb017da0 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -866,7 +866,7 @@ static int zynqmp_dp_train(struct zynqmp_dp *dp)
> >  		return ret;
> >  
> >  	zynqmp_dp_write(dp, ZYNQMP_DP_SCRAMBLING_DISABLE, 1);
> > -	memset(dp->train_set, 0, 4);
> > +	memset(dp->train_set, 0, sizeof(dp->train_set));
> >  	ret = zynqmp_dp_link_train_cr(dp);
> >  	if (ret)
> >  		return ret;
> > 
> 
> Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Stuffed into drm-misc-next, thanks.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
