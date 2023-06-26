Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C69EB64DC
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Jun 2023 11:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjFZLyc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Jun 2023 07:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjFZLyb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Jun 2023 07:54:31 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1316F1AA
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 04:54:30 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso942144e87.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 04:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687780468; x=1690372468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mzbsfAVW/IvUsulp52Z/f+T0wKQv09DE5TnrU2EQBo0=;
        b=T1JFYQbUIXDMqFXBqBmXg5ppSuyc12i2Cxt52SXHGQv7Zx8IytZ/rPBk+3xH+8p/tv
         /PlVgF5xH2uFOr8vyy9qCVyMSWyOV2JLGEz3Jqle0aQs0r/WZUI3vPqV4u5PbixKYHC5
         c25bG9XClaRbFgD8jmr1rG1KBDk1kFeX9ld26RCm/8YzvvBJDj4HRLaKtrxYEVajv0fi
         2O2dhkR6KIwyzav46p8IrZAANGdKD4hujmCWmUZIw5VZrRWmZxh2J7UTvakA51zSKvyR
         BQC2HpyWt2zcfj3vBZVnvUZAfAhj3kx/K7UM940WGy2VMkA3uAuf4o5uzGTA8YMVhEks
         YgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687780468; x=1690372468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzbsfAVW/IvUsulp52Z/f+T0wKQv09DE5TnrU2EQBo0=;
        b=RtxXrOWEI7Y3U/CR9Ohb0xKpzxNtv1aeMEgzV7zDuMYJP8D1D7TqbAnmKXnvq1rX9M
         2Cwc3szt3tPy2KoOievmuZbVuuhyWXfkTlZd+p9mcnrHWSqdxbfEj7tQcRAELclcXQJo
         mYCpbPitcdDr13ICu7oCaF0FyQwnrji4OZ8mj42t6f/J1F1EWTxRy7bkz6IlZtVBdXRA
         KewZZ4J9fh64kDKpjuvLUvwi3euB7F6R5dg7sckw4ysGVS1BSHnwbB87yYid4FSFXpVh
         rZs6mBzDYojeAG8s0/ggHZgZ/G9r0VZUX5qLP0YZKy/9a2oA4FZtrVN3fl/qAbJcTYgL
         wQIA==
X-Gm-Message-State: AC+VfDz/vme8CHM/UXszKb4yc6n/kw4A4FzMDtDAP9AnuLoZtyot0jLh
        M2sMXMuIKb2BBP5iNW07kgdQmw==
X-Google-Smtp-Source: ACHHUZ4QnZVWaRB5Kw9Jzs60Z5LqTjflYTlRur4Hullv1h4FjSIi86GCTIp+W/wMgUv2/ntRRg3Dsw==
X-Received: by 2002:a19:7712:0:b0:4f8:752f:371f with SMTP id s18-20020a197712000000b004f8752f371fmr11631829lfc.51.1687780468314;
        Mon, 26 Jun 2023 04:54:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d67c2000000b003127741d7desm7096144wrw.58.2023.06.26.04.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 04:54:26 -0700 (PDT)
Date:   Mon, 26 Jun 2023 14:54:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andi Shyti <andi.shyti@linux.intel.com>
Cc:     Julia Lawall <Julia.Lawall@inria.fr>,
        Zhenyu Wang <zhenyuw@linux.intel.com>, keescook@chromium.org,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 16/26] drm/i915/gvt: use array_size
Message-ID: <16632542-126e-4684-8687-7691b258a1b9@kadam.mountain>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
 <20230623211457.102544-17-Julia.Lawall@inria.fr>
 <ZJlZ3421Whev/LkX@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJlZ3421Whev/LkX@ashyti-mobl2.lan>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 26, 2023 at 11:26:55AM +0200, Andi Shyti wrote:
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> > index 4ec85308379a..df52385ad436 100644
> > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > @@ -1969,14 +1969,16 @@ static struct intel_vgpu_mm *intel_vgpu_create_ggtt_mm(struct intel_vgpu *vgpu)
> >  		return ERR_PTR(-ENOMEM);
> >  	}
> >  
> > -	mm->ggtt_mm.host_ggtt_aperture = vzalloc((vgpu_aperture_sz(vgpu) >> PAGE_SHIFT) * sizeof(u64));
> > +	mm->ggtt_mm.host_ggtt_aperture =
> > +		vzalloc(array_size(vgpu_aperture_sz(vgpu) >> PAGE_SHIFT, sizeof(u64)));
> >  	if (!mm->ggtt_mm.host_ggtt_aperture) {
> >  		vfree(mm->ggtt_mm.virtual_ggtt);
> >  		vgpu_free_mm(mm);
> >  		return ERR_PTR(-ENOMEM);
> >  	}
> >  
> > -	mm->ggtt_mm.host_ggtt_hidden = vzalloc((vgpu_hidden_sz(vgpu) >> PAGE_SHIFT) * sizeof(u64));
> > +	mm->ggtt_mm.host_ggtt_hidden =
> > +		vzalloc(array_size(vgpu_hidden_sz(vgpu) >> PAGE_SHIFT, sizeof(u64)));
> 
> thanks for this patch, but I see an issue here. array_size()
> truncates the allocation to SIZE_MAX, and I'm OK with it.
> 
> The problem is that no error is notified and the user doesn't
> know that a truncation has happened. So that if we save from an
> overflow here, we might encur to an unwanted access later when we
> would start using the array for the size we think is allocated.

SIZE_MAX allocations are guaranteed to fail, so the NULL check
will still return -ENOMEM.

> 
> kmalloc_array(), for example, returns NULL of there is a
> multiplication overflow and I think that's a better behaviour,
> although more drastic.

It's the same either way.

regards,
dan carpenter


