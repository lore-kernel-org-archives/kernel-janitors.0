Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B970B44C50D
	for <kernel-janitors@vger.kernel.org>; Fri, 16 Oct 2026 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142447; cv=none; b=kHwf31qBk6BdwGYiY6l+Eq6qwwldA9pwxkagbr/n0HcRnGZPJ+Psaz1Jg2pzF/8eCbvNxfCUM7EmRbEvMoDmPLYC/CofhB+CW81iOI+GDJZU9qG1Xbh9yzFLXxbGu2ZTYl1QS13fEBO+j+Pjf7mN5XmXA7SwXsqDe/U9fky+9B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142447; c=relaxed/simple;
	bh=J2Vo1AKcHKkb4R6FLHf/+bygkCDME8e58AbPfZcmVxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQRqBX1e8n53O2zlExuLpZ8rVqcDmxLpAU6wxE6AfZYFH7FHEvOR99wuMBxqmkLUYVN2ji8bulJBkvNNq6tFfPCP+sQENBdVyCHzmxcGsX0i2M80SbtbzaYYXL1Uw71l0EdmyF478JWwlELhpsUQeXLSZWfXzVJP5u9c8u+q3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MNoOXhyi; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MNoOXhyi"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-89f81643121so298064b3a.2
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Oct 2026 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792142446; x=1792747246; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZpdtgEyok+9PJ/Ri7Q+NSThTOVxSs62Fi1zlQZD7xQ=;
        b=MNoOXhyi9slDrIUJCTp532fTwsPcUietzjxggri57ENxzgxV2wjUiK93nUJYNubJnK
         g8lXZtKahlWFAQKDvE52f6lvs8VuKSWK4jnJwmhvhd1y0gCf6yMAQtYKT4U4cbdYdzCb
         V+9CMSCbXwLiKWKesPV+mxkGRUTBf++2R3+wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142446; x=1792747246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cZpdtgEyok+9PJ/Ri7Q+NSThTOVxSs62Fi1zlQZD7xQ=;
        b=cp8/iBBKWhvESm/Z81HC71uTOh3D5TvfJiG09VqvIVClizKTAisheuuyjBrPGqr9sX
         iSYKC81y8CdvD8TMP6xvDhM88cSXqiavEpng7hYr2RvhlzpPAHeOF2n7Doau4JIdM2j/
         GnTbekBiZ84P4LJmJLPmchDwsmePSxcLtzcgyb9lbQQEh7rGxYXB6vKe/aj5wS7QeAsG
         EXD36BpQBSVA0R/h7Z86EeQbMncSXKeP4p0/C9opaewlyuZGrgEigZjLs7EP31zXz/+d
         tSITz1b4T7isy1a+/+FRD1hN0t85AHK4erTcq7BLrpS8tPmw+SBv/vs5XSyUXF0gHgXo
         WsPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7gxTn1RtalI+YZ/NlzgGJOJze0YbIPDHHNPjU7F1C1akhl4QM9/u6cTKKd8rn6dCtdifFwItD6vyIXyBlnLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwQFSUdw+9TNOammf+1APYnxgq8lhwG3CLkyWukT00hpULIHbC
	Gn/gK5x2DcQ6fLlk9fcJ6UZnZglGJt/0Fp8+n80YGZcqM7j91QJbl7fxrPHzzds8vpvO7gy1LBY
	WEJpQww==
X-Gm-Gg: AYBFou1WKmtndhb36oW7uQn14rB6ECYaVb/5spda7Iazf6tvr7n0cDoUiEHxO0/I8lJ
	bL2SiPJtBYR4KFbrc8y2+wHibRFMVPrppAl1LwJlzTPjI1VNZQ7sjG8dpNM2+awDyOizePltA2c
	n9lZUHFBWbnmxTA+kBSXLBw2K2tuR+QBoyfHfpZ+M5F1NoKCNwQU8Bf/8IxpWlm5Jb6goIJg97e
	+nnKXNU4VMw3dANVVp+GfoHPOc78YJgj04cYFUercbbkhpbbPASA9dWCEav0ELaQ5e4JqDFwnvr
	771GQaVipsXFqPEOcBronOUHAWxu3E5B6f9mQQsJvQBLM7+E1zUy1LbZ66ZcUSTaFeuP1tFql0G
	zkh3V0kd0vzOJPUNjS6LBv28YDeKaDDMBFwmaWwJJAqWfbRQvhC1WwaGih+uwO52D9HHjZh7m/A
	ZwT4r2ZN3E/2LIz21WuwqQvaM3SPV/oRsWsx9DN64iZzrJC9/uyZC6AxzWi0sLjARyjFGYuR7WV
	Uv89vfg7wT7TgObrUovOq4+9r8TnqTaEHU=
X-Received: by 2002:a05:6a00:2d06:b0:89c:b6a0:9a4d with SMTP id d2e1a72fcca58-89cb6a09de8mr10815170b3a.11.1792142446068;
        Fri, 16 Oct 2026 02:20:46 -0700 (PDT)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com. [74.125.82.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89fd2737d20sm400123b3a.35.2026.10.16.02.20.42
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:20:43 -0700 (PDT)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-141395927feso11963078c88.0
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Oct 2026 02:20:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxp15Z1nDfmEmO16IbtzOKS5hgE4sHBqjEOFhqMv9thIGSFUJ3HoYBHQNPgJDw2iLcgECvKjfbO/gLqoCGM8kg=@vger.kernel.org
X-Received: by 2002:a05:7023:a47:20b0:169:9f67:a91b with SMTP id
 a92af1059eb24-16a5dbffce8mr26511358c88.12.1792142441528; Fri, 16 Oct 2026
 02:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <atHg6s8VaFxNzuR6@stanley.mountain>
In-Reply-To: <atHg6s8VaFxNzuR6@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Oct 2026 17:20:25 +0800
X-Gmail-Original-Message-ID: <CANiDSCvT3KC=LYaQPgvxnFfFfKHwtSZkDoSVPjd-_g5R9iiU1w@mail.gmail.com>
X-Gm-Features: AclHuK9zy0ivptFpxjfRKqq4APH2lotLQJ8S3ABkRzR92mbjRrsQi_YoPtdcV_I
Message-ID: <CANiDSCvT3KC=LYaQPgvxnFfFfKHwtSZkDoSVPjd-_g5R9iiU1w@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Add sanity check to uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

Thanks for v2.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

On Fri, 16 Oct 2026 at 16:31, Dan Carpenter <error27@gmail.com> wrote:
>
> Smatch warned that "idx" could be too large, leading to an out of bounds
> read.  When we reviewed the callers it was a false positive.  However,
> add a sanity check here anyway, just for future proofing and being
> consistent with the rest of the code.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> v2: It's not a real bug but Ricardo asked me to add the sanity check
> anyway.  Use BITS_PER_TYPE() instead of BITS_PER_LONG.
>
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index d2f722bc3459..249c68783474 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -538,7 +538,8 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
>  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
>                                       u32 idx)
>  {
> -       if (!test_bit(idx, &mapping->menu_mask))
> +       if (idx >= BITS_PER_TYPE(mapping->menu_mask) ||
> +           !test_bit(idx, &mapping->menu_mask))
>                 return -EINVAL;
>
>         if (mapping->menu_mapping)
> --
> 2.53.0
>


-- 
Ricardo Ribalda
