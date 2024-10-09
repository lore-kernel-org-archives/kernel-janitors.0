Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9731A0BDC
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Oct 2024 21:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510535; cv=none; b=IjPZx9R7gwmpOVYQZnB0Mf3tjAsMgYumHnJiCcM3JUr/MduytN/Mm92bPqKC2NmnEQ9yNCNWJbdWUJn02vO2mO0JBFeSl8YB4JHKR5NzqyllcMWCj3L/Q6Hao97DaMfBk20VJ5SFqsv0jsxvprVOkPP6VHH2gT6bQkbYMsFo3k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510535; c=relaxed/simple;
	bh=edJ4Ngh6nKMZUQDj7p8nv9TBFVoS35vEqKbJQdMwY64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVDDDz5NBpE3T7ITM9/rFN+iOBF4ZGknaX8q1y6O5oMCm11dd3LyTI6NYvPClMjg9jiYPrsp3ociQxpDM9B0UXtPjV4q9t1PTKHcGUeqg/tEC7p4ek7XT+38QhfYrsOOEC6E7bUYd0POHX41ta/VJTzQYNSoywPcEGOnlckP+Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=fail (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b=R7UXM0jo reason="signature verification failed"; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="R7UXM0jo"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a997736106fso31801866b.3
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2024 14:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc.com.np; s=everest; t=1728510532; x=1729115332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3kqt/YrEBXpzF22FqXng450iXUadO+44FmUUeQtHrk=;
        b=R7UXM0jozaGEWL5W2ISFBlilFQb3e6mlKMNiBiTyWqdkhQ/GhS41btoJfvh07cfAKs
         /P7MZwr3B9mqGLlVxKQ0l/2RyfsEiHAbot1IAxfF9j4BvJcja0pVKEuNnvRG9ePvpCQp
         lucjDhH/KOE//87ENNNvzCQs9IOmKxgZM1006ftTs+EmVfCeyvwIToNFMAn19cnDwSU6
         XAgrsCqAPldBqdVinMnmy5eVwKRCeKvhcZeSdT5tRuQXTHzEzXQebEU5VX8BYiTKU+Ao
         4f8qi72si0CC41bjmQBhGu3s1r774fMqG3mqEqNJ91+CI0A9xwnl3jynBPnCCIxuMYSb
         4+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510532; x=1729115332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3kqt/YrEBXpzF22FqXng450iXUadO+44FmUUeQtHrk=;
        b=X4kw282iEWahs5qW6u2Ah/FGvDkElOHb6cn4TTDRgi3YjVNK70DMbz+iVJquglV6oc
         01D0+Os8kPBY+skrUdCI37Y6Z6/+HHqRodmpIXh+HBMgbIToUqw4jTpOydH1hwoXzgaG
         flCvcVUfWw42VZEzaWzqt4XyOEZ8AHCh7fBy6g7YDnTNbFC4L/vMGdzYUtbaWamUs3yF
         dH5FwNomD5R3ksd9mOvfzm7UG7SOxUuv3A66fwEzQVic/MKpGPc3vCSO3Iel1H/CMDel
         bLryLDjr9Sy5zHO+2rG6JKCCbsdsAB0Cae09VvwVhKbmP7sIOfRxsOl+U5wDaXdyi7Zr
         1TWg==
X-Forwarded-Encrypted: i=1; AJvYcCXGE24VZDYlcJUIeBNoMy9221AI9KPxuaZR6IVkKzeDfB2QgaDLpc5UVgJBE4ppDXHAcSNHA46BUIdVJ5l40PM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeN2vwJJqYD2J5Dw+XxAGPt1eBDSXVMv7IRr9ymZF+bkbT66U1
	I33sBbrtQmevuQuD7QqFPlzDaRjji6yaG4E2R9/J+wju6Lx813ia+kRe2b7ANpOARk67wxlaNfr
	paFNNgbNYivwIwwjvEgAcHmEBqAlO5y/A9A2LjA==
X-Google-Smtp-Source: AGHT+IF+o9hN3tl3XbFpu42cVZG80YygQjNFkPcISTjUO3DEVe8SRqj6y+iFAhnwkLoQDIpv8shkVuALVztjhdYdHhY=
X-Received: by 2002:a17:907:6eaa:b0:a99:68a2:1efd with SMTP id
 a640c23a62f3a-a998d32876emr306530966b.56.1728510532251; Wed, 09 Oct 2024
 14:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009200528.36343-1-everestkc@everestkc.com.np> <263ceb04-f909-45d8-b9b2-5de86617ea25@stanley.mountain>
In-Reply-To: <263ceb04-f909-45d8-b9b2-5de86617ea25@stanley.mountain>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 9 Oct 2024 15:48:40 -0600
Message-ID: <CAEO-vhH29Xepao5sPvT1qAWfz-w6C-2ajLhhFzmiqLh7gvKMVw@mail.gmail.com>
Subject: Re: [PATCH][next] fs: Fix uninitialized scalar variable now
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jeff Layton <jlayton@kernel.org>, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, skhan@linuxfoundation.org, linux-fsdevel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:45=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Wed, Oct 09, 2024 at 02:05:25PM -0600, Everest K.C. wrote:
> > Variable `now` is declared without initialization. The variable
> > could be accessed inside the if-else statements following the
> > variable declaration, before it has been initialized.
> >
> > This patch initializes the variable to
> > `inode_set_ctime_current(inode)` by default.
> >
> > This issue was reported by Coverity Scan.
> >
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
>
> Fixes: d8d11298e8a1 ("fs: handle delegated timestamps in setattr_copy_mgt=
ime")
>
> Maybe the WARN_ON_ONCE() should be updated to check ATTR_ATIME as well?
I am not sure about that, but even if that is necessary. I think it
should be handled in a different patch.
> regards,
> dan carpenter
>
> > ---
> >  fs/attr.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/fs/attr.c b/fs/attr.c
> > index c614b954bda5..77523af2e62d 100644
> > --- a/fs/attr.c
> > +++ b/fs/attr.c
> > @@ -284,7 +284,7 @@ EXPORT_SYMBOL(inode_newsize_ok);
> >  static void setattr_copy_mgtime(struct inode *inode, const struct iatt=
r *attr)
> >  {
> >       unsigned int ia_valid =3D attr->ia_valid;
> > -     struct timespec64 now;
> > +     struct timespec64 now =3D inode_set_ctime_current(inode);
> >
> >       if (ia_valid & ATTR_CTIME) {
> >               /*
> > @@ -293,8 +293,6 @@ static void setattr_copy_mgtime(struct inode *inode=
, const struct iattr *attr)
> >                */
> >               if (ia_valid & ATTR_DELEG)
> >                       now =3D inode_set_ctime_deleg(inode, attr->ia_cti=
me);
> > -             else
> > -                     now =3D inode_set_ctime_current(inode);
> >       } else {
> >               /* If ATTR_CTIME isn't set, then ATTR_MTIME shouldn't be =
either. */
> >               WARN_ON_ONCE(ia_valid & ATTR_MTIME);
> > --
> > 2.43.0
> >
