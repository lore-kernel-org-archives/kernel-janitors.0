Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18EF4F0531
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737524; cv=none; b=iurnaHjVi1tuaoYaGxV+q31uHYIVrI5dLRwur8bsznsqeo+9Gu+barcmKH4sDQdltSAhOCYOOvZdIuxKSm0j+9KweJbC/prLSm9xGDyQGKKgb9pg58+H4lkw58+s973qUZm0a4iYMmSSfu1v0QnNigzAIIuZ3pCwqqlgF0hRdkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737524; c=relaxed/simple;
	bh=MXMecSS5un1Vw5RPUBhc/MQTR/N1uDtr5TFfUDNnDkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJE9dlkLBEIGswWdXDizW1MsDlUjK9SxWVkbg/8EYvagg5Y2o7vs4i1AawF3ZiznBlgGoqMx5XzF9KtTVey3YfndFKRnOEMRPPzAbh1MHN7P9+PPNrG8xamm/ubRdj29U0u4J6yfTlXatxPg95dlOkom/BANs4havEMdssR1MUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMp35hXi; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMp35hXi"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so4582655e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 06:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737519; x=1790342319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FSYhKatlju631s2mF43cFtG3PZ8R0OZ445m3aP3hlTo=;
        b=SMp35hXiJaeVNxYiS6HIgTgEB/vqI1gkvKZ56xzpON6sbNsdZriJw+qSAgJ3MRE77i
         QudT/8aAVob0I/o06oGLP1KdduYUkzMv9TzJgqw+ua2H1ZS5kEbvxdyjmOW0thayeBGN
         PwXhOg2FqNZaAs/HQTmG6QIi/Ag1ma56Hr3aJ9wVb8vKLo0hj3xKcxqu0C2bcM5UTxRp
         SvSLsuj2+kyqHPuHW6eX0L3VWcB2kGshWm6ki3LNZ52lb05hZslT/5RKGiKOBlD37BuM
         s/MhhDs7/Y4hWSd4GC+hWI5iQK8XV5qULBYcnesbbyceJjZ22PsvgQozbJlRflDIDV/M
         pa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737519; x=1790342319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSYhKatlju631s2mF43cFtG3PZ8R0OZ445m3aP3hlTo=;
        b=gW51eWvyGlZcL+Uj3tY/5PaJMTXqtTxhaU1zDvztcGiI2aTm9YXvWwOEWSgB65dmOc
         kNUGspqO2BXqffXY1m7AF9ocvZC30+CUwDcisjpu5pmssZu37CuxOKMljZNa6oxKhrzs
         QAf92D7G+pyJU+COtT6/X150AU12lvx6FrbdYMXXyujuL39gfT45CLt3njIoEv2HTMQV
         0+JtVn1ZAK5ChNEhYW+dgLn97dVGBtVx5LDHB9suIeyKvX5cHE5kmMKOUhazkix9+PJq
         epaC3ZkdJ2E1zArMF0IYPip+m1+bSiX47P/uUTc/eiOKHdq45/TBOvef7BjETyT1uddF
         2dLw==
X-Forwarded-Encrypted: i=1; AKwUvBzknQGHvxEkxsvHXafeuWB3rIvjT86g2Hkz0Vef2D4gpay6OdZRgaSV/GOG8wZNSNwZiYXBYShiMh1+5QEl7c8=@vger.kernel.org
X-Gm-Message-State: AFuF++nqqdHFVYjzCGnpKsWgYEiWZvrbDzE/jmLEYU+b0Q0Yyyvw4w6s
	jb1KW39Y7zZN1Qjqkp99nSesjAwQkw12FBpNDnc99x6lyd2HFzBzYDTE1MLei9uV5qLdUA==
