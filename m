Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F21271456
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979565; cv=pass; b=IlWsLaoORX/9MIgmu34ft9jrJ4hg0C3fah7EzqFvlQaVaJKU2drGUaupH69VZ4+XMehcn6/isWQK7LN2TzKrEQYFHFwSi8pNoApi/DgNIE54pIJj1uXUOhTFlBo+X8CP+ExVUg3sxwKjbH7OC6gwef3pTJ6p4taktl3ecPKkO0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979565; c=relaxed/simple;
	bh=sCGvqVsqOcJNb/8nEBFiSpk/Gez1PK2Bk9TL9RTryHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzO6ZaceO8chM7EoxcPQscm3cvPGYTgMZ4hCk1Y79y+bhbdAuyp6waiVEiuoHuCCZLXWimB2WJ2jLf9b6WkkGo/Bmc+JWOUWxssEUYed3eLK/xv4fIMgYGqk1uYNOzp6DKzl9KF1EX2Bf64CUGO/8CM/SQB7XtIZPAzgg6iXxJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtCvjVWy; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtCvjVWy"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bfb1151c8aso133768e0c.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 08:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786979563; cv=none;
        d=google.com; s=arc-20260327;
        b=N2Y7u9r/v186A/4XKAzHPoEgXBgC7xR5b/VvixggfB0jG+Ycm2ZPtuIhQzlCCakxVd
         BtM+V8AeX+j4kiKPLnc+lHJ+b26qR6qo+MCylxomD9M4M6ZRdIEn3JwxfQlz8unnIVYj
         b96U5Eu12jVvaulDZo3lmjy6DFqEq6KB573EVxmT06N3sAC1wkX/fXxWpBrgGaLx5taK
         yzeM6IjUirMl6pzLqGIiMjtZNql43u2UimUGMJSQ6BGJ5VHy+G+ZY5rr+Nb0SpARZHV/
         gpkm6HWAX2fXLY9rG7SDsEwYadAqLDokJ42PmEgGN6enwdGcDyYDN66cC8Kc1rIZLClJ
         2WKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vaf9Cx5bbS91iI9Sw9I5LhAq5i2BXevWkKrJ5KbO5u0=;
        fh=DhqC1hp1Fh2aB9Qmghb89G3+s9E+nf1ulbDJAHtDPD4=;
        b=S32t+NvL9XO5CuCcrpw5Qpa8EuMV6+fogYPo32zr1Yo7V7YR6E0FzKOZlSPoqR6pQB
         jkiz8dszFBhdGPPItsmxcUakMYfjsWqKJTJGWUEt+lTo5MCCbfvj/Z9+n1rcf6Kje5pZ
         zRJCreFOtG2UgqbkgtK+ohQWGNx6HTGyN1LrKB52K0z840Z1Scw/hdeDFs4bgcFaPZwZ
         ajEaTJaMjfvNlDWqf8mNHYdVfnPQoVJY3H0B+cvljnOgUWcODTTHVAwz9Dn3jCR4nJNr
         KPofwGzTbC7z4h7ScqPp0Yp1YzDBA+p7+sRu+pYaIu5EkhoVcpQgAPrNiy4uaCheo4J1
         AGIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786979563; x=1787584363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vaf9Cx5bbS91iI9Sw9I5LhAq5i2BXevWkKrJ5KbO5u0=;
        b=JtCvjVWycgQsyycgAUtijd8wMPQPltOyA0oQN64Jr00f4X2wBiQMFsaGKtat5i0Kxv
         BjLUrauwRZ0S38+heAsGd63XLAxzeS5+GJAWZdDzeKme4JeQ3Y5o14LuyPR8BNcmMdr9
         fkHEzQ97l8pyE8O+lVNWmfjGRXOR9evIvVW20QmtzxWsqd8+me3GYsXA2Zr2Iggwba4T
         FmSz0vA9OcnbH07DB+3Mb1cqsCwS8cdftGJDXDQiDuH53tkBE/xyRG48qV5PggR6v5PI
         /SZcLlJxv8itBaSG/Tn3DXDu+cwV3O7elCicynxRp5qvShFKS84CCz6Wz+GFEMHSXQdt
         Cfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979563; x=1787584363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaf9Cx5bbS91iI9Sw9I5LhAq5i2BXevWkKrJ5KbO5u0=;
        b=SltZFMZ5SfqL5+DKKL0bDsPxU/MXbM3ghXZmz40l+Be80gSSID5gCMuoV/535iCo95
         HAkyJnonanyN6B7tkCEA/polKxwY99WPvYI+ME4F8Wtxfg7o026cwLYkEmEzN/M4i8AR
         w07x+Z/TkuGC3AlRGGSzHJua7SHq/NCVbrfZdJJSmqCDahWaTvb9TlPR6M90+stY0Mhg
         QLxn33fpMr7l6CgD2fEODfOAaR7rwuaKEtsLgM96GEP32QDjDZo64j5h2wno4OWHdAka
         QqJ6KmhfCKIH89q4IZ9QPvo+l6Z04IWsW2KTMvIWDs+jY0w85e9tQ7q3wFUwjgVejwAR
         lwwg==
