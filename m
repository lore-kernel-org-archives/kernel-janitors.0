Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CD1430CD8
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736387; cv=none; b=MOZEMpZWaDylfxhFFm2BCBEQ3Dinuw4JTTsFfrLBP/stxRfIGl7U/IDVoynzGeVwv+SO3iP21D1Sd0kIe4XFN+PqzlWC+PzQb3giPMaR5q1CfAOzYVnftc/kiw/GHMaR0rdftRyv9Nv2+6fZdKgA573V12yP9dQ+tfmjZzP7GOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736387; c=relaxed/simple;
	bh=s8+to8b6/VG7HeoYZ/5GPm0QwBM8JYFg2rpjNk6m82E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXJW3dst3qq73E5zWTVLvx06t2hAzHCH45UipFu32BeQi6QgsqtlzuQkiY/y5Bj8rck9pKO2DRwQIbXfM4mZMRAHAmTZnxYFceMZLjLsNkmSLYYbeu0ZyUkQqUeXkb6BSDGb41TXHTgTeUAx4KcK5iq1MDVeJk37hO73nzS97fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j93l1hPV; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j93l1hPV"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so4618925ad.1
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789736385; x=1790341185; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxzpoScGk5dDKPya4LxeNVRbV4selBUM8DEhCYq8QJg=;
        b=j93l1hPVM7eYnrT4DudiPGTclmMZQhiE7xtf5CB2uphMYEsQkRxxUNg7MTh3XHiFb1
         cHfklfs07nDTYl0cIDGgOaGflSyr7hTwyXjUEJj8coPkRmidlbAibceAv63FBcdcHwKB
         t0mq9Scsqw7GoSdwKOcDa51naH4DBMpfwYjpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736385; x=1790341185;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nxzpoScGk5dDKPya4LxeNVRbV4selBUM8DEhCYq8QJg=;
        b=PVtU5xiVm6sL2NqzDJS89oUOvTfd5j1PpDb2iX1sodfhhNE/kPZ7Kw+btuLShctvw5
         u45YQR/wPr9K6r/etfn61CpPzXrWuxLzhW91Gv5mRBiUm4SyPlLZm39+20yz6Nu0PsDA
         2p+IqLG2c8wtkoi0m3pI/M7ylZbMDgX7/k3LyoCj/Wax9vWv7esUh2WnYi5lovosFr/a
         YfPcgoRZh+mf6aXL0xe0/VIKZ6e9+0sgxilxzP1hjveUnQCzN4InnWxSyzfybpjj7Bub
         4vXM7GudMjL39EfgUJixVwttuzUYtqX7eNqJbRBcNEDo2qEaerctzlF2QQT6l9v8UeZo
         0TBg==
X-Forwarded-Encrypted: i=1; AKwUvByIb1gkm7s10mqAfQYGhEY1AWecr5ZocvjpYXWgrsKGVXoMT/bj6fOHPMrlcj920KbTw3zrCLlRjfp9EptcV8g=@vger.kernel.org
X-Gm-Message-State: AFuF++mD0RSPvKcfECAX8GuJdsW6BsRbxCu5V4An77f6dUzIN93/OCqG
	/mBuPe2cILVYcWm6qENY3awgqypomZvV/tCChpWXvtEvVLm/Mcp3FVTRyf2xnpoIi7iQ3gAAMW+
	dLAZf3A==
X-Gm-Gg: AYBFou3DiOD35GROb3tnatla0os4M55Oi81AVImI2/oQ2bFeG6cNCqHr5T+iE7jo8JW
	bHfkcirbJy4iq5i+jK7H9/ld4FDIJIBw/yH7sS4NJTr3+lTNu6Wr0+OSvKTd3aXSeBOjWm/Y9m2
	XpBQM74H3gtZKevl72YHsvCY/nIqMSXBHAd7MA+TbC8nnxRRMrrsggJLwxAjcoQzzVp49UcqzHV
	LXEHO9ccj4DFR7rZ0WUPl/5oPr0LcVkSVDG/M69d5CldZR2tLmP4NKmDlZaAf6Mrp+TznXknijw
	TqRAZmc81htJNDHlNXYfF1Ez7IpNAhieQOPEYWNTgLL6sjQsmXxNYbH4h2GVUF55ApFXv5LkKfP
	RjFAkrT8l0rgArTh31MuEUx97xWCx6Q5X1qGHgvi503+CPiyUfLiepAg3CXnNbBiw6rn05EPEjQ
	Oa1jwYvdeDWONIW4jmITlzP5BuaNLA8WwasSbCiHgCi4/p0PDlKBWpzgnBqso8Qv/uYYsHh1525
	8QQQ5ACh1bO/IqByrxzdDfzTpV/LaN8UlpX
X-Received: by 2002:a17:902:fda8:b0:2dd:ad73:c988 with SMTP id d9443c01a7336-2ddb1bbf25fmr45916805ad.32.1789736385580;
        Fri, 18 Sep 2026 05:59:45 -0700 (PDT)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com. [74.125.228.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb73daff7sm7427415ad.8.2026.09.18.05.59.44
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:59:44 -0700 (PDT)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so427030a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 05:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwTDlHaLLE7ZasgILHsL1e8K5Mh9i1Uh0bMOIaBwbQy0vDIMeRmc6G+MqfM8paHC2RB2Uo0j/Qbh9j8OlLxPQg=@vger.kernel.org
X-Received: by 2002:a05:6a20:6a28:b0:3d3:adbf:7782 with SMTP id
 adf61e73a8af0-3dd8c41a46cmr4668333637.23.1789736383919; Fri, 18 Sep 2026
 05:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aq0siVcghDe6x9cs@stanley.mountain>
In-Reply-To: <aq0siVcghDe6x9cs@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Sep 2026 14:59:29 +0200
X-Gmail-Original-Message-ID: <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
X-Gm-Features: AcwNN1VZ_6ZbCrR1Mp4y7JmQBXOuD4YG-BKylmDeJzSZ3dkgiXG_e6jgcK3ZpuQ
Message-ID: <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

I believe that for all the uses of uvc_mapping_get_menu_value we are
already doing bound checks:

index >= BITS_PER_TYPE(mapping->menu_mask) in uvc_query_v4l2_menu()
value> fls(mapping->menu_mask) -1 in uvc_ctrl_clamp()
BIT(i) <= mapping->menu_mask in uvc_menu_to_v4l2_menu()

In any case, I think this patch is still worthwhile. It will help us
avoiding bugs in the future (have you found this with a new test for
smatch?)
and if we go that way it is probably a good idea to also "fix"
uvc_mapping_get_menu_name()


On Fri, 18 Sept 2026 at 14:20, Dan Carpenter <error27@gmail.com> wrote:
>
> The "idx" value is a user controlled u32 so we have to bounds check it
> before calling test_bit() to avoid reading beyond the end of the bitmap.
Maybe change the commit message as well to avoid stable cherry picking
it blindly (sorry seems like I am more picky than usual  :) )

>
> Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
I believe this should be:
Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
or no Fixes at all.



> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3ca108b83f1d..f157ed99be4e 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -538,7 +538,7 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
>  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
>                                       u32 idx)
>  {
> -       if (!test_bit(idx, &mapping->menu_mask))
> +       if (idx >= BITS_PER_LONG || !test_bit(idx, &mapping->menu_mask))
>                 return -EINVAL;

What about using BITS_PER_TYPE(mapping->menu_mask) to be consistent?

>
>         if (mapping->menu_mapping)
> --
> 2.53.0
>

with those changes:
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
-- 
Ricardo Ribalda
