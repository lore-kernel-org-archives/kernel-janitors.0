Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0641F17C22F
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Oct 2024 20:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728507010; cv=none; b=NPD+9cY7BTLa5yVfyxJ45iepWW49CkZ6g9xTQoKKgypC/yBj6oaGjULgEVuizfImAHmJso/OLnDgQ+rCYywvdY3hrN2jm/cjyyqVC6PBTP6d2iPAOfD//Pm0cD4NwOr5ZtQWsKxfj26ldTIXD0dThqfOicgH/LQ8hjwUTThJLw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728507010; c=relaxed/simple;
	bh=2lp3Ln00mpRryNRxq60rNEzUatPpphR1j8+PG29glH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVJLUX3FCWeotrMlrrvHIbdsTCI3cTnlg3EdIB4TVgf2l5ityJaxpEKvf5wNJHItDRh7uWbLd053LfBazLqBqJPLU2a3RQCGN7nZqedPtYDtYai7A1LKmGw/WOXv+XLhu/ofAKaMggEbEgqsRI+vYtTedpsvTUcCu9dkTfy47PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=fail (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b=dHgUG1cC reason="signature verification failed"; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="dHgUG1cC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9963e47b69so35836566b.1
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2024 13:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc.com.np; s=everest; t=1728507007; x=1729111807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6AlyAiK8jIW99PS/mbC0CEBkjDKR+IRpZZi78iD0gY=;
        b=dHgUG1cCtxyhl5WPezwYmpRgMJoch+nVlDK7dP+u6OZkUyYq4tgwlrcai408TKkIQw
         xy8n1xd/DodlskwdqkNPipWLM2TUhMQXhg8IwHIGeFoU02s4fFbFYKg1UiJVjNWUNRZ7
         rLT8zqiKZiDSyLPWTnvMV5BNnECBi45RLKF7fboNL143ztCq57MO48HR1J5LBt1Fu2q8
         +JdIl02Dbt/Yes36LINdvBosPbWkWnxb1Onnlrh0OzkitNBzRS6kdb6ujUAY2TM8KAdG
         ntt6nUAe0l9D1juRubF/yJIWBA06zumBbGWKFbRC4p3YzoRlMEZ0gHHG19VDoRIQGnfZ
         X4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728507007; x=1729111807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6AlyAiK8jIW99PS/mbC0CEBkjDKR+IRpZZi78iD0gY=;
        b=fA5qidJbwRgyOWzNrhpsj3ExCsBAMqYsBzh+CbDJIjPrf/qGiH8/d4hdhrQ2e9c1hD
         lHlc1lSIZPs2LX8HRt0n6CXJahjlbseNJahReMSC+g7yNRAjvVKbeH37NEoIyOQ23bp8
         EhmfoS1i5l2WF3pYXaH8db6ggFnXzDQ5TMdfUPZqlEM8/tw/Tj+DOLuMDJrpXsqAOwzt
         Feu4xWNO1UHdS2Aj/eRGHEtMoZPW0nwDzNiHPeYbE6UIcqzI/CVLxmQsFWGgTgqC7oap
         hi6UuYN0zr5+EtI84xGqKZ2l0txSESy8aA5yvyz3kSoSil0DKkn0k0HRZ50JiTHxT7f7
         hs8w==
X-Forwarded-Encrypted: i=1; AJvYcCX0XM1Ypd8rFgycd3l4fiIXezGDz/JAoz13+HuHtYPD8syiN2wPXmT/9DqgDviTukaSEcA0UzV8eqG0d8zCIaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9K+O62oyVWQVy23/Vnt69HzK1zzbTcbsHPMQcuG8pSF/fOJwW
	w/71VK3vOTGdVAkuGrPF6XtpPKN+D4uLGmh7npfcAKMHj+WP3xKd92zh2sOwNuXXFo+ZtWhYI58
	AUd8kOerM5xBDqO6XwnNzYqONbQ62FtsxVkhntw==
X-Google-Smtp-Source: AGHT+IHZQ//C/LT9bz4MtZcmxJW5GzbBzoSV9zKUThFSFKoiavT+2C93cS1UjaGvXK3AnSkDwkQ7q5RXVs+r0/IWRVo=
X-Received: by 2002:a17:907:7ba9:b0:a99:442e:34ac with SMTP id
 a640c23a62f3a-a999e8c9f03mr127272866b.40.1728507007259; Wed, 09 Oct 2024
 13:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009184951.4991-1-everestkc@everestkc.com.np> <07d9eb6e-87d3-4428-aaa4-8721a6844404@stanley.mountain>
In-Reply-To: <07d9eb6e-87d3-4428-aaa4-8721a6844404@stanley.mountain>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 9 Oct 2024 14:49:55 -0600
Message-ID: <CAEO-vhEGtBX1sb3MYm18+MBGEgrFfNpzatBT46kcN9_Wh=NFMQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/xe/guc: Fix dereference before Null check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
	rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	skhan@linuxfoundation.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:35=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Wed, Oct 09, 2024 at 12:49:49PM -0600, Everest K.C. wrote:
> > The pointer list->list was derefrenced before the Null check
> > resulting in possibility of Null pointer derefrencing.
> > This patch moves the Null check outside the for loop, so that
> > the check is performed before the derefrencing.
> >
> > This issue was reported by Coverity Scan.
> >
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
>
> You need to add a Fixes tag.
Will add it and send a V2.
> > ---
> >  drivers/gpu/drm/xe/xe_guc_capture.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/x=
e_guc_capture.c
> > index 41262bda20ed..de63c622747d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> > @@ -1537,13 +1537,13 @@ read_reg_to_node(struct xe_hw_engine *hwe, cons=
t struct __guc_mmio_reg_descr_gro
> >       if (!regs)
> >               return;
> >
> > +     if (!list->list)
> > +             return;
>
> Could you merge this with the other sanity checks at the start of the fun=
ction.
>
> -       if (!list || list->num_regs =3D=3D 0)
> +       if (!list || !list->list || list->num_regs =3D=3D 0)
That looks better. Will do that in V2 and send it.
> The list->list pointer can't actually be NULL.  It comes from
> guc_capture_get_one_list(), so if the reglists[i].list pointer is NULL it
> returns NULL.  However, obviously checking for NULL after a dereference i=
s not
> the correct so it's worth fixing and probably deserves a Fixes tag.  Alth=
ough it
> doesn't affect runtime, adding a Fixes tag helps backporters know they ca=
n
> automatically ignore this one because the commit it's fixing is very rece=
nt.
>
> regards,
> dan carpenter
>
