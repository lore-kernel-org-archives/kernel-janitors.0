Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53306C25B48
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Oct 2023 09:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344545AbjJZJEJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Oct 2023 05:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjJZJEI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Oct 2023 05:04:08 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3446810E
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Oct 2023 02:04:06 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-408002b5b9fso4975085e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Oct 2023 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698311044; x=1698915844; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4l+2Rs7C7x9u0N7SLFEtVHo7I01QW3h5/pshwo3pB28=;
        b=BRjTfjNXTHK1C8LkfCGW0ykS2ONoB0nN3Ft8hei9cUQAnmJax9dN4ppJ4YS12ezckb
         60zAqAr6TQYV9Vzh513jOXhQDWTxUsasTDjt/gHDL8Hnl1n1LjJwD843O5OytLrKW17+
         NEjIAcZN84L/iwTI41Yf7c8OkDZUQ00v+mYoOIqJPcW0CdKvNXU6W1hxEaJTq5cBY4jD
         RVKDnMOVmi3gfKZgOwsqeS93YeDuVzO7zvXVJEHUPx63FWXzzZOZBTLRoS+uu2wpuuMm
         DaHSxIzbbBvQJM21ma2USTszgQ56N2bHzmq64WCgaJsPwm1qANSRipFXkxSWqyhHnmLN
         wcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698311044; x=1698915844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4l+2Rs7C7x9u0N7SLFEtVHo7I01QW3h5/pshwo3pB28=;
        b=WHldsYhhw+Z/iInh0G9pKPkwJvJLZWmNpJrrGd9Am4f/s2AfLasaYXxt9wp7ZrONzj
         HCYk1+HlkeOHxpe7dpU91nq/WxHV2zxaYVU0vo4j5BmJkAx8maQ4DuxwcXsOjx5DqoN4
         0Tb9x5/q0UuK7jzf0dvk6M4pW0MG3BUluG8RfPaG8Q2ZcJh02YxlQTVU/uXD0/clcMR8
         eBbgpR6A9EmAAg806aQvCXOP6vClvq+ppe0lCrFaJIuyB+0tDAbi2BGAsB6h1EnneaUn
         KzVsh87K/KSZti6nEHf3EtAdvr0JINIud2RYu6hfh1ZG4oWXhvemvde34IOYdkKos5vA
         EdeQ==
X-Gm-Message-State: AOJu0YzG+aj2GLnTIrscM/HjayoDDi4RkIb/nBc/oBDaQUhQV/brhYd/
        1n9aYvUAmZ0lNRGoV/nPVAqgig==
X-Google-Smtp-Source: AGHT+IG8hSkFGo9COVTu/+5Jxw+21cZ8QP5ccxewFjEgxFfeOWN7uvJ1RwUqTZdRpeNw0xm000OrMA==
X-Received: by 2002:a05:600c:3b0f:b0:406:44e6:c00d with SMTP id m15-20020a05600c3b0f00b0040644e6c00dmr14858423wms.2.1698311044570;
        Thu, 26 Oct 2023 02:04:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f21-20020a05600c43d500b00401bbfb9b2bsm990772wmn.0.2023.10.26.02.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 02:04:04 -0700 (PDT)
Date:   Thu, 26 Oct 2023 12:04:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     lukas@wunner.de, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        daniel@ffwll.ch, tiwai@suse.de, Jim.Qu@amd.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vga_switcheroo: Fix impossible judgment condition
Message-ID: <06e868cb-f96e-46af-9484-a613de0baaaf@kadam.mountain>
References: <4ec2b80b-f042-4abf-b799-0a9ef364f0fa@kadam.mountain>
 <54d21280-6e1e-780c-372d-d630630a4fe9@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54d21280-6e1e-780c-372d-d630630a4fe9@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 26, 2023 at 04:46:29PM +0800, Su Hui wrote:
> On 2023/10/26 12:44, Dan Carpenter wrote:
> > On Thu, Oct 26, 2023 at 10:10:57AM +0800, Su Hui wrote:
> > > 'id' is enum type like unsigned int, so it will never be less than zero.
> > > 
> > > Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
> > > Signed-off-by: Su Hui <suhui@nfschina.com>
> > > ---
> > >   drivers/gpu/vga/vga_switcheroo.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> > > index 365e6ddbe90f..d3064466fd3a 100644
> > > --- a/drivers/gpu/vga/vga_switcheroo.c
> > > +++ b/drivers/gpu/vga/vga_switcheroo.c
> > > @@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
> > >   	mutex_lock(&vgasr_mutex);
> > >   	if (vgasr_priv.active) {
> > >   		id = vgasr_priv.handler->get_client_id(vga_dev);
> > > -		if (id < 0) {
> > > +		if ((int)id < 0) {
> > Hi,
> > 
> > I feel like you're using Smatch?  Which is great!  Fantastic!
> Yep, Smatch helps me  a lot to find these bugs! I really like this excellent
> tool!
> > 
> > Have you built the cross function database?  If you have there is a
> > command that's useful.
> Not yet, bu I want to build this.

Yeah.  It's super useful for kernel development.  It helps to understand
how functions are called and where variables are set etc.  The smatch
documentation is crap, I know.  But I did write a short blog about the
cross function DB.

https://staticthinking.wordpress.com/2023/05/02/the-cross-function-db/

It's simple to build, but it takes a long time.  Just run
smatch_scripts/build_kernel_data.sh

regards,
dan carpenter