X-Forwarded-Encrypted: i=1; AHgh+RqNjojklKK4CQC2/2/+o3ujnt9XQmiFt/U/Ouw4zjtXxTrfmThlPyXiDKPBdO+2WGVCUbdSakw1jnCwb8iKCoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywubp0gajpyIF7g+GFQBQHg/78uE5TqscfrToSWJoTQ7Jzli4oe
	Ra9ObUg+/X/32KdsSTtSR4jurrg1lzOdClZXfkoVC2K8X9plCwVCtlSn7aYRpPbP9XPukomFij5
	ezpGYtV5i7wLOuPPNu1h4aNgPcxzvsII=
X-Gm-Gg: AR+sD12osRAbmlRzJXTVQHY8rX6w5/hcggRuW+aAw3xCYRTZd7VgPjXoVyjiqZpNtlR
	WxAyY4T3FzjWubGey+cV44lI02mGoqcz+d4kH7OLHDneJdIpTrcZ5iUB3TzYYNRRcFExR1gDyzO
	CNAGrjNsA+laurDnJOOBsppMDTqAcZW1u95a8MzwowszZuQY+1rpzBytNEP5E9Ev3+AxFQvcAzz
	mFNCirCA1qwv0yXaB6KDONkBexyd2+MoNjmVPVvJxMYm+GmE0XZ0LA9WHbLwIe3RlvTNnhPksid
	kUB1C1YHKBXyGtQUgi9PBwI9SVOfVkFW62Br7PXd7EG4NlyWLqUgqcEj6oQfSaqK3E73CL1YA0a
	8bADEv2BRHCW7VQS5ctEMG7nxbPSYwO/y
X-Received: by 2002:a05:6102:c13:b0:738:8d0f:72a3 with SMTP id
 ada2fe7eead31-76f2d5762b4mr1616598137.4.1786979563020; Mon, 17 Aug 2026
 08:12:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814171335.1099999-1-colin.i.king@gmail.com> <3ec52129-0629-46cb-a0d9-cc4dc68a502a@web.de>
In-Reply-To: <3ec52129-0629-46cb-a0d9-cc4dc68a502a@web.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Aug 2026 11:12:30 -0400
X-Gm-Features: AcwNN1VF2iMgMunOjlyCoDEKc8oOXYaVq-li5iG15rUf9zg_MtFAAXGEZuaCAzQ
Message-ID: <CADnq5_M+DcrDvy+1pvW0u6prJYQvG602-rNkni2Dj06fEpsE_g@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake "optmization"
 -> "optimization"
To: Rolf Reintjes <rolf.reintjes@web.de>
Cc: Colin Ian King <colin.i.king@gmail.com>, Austin Zheng <austin.zheng@amd.com>, 
	Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <Roman.Li@amd.com>, 
	Ivan Lipski <ivan.lipski@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Squashed in the additional "resul" fix and applied.  Thanks!

Alex

On Mon, Aug 17, 2026 at 3:20=E2=80=AFAM Rolf Reintjes <rolf.reintjes@web.de=
> wrote:
>
> Hello,
>
> Am 14.08.2026 um 19:13 schrieb Colin Ian King:
> > There is a spelling mistake in a DML_ASSERT_MSG message. Fix it.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >   .../drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dml2_top_utm.c | 2 +=
-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/d=
ml2_top_utm.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dm=
l2_top_utm.c
> > index ab9cadaf5a60..79ec5838c26f 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dml2_top=
_utm.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dml2_top=
_utm.c
> > @@ -123,7 +123,7 @@ static enum dml2_status dml2_top_perform_stage_opti=
mization(struct dml2_instance
> >       DML_ASSERT_MSG(worksheet->validation_result.is_mode_support_valid
> >                       && worksheet->validation_result.is_mcache_allocat=
ion_valid
> >                       && worksheet->validation_result.is_prefetch_valid=
,
> > -                     "worksheet must be valid on exit independent from=
 optmization resul!\n");
> > +                     "worksheet must be valid on exit independent from=
 optimization resul!\n");
>
> There is another spelling mistake here: "resul" should be "result".
>
> >   //  DML_ASSERT_MSG(iteration <=3D MAX_OPTIMIZATION_ITERATIONS,
> >   //                  "exceeds max optimization iterations!\n"
> >   //                  "\t is_permissible_found =3D %s\n"
>
