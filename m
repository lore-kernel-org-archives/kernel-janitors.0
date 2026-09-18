Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5774FD27E
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739189; cv=none; b=WDi67o9uRwcrZPEUTkTFrQvpZo1ocMffUSyq9PNEOyjeXFD3fVavO3qC6aC45PbF7c6wufYnobcj5zwJ/W4t7nvHvKuLeuyOqKqvRGIABOps9ICgUdv9TB9LXYyF+LNOEKj/rGKF/k5GlV6XfOX7j7d4d34sBx612yeZCWSjuRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739189; c=relaxed/simple;
	bh=2qSOzg4sizQOzLLpcD7UP/ZCzP16AZ3iwLyfpqnq6bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQZ66HtzM0g+TGgitSok/jymH/yIbFpBzBOjQ6bv3F5qzia96gX5gcf5q9NzubrxJMulQqakNPMiATbISdmljqK35fWMpy3N3TaqrJwQMcOX/pIvckOap6bdL1/oc1v3mV8LklPBRCi23nxHDJMDgrnVFUlU+SfNSm7Af2X8s8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SAlGDhts; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SAlGDhts"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso552471b3a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789739187; x=1790343987; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEr+Jllj6UvgKGonQFQTN481MqBknHTPJ/e8FyyBLLY=;
        b=SAlGDhtso+n9Chi+s5jsaCDpPPUvS4eswMddE4IGo+6B3DGGhM7X17GwHFHOVZ1O8b
         ky+NoxaR/LpgmCzsGJIkhHOtHSf/jHPJcIOa4ijpi+DMmd4FPcm5QZb5IMvKnmQeWZr4
         lSXhR1NL5a3BZaUvkxz7f7Ah8LshCIvIR8EYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739187; x=1790343987;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LEr+Jllj6UvgKGonQFQTN481MqBknHTPJ/e8FyyBLLY=;
        b=ktDkdGu3nzT2yt0dvz/kCPKxjfIZfOuvG4o7eJt4Vtf4l5oqfgSSRSvN/Jg4zeeIve
         qOOo3zI0HkPNDjPFt9AXrj+LGuhZBya5bQsTQIUewIAysQrvtIW9EBg6MuBpP8Nx1mjQ
         Dr0QpfTXcvEQqA+lahcl9UNSLlhbTGnH9CGdUK/VnJ/RXK4KqMWnggNcTrODi1Vzin77
         +vrnNFMMlIy7muSDITc9dPgDCOxXdGvy4aZvQ44ic0LVtec/9zofxTxLois+4LXQ+N/U
         MTS15qsJA/KkOnb1Awy75nwk8xFBL3TMtqW/xUeTOZF6qOE9xv24dd4aswbFyntJnqzZ
         vpzQ==
X-Forwarded-Encrypted: i=1; AKwUvByV/LNYt1opsX1XmK2Qtx0PJ99LobMt8Up+/lTOeM4YOSidiJEW6ieJIl5J47y3eXw05WACPPturuwYpbD8Mtc=@vger.kernel.org
X-Gm-Message-State: AFuF++nmDus6jmzkr1KyoFWD53NKE9ZpzU5vv4vfD9mihf5B+yZrAEeb
	k3nmDuJ2semyFm8uj7ETvtkjQLXot7K/32PhJDgMj5WVJsHH9mdZXMQrvB6fIADx0nmtenjm3ip
	lisCN8g==
X-Gm-Gg: AYBFou01BkxvV2dCAcPRarYRdQ3utCUAVCRt+iu1lItrsXTCFfLuYLE1Bct1JcssAtl
	CGtnd9Lzi1xEhDms+FDvMR+xLvceOcLj9QUDiyAU/jFmiZIPutXDesbqtavl9XM2NephEvdYlQG
	0ljnHe+Us9ev4KXjPaWRQ/gjnCE1ummmLXO+a7/GPDJl8tqRU1a9fl5rqdNe+fCx2fcA2qacz79
	vaSMRwy70gSdqyeIcdcvWLd4zLJa/PBARdNckQXp44QE8G9P2/QA/3fXmNkt36kwBdGANwNdXt7
	hHMXxPNJoewzKyEHYkfwas6AMtUuR6DE/dnUAX94WBhky8bRUKn5Lnn6sgkLulny7/3RN+KdRfK
	3tLX0EIcZPbSyu/xmsJ8kVEnMxuPUotNxto7Me4pnJV9ZcHH5FgcWA75vDCq/iG0j9EOCNvJKKl
	4DYmCVOB+TZg58pPPYSLyxRVsbTp9MeLSnhGzIQxdb37jtKzri1ZAR4JOQJkolk4L5xEtQV4u/J
	k1dLRh1f5dihAjvPkjjBLje76SblgiTwGt5