X-Gm-Gg: AYBFou2gj17tzHlpK0BW3LIEIp5DhCjkYbDSDadz4tVhUC0NYh8bdtqwSIMlUKm3kwh
	v2tPUEmhrUlFJLfCGJK8Gcujkvx0iX1VIpvOInvDbrcmroudIBP/eComwaDFPqq5qHBes6jf/HX
	qvJL4oPN/W6UBJUzjDY5TLE2YnvAA3jjY5qBdX85X5rPMisGtq0YwtGj1vQqv7EfD3Urm3KQEtK
	NduqkXad70aI4B+UeCfF5aIkPcgkBG9mK4I7kMSQx6CSSAHJnIv1WcWEeUg+kyShVekPSHk131t
	PpU2k8Kx4EHU3ZODAb3TrPK8b9DLHX6Zzc1zpDOTUE5cOUBFWBpmP6PIRfL1jGQcjD0e3GIQYk4
	tL5/S1UasWzxVIlbohdTwwYm/lE+njcDIJRGxouLEb2iPC8uR+t0n0/qoESQWHsClFxJXuWmFEF
	KsmQ2Y3q/Lm5VSCObYo3JP4dLj6XPbeCOa/rY2hSL0ZGvVZi0XuNADnfVwAgGxJwLKA0Hx
X-Received: by 2002:a05:600c:548c:b0:49e:6e7c:d895 with SMTP id 5b1f17b1804b1-49fc584fee0mr32705835e9.26.1789737518934;
        Fri, 18 Sep 2026 06:18:38 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008fe3csm4156879f8f.37.2026.09.18.06.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:18:38 -0700 (PDT)
Date: Fri, 18 Sep 2026 16:18:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in
 uvc_mapping_get_menu_value()
Message-ID: <aq06Kq-3n2R79YZL@stanley.mountain>
References: <aq0siVcghDe6x9cs@stanley.mountain>
 <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>

On Fri, Sep 18, 2026 at 02:59:29PM +0200, Ricardo Ribalda wrote:
> Hi Dan
> 
> I believe that for all the uses of uvc_mapping_get_menu_value we are
> already doing bound checks:
> 
> index >= BITS_PER_TYPE(mapping->menu_mask) in uvc_query_v4l2_menu()
> value> fls(mapping->menu_mask) -1 in uvc_ctrl_clamp()
> BIT(i) <= mapping->menu_mask in uvc_menu_to_v4l2_menu()
>

The problematic caller is uvc_set_le_value().

	value = *(s32 *)v4l2_in;

Smatch thinks that is called from uvc_mapping_set_xctrl_compound().

drivers/media/usb/uvc/uvc_ctrl.c
  2772          data = memdup_user(xctrl->ptr, size);
  2773          if (IS_ERR(data))
  2774                  return PTR_ERR(data);
  2775  
  2776          return mapping->set(mapping, size, data,
  2777                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));

But maybe that mapping->set can't point to uvc_set_le_value.

> In any case, I think this patch is still worthwhile. It will help us
> avoiding bugs in the future (have you found this with a new test for
> smatch?)
> and if we go that way it is probably a good idea to also "fix"
> uvc_mapping_get_menu_name()
> 
> 
> On Fri, 18 Sept 2026 at 14:20, Dan Carpenter <error27@gmail.com> wrote:
> >
> > The "idx" value is a user controlled u32 so we have to bounds check it
> > before calling test_bit() to avoid reading beyond the end of the bitmap.
> Maybe change the commit message as well to avoid stable cherry picking
> it blindly (sorry seems like I am more picky than usual  :) )
> 

I mean if uvc_set_le_value() turns out not to be a bug then, of course.

> >
> > Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
> I believe this should be:
> Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
> or no Fixes at all.
> 
> 
> 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 3ca108b83f1d..f157ed99be4e 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -538,7 +538,7 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
> >  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
> >                                       u32 idx)
> >  {
> > -       if (!test_bit(idx, &mapping->menu_mask))
> > +       if (idx >= BITS_PER_LONG || !test_bit(idx, &mapping->menu_mask))
> >                 return -EINVAL;
> 
> What about using BITS_PER_TYPE(mapping->menu_mask) to be consistent?
> 

Sure.

regards,
dan carpenter

