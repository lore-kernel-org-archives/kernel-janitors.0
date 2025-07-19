Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266D4270548
	for <kernel-janitors@vger.kernel.org>; Sat, 19 Jul 2025 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752931796; cv=none; b=Do1CIcl8dCU4hfm/x2MDIm2JU9opkRpn3IpzBvF4CLZgMz9WMFxyp6+//TV9FfMpR29cmSaG8ADD4ghr/PKF3P3GfBpH/CjrVU/XSMzojd3/6zjBgb5d4vM/lFYp6lhHa4qFcXKgMuYXunCGsYoN7gnenmvH+l+r82N8n5WfCSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752931796; c=relaxed/simple;
	bh=whJVn6VSMC2cD2DwHewKa7SpgnwQzzGtDP72KQTJahM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqZKuGvEtvdHwROS1ENHcTDOUYXHziHXWFWLY4H4iP28EZN+xXe4LJgqV/Yr23U9CZIAHePFF6UkrSbhPacBTKzHEE1xdbGtqWuEPvTZsVN4oJPEcUR56cOu6LOItgLhguAlc1mn0OtTAsTEdHjt+UxCZDfZXc0OwLkZUkY/0Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com; spf=pass smtp.mailfrom=omnibond.com; dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b=I7cnITWw; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="I7cnITWw"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b170c99aa49so2084568a12.1
        for <kernel-janitors@vger.kernel.org>; Sat, 19 Jul 2025 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20230601.gappssmtp.com; s=20230601; t=1752931794; x=1753536594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZOOflxBKdTH5b7sIlGbxa3QYBsytIH9IOezkOXa6OE=;
        b=I7cnITWwD3XHvsOets6aUl0LdkqNK2GUJcSTFRuDUJ1uS3fx74Qx64dEyANyEwHfD8
         AdtWde5dWb8tXSwxteV1Uz3z8zxlDdCmR5rTHk0nuVNYBuQwDb4DdOtrgGMyQLF22zKT
         QDltqkliKID0aAbzckRzQeP7QnbcVtRArOdo24GXZbtPfRJRWdY4QdnquP0QZPN0UjXB
         JVGFsXJexGzrSHpoxtiFVoadVR0Rfjb+LOU8240ihj2mxZkQ3JK5z0EOSyftQmz1JxW+
         AkaelU+vBkX5qkYQxxZl88hYJCizHkz6eHIPkkZzISrH+lALhgjYhQlWQslUTs94jAD2
         7RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752931794; x=1753536594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZOOflxBKdTH5b7sIlGbxa3QYBsytIH9IOezkOXa6OE=;
        b=p3mfmAWzoXkqh9y9vtNwpuY99+UtGFHrPaom6joM/1c4w6EQ7q4n0GCuoKeE0rYwXv
         PgI44F84/Yn6EjQJOTrw3i4pHM+oJfZnyNYCo2feevFok4Cp5tsqhRm6+o+NS3Z7kDf1
         aBzG4Hs3UBnSujvcACEhqUsW6RHHWoVgfpedQnwhPhOuv+nskwu3Z6Z1XhEuX6umKMfc
         vzRueXJ5E0UoaBt7FIsoJyqXVDNROLEQYx4hpRn8HmAoa09+L0NqLk8XBkZuLD2mw/bn
         u+dhU+m6rkAMBiXOQ8qbSr74ZBk/4n82aAWJABLbX8wozjBgK4pBUkYDfUbUc+uDmjLs
         wZmw==
X-Forwarded-Encrypted: i=1; AJvYcCX6p2puPjaCox+1IvOdjNSc7sCYAhZmO9AxOt+gp1n4x08lV43rFY1a6GK/HMqymgzkQbTxqqVVefL4JDNS9T8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXX0EBIOOgMy0w6H5bYAie9osJwuOFDfBvw7lmi08E2lS3c12L
	4pQFLU8zmnxrb+4ft0atvCX8zjtfbSsUgd7NTNE/gpzZsM+Ol4lFyyGt98854hWGXRmST8A1Nfr
	Xa3h3eRq+yateFcTZV6J8vyA2M/OC9pp/vwGOnlZv
