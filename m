Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B686E192D83
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Oct 2024 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510433; cv=none; b=NiZzX6zO9LOejCk7GZFCtBvy0kZnoxXtZvxVjYz+0t20BlyAsbEVRtqqRMs3E7kSqo7vJ0eCyGiRie8fB5ImT0904EPIXgadeQuM3eEdoHrzEs081MwcMrJlTNRrpMi92CUCuAxE1Qt4+SiMcXq6dBL+EMcls98/AQnFSYKtftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510433; c=relaxed/simple;
	bh=WRSEJpRqVGEx1p+7xonbAfeXiywHBYSCQGtICtTvn0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gjj4K03yVxtqUAp0oivMVwuPY/VF9XVDrrgOMNmCi2rOdvBVyZZ0yyhpFi0AcckzOl69140t72+VStDd7l47hfrScuUca8I2S/URgKmmUNBsJP439ddB63kt1bcLmj3DLmOVBSV7J00lf53UhhmXhvSWPYQ4RToTGvB1PdaqULI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=fail (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b=VJfR5l6d reason="signature verification failed"; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="VJfR5l6d"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9968114422so35617866b.2
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2024 14:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc.com.np; s=everest; t=1728510430; x=1729115230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNY7/3aGEch2q8J1pUCbG8jb+yZy5FZa1A6L2jUg/rI=;
        b=VJfR5l6dtd9a/+JQt3YSOHQmUJKnatyiYlKK/SpEsJ+WUaD3I1DfHcZ81yosCdx/6/
         LK1MI9LX+vZGsXAIL5JDJbj7sOe1CXbr5nk+GQGbF+nisFeDobhWY28+AZcC5cEdh7C9
         floUWkv/R3XMzKGWiVQcfziqZ0//RhycRsCJYuMtqHC0ALrDpd2cWtgTCAAxoGa7iq1R
         zA+AFZt7VvnpvHIB4ZvIKJc94hh2v1cYgI3b3tPishACbnjJSJtTXgQ14RnYtPVqNOPl
         MjyRWUd8AjgicLnVx+0GdB3ztC4Csg+mmgrVRtMO8MsM1mvUH5W+T8eLpf8GkS810jg3
         LvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510430; x=1729115230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNY7/3aGEch2q8J1pUCbG8jb+yZy5FZa1A6L2jUg/rI=;
        b=OeEm8XizTYLT68NQy4wSYmNHxCCCEza35RuYPfmTrOBcaVPWO7hu7tjw83u4owQqZQ
         qXxiC4FyTlRbgSP7wkbZ/mck238/yggy59Bv5xbO55c51Gq6EkkQZoyqXOSWJmm5IGh7
         ASkK/38KbB4bUFoi8mlSRIMM/tHze+5yLMq9PnJ4FjvwR1oe1l6hmyj+sWxR+2jujEV0
         LmQtDct4MYqyf07JIE81pzg/9rzaStDSlK5U+kh0NpZdldMpy0uyhJ3zDyDZe2GTaHZq
         43MQuMxyKA313clhuImrkkAvoQlaXw+ofqBbQrMwVFwWb/54Kc/XXPg3EMMfXnk5T4tP
         1Pfg==
X-Forwarded-Encrypted: i=1; AJvYcCWiaKBaIhrxH54zjmV2RoutXVdSBjY1fTXuxhtqCQvzjt2DsxgbagWbX6tKznGS+edndzczFdLdOGn9j45ZY8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgQyDXQXw2OoVSpIJ7/khXDBJIxx/7QvokQqyQRShI+zCdfv0l
	KZPLcL3gj0nSPaqckIpen8kKJQ2SEPIJHoKRjeFzCCmrpq4AV1QlTWElddDVIzgDZ8ydHVIOhej
	NIwjvN6Fw7zxBH00J8EsBlfcZVjgSVFudsTBMIQ==
X-Google-Smtp-Source: AGHT+IE0zrBekMp0OzxByMeyrTa/R8Zyl4m1iSYWvDd5iqQvPvAHYK8tkB354xAtc2sJTVb+vxYrRLAQYa1UDXMGTC8=
X-Received: by 2002:a17:907:7d8d:b0:a99:497f:317 with SMTP id
 a640c23a62f3a-a999e8f7daemr122394266b.62.1728510430088; Wed, 09 Oct 2024
 14:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009200528.36343-1-everestkc@everestkc.com.np> <018e525e-809c-4c69-a948-a1278af1ff2d@linuxfoundation.org>
In-Reply-To: <018e525e-809c-4c69-a948-a1278af1ff2d@linuxfoundation.org>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 9 Oct 2024 15:46:58 -0600
Message-ID: <CAEO-vhGcPRQxzZBjDZZA4GZoWwcaOjgK85tUydvr9t7CtD-HGw@mail.gmail.com>
Subject: Re: [PATCH][next] fs: Fix uninitialized scalar variable now
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:38=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
>
> On 10/9/24 14:05, Everest K.C. wrote:
> > Variable `now` is declared without initialization. The variable
> > could be accessed inside the if-else statements following the
> > variable declaration, before it has been initialized.
>
> It could be, but it isn't. I am not sure if this change is needed.
If you look at the full code then,  if  `ia_valid & ATTR_CTIME`
evaluates to False then now is never initialized.

> > This patch initializes the variable to
> > `inode_set_ctime_current(inode)` by default.
>
> Instead of "This patch initializes", change it to "Initialize ..."
> Do refer to submitting patches document for information on how
> to write change logs.
Will do that and send V2.
> >
> > This issue was reported by Coverity Scan.
>
> Include the the error/report from Coverity.
Will do that and send V2.
> >
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > ---
> >   fs/attr.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/fs/attr.c b/fs/attr.c
> > index c614b954bda5..77523af2e62d 100644
> > --- a/fs/attr.c
> > +++ b/fs/attr.c
> > @@ -284,7 +284,7 @@ EXPORT_SYMBOL(inode_newsize_ok);
> >   static void setattr_copy_mgtime(struct inode *inode, const struct iat=
tr *attr)
> >   {
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
>
> The code is clear and easy to read the way it is since it handles both ca=
ses
> and does appropriate initialization.
Yes, I agree, but if we initialize now to the current time during its
declaration then the else
condition won't be necessary.
>
> >       } else {
> >               /* If ATTR_CTIME isn't set, then ATTR_MTIME shouldn't be =
either. */
> >               WARN_ON_ONCE(ia_valid & ATTR_MTIME);
>
> I will leave it up to the maintainers to decide whether to take
> this change or not.
>
> thanks,
> -- Shuah
