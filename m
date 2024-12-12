Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60DE20969B
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Dec 2024 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017379; cv=none; b=i57mLanEMyqlDa9n15z42IFySNdpVVDsKa86DoOHGCBGL5M6qdZZvmhK6E9F8Yk1fI0yGYiFPXuI3I8Rjc3trn1RIW0Adm3o0F3NZJSAvLa0yNvIfh9pUuBPDP5Hr6kdGnwEDKnt2r2wB1uFzSKBqHhgqBiCq7/hyULcESvAJkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017379; c=relaxed/simple;
	bh=cO3T9dgduvkZxGXn30oD+wPkEkryxD08Sy8NbQMoMhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFzj096gjFAp0p9A2fQMLbFz7rWvtbcUfpzvXR8vLLLpaMHBvUrVqPHPjBHXePDmyZaEJ9bBWcBYaYfMYfODF8gEh1lmHgnlvMr4dr0g9x+sTOWQGCSoKgtt6DfYi4WhOjwxUjTuIP12odzlbUzbE99mew24yYFgeJCNTm/CVmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=L274nxtG; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="L274nxtG"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e39f43344c5so539760276.1
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Dec 2024 07:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734017374; x=1734622174; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ziTdzSVRBojAh7UOXHpRETilYMYbJPc01s+yNskJcaw=;
        b=L274nxtGs6mw+BsK9bymar9jDd13SAxCiF3MF1+5Qei+MKrlipKliG0qv4FSbxdGKv
         qi4WM3aEYGkHemAw7ZR7lwt8LBW5bGcwCRhzEth8bjSaXA43WO16r5EBqeJkZJGEmNSO
         0rtU3fxWp7m+QpfS5E4cOdp7VU70oxqDDqe8OvXo6vN+ykCXub0Cv27uVOcr9W8J739z
         4U6Mdoir7tRpNIYELbYPL9EnAwkOSN7p/xb2hsy4hczQ8j8TShVO7SA6iG22z60lEi+q
         ywK0fVZKPZEL9Sk9FW8SxlcW+x1rHCQvgk329UV0dsl6rBUBlowxi+cDsNqkuaPTcajp
         AJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017374; x=1734622174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziTdzSVRBojAh7UOXHpRETilYMYbJPc01s+yNskJcaw=;
        b=Jhfmvc+Ud/tS7vGk195GkVrSqwcBLZT2pX72NM7FoH0CpXnq1EceIK4KWPKXY7ZJJU
         tP9MheUTtPPhZUlCiKPpmZ3nNLFuMy/Alpc4RnsaQo9GguZVxvUhq8yssKNPHfiVaBdu
         mgPQ6CeC7LrfIiVoNQN3wB2g0hCNF+woJYfnvk++myCrNIS0Rrt4hxjv+3kP2hTUWQmY
         39xUZoLqmgfAznVzXl0AZViV2/TrkGgPXiiIePxncPljRGdYCHwyMDMi/Efccogs2Nfa
         WAD7gfTlf9n4a8rQGa15ccm1SkkDH+lioD6vOcW8rK1UQohvERa1w/ZrUAFV0TGO5GVo
         AIrA==
X-Forwarded-Encrypted: i=1; AJvYcCVzTgQhiCntxJ/mxBjA4j+tjrMpFmLiTBMyBiH0PdGCsBjmjXqP+wfXF6YjQ3h7/ujCnrKDaQ7Eu1B//ZAvkKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjkMKiA6TdQU0QU9b62YWixbhf3+uCWsV3HwYu6wn8YxyDAisL
	AFoZX6945CiWh/cz4ivIrQ1L9ApqdhJVEPXxL7VtrPWnKcLR3ASY8GNUHDNlMFhlG/HJqySjSJj
	iHsOGH9V0mGo0x4nommXDf05WfQ1vEtomF8o5ww==
X-Gm-Gg: ASbGnctSWy7x1Fgx/bE1hZUNl0rOA/q0OOy/Bu7NTjmtBYiAgXZ9eSS/m8/FfNtXLAn
	ZzfUT2H2bKa67UvXt1J/DKEOaPZ4AZ3jVOwaRFg==
X-Google-Smtp-Source: AGHT+IHSTvaRuk1a2h/8SW5H+X92KkYTlzLgic62LoMhq1Fpy7zQqRHv7pSca18JZvBcyW3l9eExwNR4jPCmNVbk61k=
X-Received: by 2002:a05:6902:118b:b0:e35:dac9:bd5a with SMTP id
 3f1490d57ef6-e41c3620479mr965142276.25.1734017374713; Thu, 12 Dec 2024
 07:29:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b61a81b2-0101-43bd-a4f6-09cf3a016484@stanley.mountain> <CAPY8ntBkQ9PrNx51g+W6TPTLhFjQrTC1vitbV6TVCwq8GUOLwA@mail.gmail.com>
In-Reply-To: <CAPY8ntBkQ9PrNx51g+W6TPTLhFjQrTC1vitbV6TVCwq8GUOLwA@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 15:29:15 +0000
Message-ID: <CAPY8ntDSi5hHWX8fUoiVq93n6bnwu+PVE3JYDxDi=0rGudvm2g@mail.gmail.com>
Subject: Re: [PATCH v2 next] drm/vc4: unlock on error in vc4_hvs_get_fifo_frame_count()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Dec 2024 at 14:33, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> On Thu, 12 Dec 2024 at 12:47, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The default statement is never used in real life.  However, if it were
> > used for some reason then call drm_dev_exit() before returning.
> >
> > Fixes: 8f2fc64773be ("drm/vc4: Fix reading of frame count on GEN5 / Pi4")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Applied to drm-misc-next

> Thanks for the update.
>   Dave
>
> > ---
> > v2: style fixes
> >
> >  drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> > index b42027636c71..4811d794001f 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> > @@ -522,7 +522,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
> >                 break;
> >         default:
> >                 drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
> > -               return 0;
> > +               break;
> >         }
> >
> >         drm_dev_exit(idx);
> > --
> > 2.45.2
> >
