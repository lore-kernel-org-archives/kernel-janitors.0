Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B63678F57;
	Wed, 15 Jan 2025 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736953211; cv=none; b=lcedwsFQrQkCPX48khKb+9QCA7SDk7RK2FL73UoQKaw/oU5kNjEvOOxC6/Q00PKzw53XuLyuSP1KC2TxMdyhxWfrv0ipyzbbXEie4gi+n4X8+u7ti6YURnhjFdunj5cV8GX+tMwU2XmUdk+l9VJgeoU9+qfEuDd6E+aKKJaSyGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736953211; c=relaxed/simple;
	bh=w0x1XatzB7lMZnijACkoLHrulPKZfrNQUyEY4SpeB6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZCwTp/8k2Lp9iCQchvxDRRnNzxlSYOa0Gi2zjuVvgoP2oRCY0+SHJ5n8uJHldUXYIVyyYujkRRBjL5vrSqEfQCepQYgwVpuSK/5FgkTfYqaBTYr6KY3xgBg5XTER8F0pI7CXSzwFD0babP0JhYfUPSjM4Hb6AhCoL3xy8m44uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nm8fASnc; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nm8fASnc"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f615e14d0fso917424a91.3;
        Wed, 15 Jan 2025 07:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736953209; x=1737558009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJNN+yIAbJ7FQhP5e1dcdow/Ss7cUXshCz1OUzIShrw=;
        b=Nm8fASncZ2QNemID2pbmqiUhvOqZ1AvEU8gkTfvT66/Ca9/gVDT4IVIMVJ6hf1tTbC
         vx4sBzel+pgQYQtEvxwMfB7Tpi+65DaH/7312t693iycv2ik1x1PJOllCH0e11Gp2733
         DmoXDLC82pzXLLabyMJaImsUr2/MOIAsRoteSUmoj6t4E6OXVVYJe6aScGJgEC74m2wI
         wh6yDzSBMqCH9WLAgOBWOOAdi04AdLgFR/7FuBvgn4Wbj4gfmcNHHCI6j1kuUGuTeKnh
         mITazzktHaWAi2vf2JF+PPLNRPR12n+lkqE41jeyb7kBg2T7zcf+DcRByI8W2g4/LIlV
         /cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736953209; x=1737558009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJNN+yIAbJ7FQhP5e1dcdow/Ss7cUXshCz1OUzIShrw=;
        b=vCivkDXjI+KqgHpPw2NduUXbIGSG9DsHLnb1K0GFWzQ1439qFSZy5vBGMLTz8mI49V
         3Zzsc8+APnjFFJJkHvKnDo5dzYAAe90J24lXmY+W7AwXduCc08Vres+X2x0ayMKgBbgl
         BrI0gf2agdm2rS454b5YXh6GmFIGvHYJ7G+Gm17m9fK146n/xosKer/SoQFANGvbc2uM
         MRzDZ8L33THmODVreOvspj0/GLyc9CuXjCr2069K1vEUREPxL7FWwy5G4nekJLQcS3H/
         139/u4kOIkxzHm6ZHSwJdfL5NdtkSm8nBrviBda5XIDobfgeSgoAFApWja5hH6LHtNBt
         I3MA==
X-Forwarded-Encrypted: i=1; AJvYcCUaAzA8c+ZbaYo2Go5FrWBmdz/Nu1vPeDUy4ILEy5F9giGPtI/3U7grGPXLIPRIVKFD4o4MdWYGeBOawDDEICY=@vger.kernel.org, AJvYcCWWIGuSBwyRV0jBWsLav5LmuggSFLEBY3sBCPDKyWL8n54+xsKO1OdJnYD7P0lQ68yBVEwzpApklBQYbEpW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5vJQQ+ksa8qqc2nFl1fM5yLW0CwzlnNK+O+rea25gef6z8v3L
	jh2SUBLX177sDs5B8CpPW1GE0WgThpdHEVgh9otcjsMG2geNUmNxht1ZAN7c/YNanPZTf4WQU/X
	XM4jj86jsYVsBdcQHDgyNPC4OekA=
X-Gm-Gg: ASbGncsr4/PeJl781VNTfw5YVPyE7vYMrENZ3VUnrvJwyOvUHZgJxNecMoc9FSpe0st
	VnUDPaKkXuPmKMbv3H9KMVZ4Rlw4c0CjCI16Zdw==
X-Google-Smtp-Source: AGHT+IFr7+OOHfJRndFGnKOHv47itbOd5fZmj4mkPaTAVgkZpPIEyEf6hdx/C48x6sLxu6ybP54hOConvjPiXuJhOeM=
X-Received: by 2002:a17:90b:2811:b0:2ee:cbc9:d50b with SMTP id
 98e67ed59e1d1-2f5490ac695mr16375331a91.4.1736953207787; Wed, 15 Jan 2025
 07:00:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115113552.297307-1-colin.i.king@gmail.com>
In-Reply-To: <20250115113552.297307-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Jan 2025 09:59:55 -0500
X-Gm-Features: AbW1kvZGmglu8dFsb44hdBkRoz1ygvAcPx6pHw7z_ZcBWTQupYD9YyxpbJX4y2w
Message-ID: <CADnq5_PQGZuL5g5w87-HCqKAL+76WN=iso45UvnVu4GGww1Veg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: remove extraneous ; after statements
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  thanks!

Alex

On Wed, Jan 15, 2025 at 7:02=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There are a couple of statements with two following semicolons, replace
> these with just one semicolon.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_cor=
e/dml2_core_dcn4_calcs.c
> index c4dbf27abaf8..1a0a08823ed9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> @@ -3894,8 +3894,8 @@ static void CalculateSwathAndDETConfiguration(struc=
t dml2_core_internal_scratch
>                         p->SwathHeightC[k] =3D MaximumSwathHeightC[k] / 2=
;
>                         RoundedUpSwathSizeBytesY[k] =3D p->full_swath_byt=
es_l[k] / 2;
>                         RoundedUpSwathSizeBytesC[k] =3D p->full_swath_byt=
es_c[k] / 2;
> -                       p->request_size_bytes_luma[k] =3D ((p->BytePerPix=
Y[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_descri=
ptors[k].composition.rotation_angle)) ? 128 : 64;;
> -                       p->request_size_bytes_chroma[k] =3D ((p->BytePerP=
ixC[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_desc=
riptors[k].composition.rotation_angle)) ? 128 : 64;;
> +                       p->request_size_bytes_luma[k] =3D ((p->BytePerPix=
Y[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_descri=
ptors[k].composition.rotation_angle)) ? 128 : 64;
> +                       p->request_size_bytes_chroma[k] =3D ((p->BytePerP=
ixC[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_desc=
riptors[k].composition.rotation_angle)) ? 128 : 64;
>                 }
>
>                 if (p->SwathHeightC[k] =3D=3D 0)
> --
> 2.47.1
>
