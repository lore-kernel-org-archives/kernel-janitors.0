Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4D8C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  8 Sep 2021 17:13:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36FBC61158
	for <kernel-janitors@archiver.kernel.org>; Wed,  8 Sep 2021 17:13:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352429AbhIHROV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 8 Sep 2021 13:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352371AbhIHROU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Sep 2021 13:14:20 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C37C061757
        for <kernel-janitors@vger.kernel.org>; Wed,  8 Sep 2021 10:13:12 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id h9so5636066ejs.4
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Sep 2021 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=94RfL+XQJazAGxoDLsJBPk4y2Cmj3BLmNWDabKgbvBo=;
        b=TfRslReoIaZtyNR/fIDuNfW/Da+aBlcZMFJ8/jUAcIzOaBjUQ9S51BuA7yLlCkCUHN
         5IZV+0gS1+GmsJRN9e+KMlb2+9a1jRNm71j0kybuMXGH6USHvFfYSg6i02nMlZH+y7cy
         VDu+QJiW0Gve+5e8j2KclF6rQHzmPc7SvMDpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=94RfL+XQJazAGxoDLsJBPk4y2Cmj3BLmNWDabKgbvBo=;
        b=MzHLYyWH6Ak6HCYYiHe1l78cCj0/YY/4DO7ZrMBg6p9+WvUi967Fo6tSjS20V8QD/c
         /bIEKpROqiMXYnF/Tg/z/ayoc3VovFwcEUWa13fAEctTz4QdziVOtAr9pBb38h3V7Y9Q
         H24ue3RMjxdQFfDb1HuaZLfRnJyMVFRR99e9EmReFaJdaCbS6U6bqgwfpoFEXrEr6bk9
         WSF049Tk6b7y8oisikYKlhHC5oKTPVpAhdbPkUpUkehVHbutdDZQMFb8wwrDwaPc7QO5
         2pLTH6ZeOdPnnah9w0bPxExToZPraEyTZ1HAKrsF+YAV+WAHG7UOJvt5a3ptO9ZuKg6A
         8ANQ==
X-Gm-Message-State: AOAM532lr2+JGttjWWVO6/HkNo0WWXOLQnfCM1gl1hj3jKlE5R4ktigt
        AZKvgpx7fNv//3ptf9+FqGUuJg==
X-Google-Smtp-Source: ABdhPJxBatGiw03lcpCbxiZWOnM2wBapIEG0A8UmwJ2+oLJ4x93tKMCbvGGv2mCJwmWmgOKYGZBisQ==
X-Received: by 2002:a17:906:314e:: with SMTP id e14mr932125eje.165.1631121191251;
        Wed, 08 Sep 2021 10:13:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id qx18sm1324868ejb.75.2021.09.08.10.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 10:13:10 -0700 (PDT)
Date:   Wed, 8 Sep 2021 19:13:08 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Colin King <colin.king@canonical.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/i915: clean up inconsistent indenting
Message-ID: <YTjvJFeMs6+Hi3IR@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210902215737.55570-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902215737.55570-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 02, 2021 at 10:57:37PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a statement that is indented one character too deeply,
> clean this up.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Queued to drm-intel-gt-next, thanks for patch.
-Daniel

> ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index de5f9c86b9a4..aeb324b701ec 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2565,7 +2565,7 @@ __execlists_context_pre_pin(struct intel_context *ce,
>  	if (!__test_and_set_bit(CONTEXT_INIT_BIT, &ce->flags)) {
>  		lrc_init_state(ce, engine, *vaddr);
>  
> -		 __i915_gem_object_flush_map(ce->state->obj, 0, engine->context_size);
> +		__i915_gem_object_flush_map(ce->state->obj, 0, engine->context_size);
>  	}
>  
>  	return 0;
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