X-Received: by 2002:a05:6a00:4b10:b0:845:c694:5c3d with SMTP id d2e1a72fcca58-874dc5eb32cmr5043488b3a.1.1789739187094;
        Fri, 18 Sep 2026 06:46:27 -0700 (PDT)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com. [74.125.228.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dd3eb803sm851798b3a.41.2026.09.18.06.46.26
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:46:26 -0700 (PDT)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f204f6so495231b3a.2
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 06:46:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxvxz9Z70nZT47mnKCa6/LqpQf+HcF7ycnLIyjwAt2Nw3QyvoPw/Vuas18OH/oA/NEjZ01aXGk41PErtXUnMrs=@vger.kernel.org
X-Received: by 2002:a05:6a20:c792:b0:3dd:85aa:d269 with SMTP id
 adf61e73a8af0-3dd8c57c8b3mr6488270637.33.1789739185437; Fri, 18 Sep 2026
 06:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aq0siVcghDe6x9cs@stanley.mountain> <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
 <aq06Kq-3n2R79YZL@stanley.mountain>
In-Reply-To: <aq06Kq-3n2R79YZL@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Sep 2026 15:46:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>
X-Gm-Features: AcwNN1W7JB6JPajEBAwfNwsaOz6EGNg1kBmmMiFsHZqDGyowXMecVDSoVfzZz04
Message-ID: <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Fri, 18 Sept 2026 at 15:18, Dan Carpenter <error27@gmail.com> wrote:
>
> On Fri, Sep 18, 2026 at 02:59:29PM +0200, Ricardo Ribalda wrote:
> > Hi Dan
> >
> > I believe that for all the uses of uvc_mapping_get_menu_value we are
> > already doing bound checks:
> >
> > index >= BITS_PER_TYPE(mapping->menu_mask) in uvc_query_v4l2_menu()
> > value> fls(mapping->menu_mask) -1 in uvc_ctrl_clamp()
> > BIT(i) <= mapping->menu_mask in uvc_menu_to_v4l2_menu()
> >
>
> The problematic caller is uvc_set_le_value().
>
>         value = *(s32 *)v4l2_in;
>
> Smatch thinks that is called from uvc_mapping_set_xctrl_compound().

uvc_mapping_set_xctrl_compound() are only called if v4l2_type >=
V4L2_CTRL_TYPE_RECT and then v4l2_type != V4L2_CTRL_TYPE_MENU. So I
think we are safe.

>
> drivers/media/usb/uvc/uvc_ctrl.c
>   2772          data = memdup_user(xctrl->ptr, size);
>   2773          if (IS_ERR(data))
>   2774                  return PTR_ERR(data);
>   2775
>   2776          return mapping->set(mapping, size, data,
>   2777                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>
> But maybe that mapping->set can't point to uvc_set_le_value.
>
> > In any case, I think this patch is still worthwhile. It will help us
> > avoiding bugs in the future (have you found this with a new test for
> > smatch?)
> > and if we go that way it is probably a good idea to also "fix"
> > uvc_mapping_get_menu_name()
> >
> >
> > On Fri, 18 Sept 2026 at 14:20, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > The "idx" value is a user controlled u32 so we have to bounds check it
> > > before calling test_bit() to avoid reading beyond the end of the bitmap.
> > Maybe change the commit message as well to avoid stable cherry picking
> > it blindly (sorry seems like I am more picky than usual  :) )
> >
>
> I mean if uvc_set_le_value() turns out not to be a bug then, of course.
>
> > >
> > > Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
> > I believe this should be:
> > Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
> > or no Fixes at all.
> >
> >
> >
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 3ca108b83f1d..f157ed99be4e 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -538,7 +538,7 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
> > >  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
> > >                                       u32 idx)
> > >  {
> > > -       if (!test_bit(idx, &mapping->menu_mask))
> > > +       if (idx >= BITS_PER_LONG || !test_bit(idx, &mapping->menu_mask))
> > >                 return -EINVAL;
> >
> > What about using BITS_PER_TYPE(mapping->menu_mask) to be consistent?
> >
>
> Sure.
>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda
