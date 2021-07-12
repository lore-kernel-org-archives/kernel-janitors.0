Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D02C07E9C
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jul 2021 14:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B82B76115B
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jul 2021 14:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234935AbhGLO2e (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jul 2021 10:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234869AbhGLO2d (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jul 2021 10:28:33 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A0EC0613E5
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jul 2021 07:25:44 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id f9so20223340wrq.11
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jul 2021 07:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=lhrZD67b45ok4ysvAU2S6ZIKtsWTYc9YLH5eVabdcKc=;
        b=XGziL+Njv0FnQe3+dd3+FvcAuLySoyuxlEHAkFVYmot6FHU1Nlqn9plIYketzMq7Mb
         Z+TMR0HQk5knJUzSyI5x4GYKWkmiey7SaHdSvkbJNSlNWkTZaAa8CQXmQ3tB8/lVKo4E
         HPrwh9cO0zsmEjhRtftdFrRAY3d6iVSvk+GKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=lhrZD67b45ok4ysvAU2S6ZIKtsWTYc9YLH5eVabdcKc=;
        b=Kro8Sf/qBLFwgvnUERvx2EB0Hrp01GQsY4bHiOsk3ra9C/sD3Kc/mUt7DK0s2y1HS/
         4iTMECylnCdAP7v8QgajVfU9itnhq/NG2x7ZBvuN+nkXms3bmf5q9N8t3cc3AgtWgpC0
         NRaC6AUQWesW9hw0pIg43Ps/OCo8eQ8qD+eTTyWjDnNaYs6p/JgK7orcvbrOEVmAQuLG
         FZlG91GcIdK5SmOpDOnOFcgrMObw96aKy2n2w5+TutTUScM9NNQYWIftwJ7xjjElUqlc
         qGGUehp/1PgNzAADOBHjSuRr7Dt33SQXn1T9g1Otr3cvO9G7oqydI4tyVWiYP2wukeiW
         HWnA==
X-Gm-Message-State: AOAM5334acBsP47z2QGdxEcRpjna3oNAZgbih0BN0cjq4RP45178svfk
        6w/0bSiJ8iScxAGI01YNLqbBbA==
X-Google-Smtp-Source: ABdhPJzl5rlfgjEBCFpPzUHIRJ7G2S/f4rnhKq2fAOpbWSmjhpIFRCWhy5xoPSEiQoX9xSjGlPGeLw==
X-Received: by 2002:adf:ed08:: with SMTP id a8mr26649274wro.375.1626099943574;
        Mon, 12 Jul 2021 07:25:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v21sm9209078wml.5.2021.07.12.07.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 07:25:42 -0700 (PDT)
Date:   Mon, 12 Jul 2021 16:25:41 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        kernel-janitors@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/of: free the right object
Message-ID: <YOxQ5TbkNrqCGBDJ@phenom.ffwll.local>
Mail-Followup-To: Julia Lawall <Julia.Lawall@inria.fr>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        kernel-janitors@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20210709200717.3676376-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709200717.3676376-1-Julia.Lawall@inria.fr>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jul 09, 2021 at 10:07:17PM +0200, Julia Lawall wrote:
> There is no need to free a NULL value.  Instead, free the object
> that is leaking due to the iterator.
> 
> The semantic patch that finds this problem is as follows:
> 
> // <smpl>
> @@
> expression x,e;
> identifier f;
> @@
>  x = f(...);
>  if (x == NULL) {
> 	... when any
> 	    when != x = e
> *	of_node_put(x);
> 	...
>  }
> // </smpl>
> 
> Fixes: 6529007522de ("drm: of: Add drm_of_lvds_get_dual_link_pixel_order")
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied to drm-misc-next, thanks for your patch.

Random rant about this for_each_child_of_node():
- not documented with kerneldoc
- very dangerous since the seemingly correct usage leaks

What we've done here for similar refcounted iterators is a 3 step process:
- iter_init()
- for_each_iter() macro
- iter_fini(), which has to be always called after iter_init and cleans up
  the last reference.

Then it's a lot more obvious that you call iter_fini() when you break out
of a loop. Trying to hide that in the for_each macro is a bit much.

Cheers, Daniel

> 
> ---
>  drivers/gpu/drm/drm_of.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index ca04c34e8251..197c57477344 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -315,7 +315,7 @@ static int drm_of_lvds_get_remote_pixels_type(
>  
>  		remote_port = of_graph_get_remote_port(endpoint);
>  		if (!remote_port) {
> -			of_node_put(remote_port);
> +			of_node_put(endpoint);
>  			return -EPIPE;
>  		}
>  
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
