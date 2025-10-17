Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D31F2C21D4
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Oct 2025 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719385; cv=none; b=az32tokLeG5y1CNaK8Yb7X96nUJpbSYYTp8NmvQh4ydN8S3J+Qg9N1D5UFKe+JVApwcKGocuakGHMqbOUve8Sw7msksDXXV23NUGRH7jcILzEAvItkSxWEnzjF4OQWEuqqPFpDpsM3ZEyZHAzv81Ii0qcpzX5J8KNXWEsl8GO8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719385; c=relaxed/simple;
	bh=Q3sAr5IgC4u/2uxZQzODES4J6Xqsz5aUfWZySpoCpzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZom+bhAjRMV61r7Z0Vddh7UHpsjAela1GJmGSl5RGsR+HNNtwRzQcAkN+vBykbpoTF62ECE2se2IMlLYcFeWH4v0/EyAzxNq3KrH1zVc/iRCAaN86RWdB6lF69n2UGnI7Djyy/ni7qAgvkDK2dRzPALpeHczPiE1KuYx3LXJI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eYM79maS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eYM79maS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso957581f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Oct 2025 09:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760719382; x=1761324182; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G6gCBpn1xaSdsDN3kuu/6RChT6cW/pr078XU7axphUc=;
        b=eYM79maSRCBjK3X69Aak89HAGLyGmO5tFGeRxbudnCUoqiHLn47/ZgoJJz/sxzByU0
         cyF3ahES36u7PjReT/xnXVNrlyhxv66bhAHl8U0TsV9hl1xz1DOQIrEiUVM69SzlWV5o
         psV0cIdUxSbBkXS9TLBTJdmUlGHq15XYzG2/9nzuCGeKaIcV7ZiaqkNWtOr9GzCwbhu0
         sEj5zJhEq+/StU6RrMIBVOUi8A0C8QkuZClbZN2cidG0+IAEJaof/N9bbIOekXmVJv0E
         oAe+E7AO8vKi+xu0+kP9/+mZAgpbFAzocnC8XLigY2apL7RwlZECy0L/Il6MsegCRPbQ
         gHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760719382; x=1761324182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6gCBpn1xaSdsDN3kuu/6RChT6cW/pr078XU7axphUc=;
        b=DppXqbQFhT5kZNPefxo/Q/7lSrNIFQ0K3jGqtxE/hIbvfp1vu0ztLl9ySGgRS6V5/A
         Rg5OW3ls66Pnj4RM9TiPdFf2wt1kqcAlVHpA+4J416vUxZ4ywDV5xmXLRHro/stql/S3
         G32NlhcBaZiLU9Q9A+RBR9xjyvdUxa5Uj5uA6uHpd4u/LKt84V6fr/bg01xyN7XbQ5OI
         asI9VRKiTtaw11DFBgC4SOISFSKRsRFESSx6mVDOSTS2k2GnMni9jz2CgYA82+SWYFLP
         hE0q85tD1iBvUQ7LqcB7RVAdxZdz2zJNc9yXaeQtE5VV54AMpB69XaOBDfQ+saAt3Xw1
         u3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUb02hFXBw/AyHPwkB+RAFjl3Fv7rAZofRNxU5zK4WujZkBIKSkVxlURwkd+wnDVCpR1jNsRahoQHFfHms1p/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzT0XskAxlY5n3zGxHMMK0btZNRHtNLiXZB/43HdCc0Z2E6xjg
	5Nk291dEe7tH5XGJNkFC2K5nIjh37D34W40C6Sk2vaIVDjVr3qWESldNS0GEoP/rP+w=
X-Gm-Gg: ASbGncvSfA9drmdeNLqUy5kPEuBRnFpJk+BH91AxEdGWTf2oPqvhAfvodzirY6Tk7Fx
	TbzOf1eL7+UNSqonc4TWKB3M2QxUD2PPZZEQNT040uBRGM5CylFYyhmwjqfaHwGlkKOLFGam8lO
	GEYYp/Mv+fnkq/AY1LY+gtA536MRtd1hn1wAptsNkaae1t5wUTub5KY2Qj6c+YvMlA76P388HLs
	YbkTmWYwlvuggOm5oELGErjyum2z7b+nbf0wv9AmSBmGvX47yYAPvMsOqqGIjDFauhtvQxtLOZ2
	ajkyU2lfjMdbaRmSnJNNnXn0hKdIxaRV2YifcuAjyoblpZpaeXvimtTEUQnUPZkBP27PK7RTW7w
	Nvjv2ygYs0Zs93tz6p5v/w8Q8WxuoT6Zg4o7u2frRDXmi64IAl9zmGljsApHYUaLHQriRGnalfN
	B5nRoV3UD7ECCdf3rp
X-Google-Smtp-Source: AGHT+IGMBA0qJ4gxpjjM3xG9IuatY3oWeNvAk3ViyCHo+q3HrYjHTp52+8ZLn0SPVSWIlQ60ex3wqw==
X-Received: by 2002:a5d:5d08:0:b0:427:a34:648c with SMTP id ffacd0b85a97d-4270a34652cmr1088821f8f.58.1760719381734;
        Fri, 17 Oct 2025 09:43:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ce06bsm76237f8f.45.2025.10.17.09.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:43:01 -0700 (PDT)
Date: Fri, 17 Oct 2025 19:42:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/sysfb: Fix a NULL vs IS_ERR() bug
Message-ID: <aPJyEMWmWpWkcQvE@stanley.mountain>
References: <aPJo1W5Dl4rmGX_P@stanley.mountain>
 <aPJrs7_u8KcalNsC@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPJrs7_u8KcalNsC@intel.com>

On Fri, Oct 17, 2025 at 07:15:47PM +0300, Ville Syrjälä wrote:
> On Fri, Oct 17, 2025 at 07:03:33PM +0300, Dan Carpenter wrote:
> > The drm_atomic_get_crtc_state() function never returns NULL, it returns
> > error pointers.  Update the error checking to match.
> > 
> > Fixes: cb71de092553 ("drm/sysfb: Lookup blit function during atomic check")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> > index 8517c490e815..d2c4d8f3d4d0 100644
> > --- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> > +++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> > @@ -259,7 +259,7 @@ int drm_sysfb_plane_helper_begin_fb_access(struct drm_plane *plane,
> >  	ret = -EINVAL;
> >  
> >  	crtc_state = drm_atomic_get_crtc_state(plane_state->state, plane_state->crtc);
> 
> Looking at where this gets called, that should be
> drm_atomic_get_new_crtc_state(). Either that or the
> code is more seriously borked.
> 

I can't comment on that.  Let's drop this patch and instead (probably
I guess?) change it to drm_atomic_get_new_crtc_state().

regards,
dan carpenter