X-Gm-Gg: ASbGnct81OBVgx2mPVGsQACtW/YEmTDly1M6smwHN/YT/dGWkn78POdHG9NYnOuHzJH
	W0XzrT9PJ7neFuzLL52Dmy7txanbNy/X0B/yjY1MP+vJ6Zh0QJINSBG+ZONtw2KdSROt+tRmCsF
	+2u22L3i3w6nt0Aw4vGgCTrMBKRCRdGbrT30pE3ebxS3nM3QRN/K000wztJ4lDTUnS+g4bfj958
	rlMJ1LbDBHOA+MRZfMF9+H8/JRL9Q==
X-Google-Smtp-Source: AGHT+IGTMsKtP2G3Wisl71duPg2R8F8xhT5SbykvwIvTBfZDhFArqc4cu/N0+DDO+BgZ49g18kmBZYIKUOKMHB/tIAs=
X-Received: by 2002:a17:90b:3d8c:b0:316:3972:b9d0 with SMTP id
 98e67ed59e1d1-31c9e5fcacfmr22074724a91.0.1752931794326; Sat, 19 Jul 2025
 06:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7c4eef67-7bbc-4a4d-ba10-ccf30c6afcdb@sabinyo.mountain>
In-Reply-To: <7c4eef67-7bbc-4a4d-ba10-ccf30c6afcdb@sabinyo.mountain>
From: Mike Marshall <hubcap@omnibond.com>
Date: Sat, 19 Jul 2025 09:29:43 -0400
X-Gm-Features: Ac12FXwk323ZxD0gV07N4nak0N32Rmf-A61cgZKPwrhzUMCykchXRr8i91VBpZ4
Message-ID: <CAOg9mSSnnLf_uoM1pQp4yMjd4e=q07PjBWw62ch3P+V1c--+Dw@mail.gmail.com>
Subject: Re: [PATCH next] fs/orangefs: Use scnprintf() instead of snprintf()
To: Dan Carpenter <dan.carpenter@linaro.org>, Mike Marshall <hubcap@omnibond.com>
Cc: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>, Martin Brandenburg <martin@omnibond.com>, 
	devel@lists.orangefs.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. I noticed the "returns the number of bytes
which *would* have been copied" issue when I read the
snprintf man page while looking at the patch. I'll see
about making this change in my "next" before the
rc period is over...

Also, while looking at this patch, I made
an xfstest that includes buffer overflow attempts
and other bogus input. It would be, of course,
an orangefs specific xfstest... I wonder if I
should try to get it pulled into the main xfstests
repo?

-Mike

On Fri, Jul 18, 2025 at 5:24=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> We recently changed this code from using sprintf() to using snprintf()
> as a kernel hardening measure.  However, that's still not ideal.  The
> snprintf() function returns the number of bytes which *would* have been
> copied if we had enough space while the snprintf() function returns the
> number of bytes which are *actually* copied.
>
> So if there were an overflow, the conversion to snprintf() would prevent
> memory corruption but it would still leave an information leak where we
> would read beyond the end of "buf".  Use scnprintf() to fix both the
> write overflow and the read overflow.
>
> Fixes: fc08e0b8f099 ("fs/orangefs: use snprintf() instead of sprintf()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/orangefs/orangefs-debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugf=
s.c
> index a5fad515815e..e463d3c73533 100644
> --- a/fs/orangefs/orangefs-debugfs.c
> +++ b/fs/orangefs/orangefs-debugfs.c
> @@ -396,7 +396,7 @@ static ssize_t orangefs_debug_read(struct file *file,
>                 goto out;
>
>         mutex_lock(&orangefs_debug_lock);
> -       sprintf_ret =3D snprintf(buf, ORANGEFS_MAX_DEBUG_STRING_LEN, "%s"=
, (char *)file->private_data);
> +       sprintf_ret =3D scnprintf(buf, ORANGEFS_MAX_DEBUG_STRING_LEN, "%s=
", (char *)file->private_data);
>         mutex_unlock(&orangefs_debug_lock);
>
>         read_ret =3D simple_read_from_buffer(ubuf, count, ppos, buf, spri=
ntf_ret);
> --
> 2.47.2
>
