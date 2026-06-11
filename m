Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BF830C619
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210054; cv=pass; b=q0i5ZaHPm0SnMutnR/cLhsnxwPlLwxlulM0OKqc8SJHerUEvMJDvjNi/g+6c0wXFAhkE528dZYGT2I04KS2JSGZ51okii8d3u/Niz03M/l9JTVTbQNEFXSJ5h54HKQCPqW5R/9kgPORA6ucub4OfjvugaIMJ8oS2OVcEWRI1Fm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210054; c=relaxed/simple;
	bh=+k9Qjy1NkF0FDiPkGEmSGqZVWGbN48lhI4YAZOO5Z9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEEIezDzIyWSCFHvgCLkm+5O4LQ81ScpOSNyLFLixlYxDAXi+uFct28735J7XJOSmClGKt5vuk7sGI8JdJHQRshnzuJgoolZevGVMIMrewH15Q0+I/deTZiYEq+8oZX9fl0hqdSnOFRYUFNAJAEmFrbpO7PIvRtkGvzY8VTeqFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5wshO8B; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5wshO8B"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68dbd44fso182758e87.2
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 13:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781210045; cv=none;
        d=google.com; s=arc-20240605;
        b=bMUotVlnEit4bzYfsLLQBZgt3J5zaV5T/u6NGmdEdOYT9BNZKFNpn2uBqZCS8YOiIj
         Eybsw+/xHyO8lwy9bgnL2eo1z3boQEdptF0wdH4oTwnKxYDuNSLJGIFNibhtDmxJaT2C
         9R5fctUV4Al3kIhNpNxnvbbPNtuhQC2DSpzgaOQ5N7EIAhzgOWI5XxmkTmLsW5cX9XZN
         lHIzRHdRGp3D48FOzjp5VDoAz5a7UNAyT3fMWwHvzhFl722RqCioCHQxYvntVYOAM0w9
         3M7VdfoDYxzGP/iwmhljn3XImicrSQEOIxL3KOK+/h2PTfixll8DpvnvJQ6OsBqXyayH
         o8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VXgpEb7Jl6rYUuemLw2bRvtLoodxIHoILodPUeD0OiE=;
        fh=nmk8e+KZQrsdIqRNWXb6voeuxZIKEYGRFhZ+/0eHhB0=;
        b=Iz8A+cp15ltsdAXLok1ZLYsg76LthRcf0QD8yvzWEd9Ziv3G179Xnu7ewchTjKA+cE
         YyeIZIFGxvtdeyhmMppXUKEmv0uV9Jtwp6Sns3uizCmMn5svEa+VhZw+cluwnLpz05Kk
         t1k18PTHl5JYfkO8FUTwbF/ycCIE9BQCtole19+SFrdkvN68/rjgJ3difNINqh8r4apc
         17fKKiBwP/76+NHRJ3TGEHbOmH6vwPlaYWY0PHM+gIlw8+pNQbLO5f3vzi2lXTZnlIFc
         CJT17lT9Aaa3uCFk56cRakBpwgYkNnRyIYfQDOPlcgFbsKOyxaX9nk/MtsiOgm/OV4Xt
         QsjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781210045; x=1781814845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXgpEb7Jl6rYUuemLw2bRvtLoodxIHoILodPUeD0OiE=;
        b=P5wshO8Bkr2jXP3OfF+ta8++tZQnze+5aUYtNpuOxocg3g+8xbfnnjUUAPZi1aml2m
         pkvmCeZQ3zFTHc2D+ZDgiiQb5n2t14luKs5H1fJVy4cPZaBiQBvxFa4anTXkCBKHGrLX
         he1zuvBbaq6Q7DUAdCKsgi53QaD+RKZsWfpZscL07Xg/LcBj6f3p3YoxQ0BlhfX4I/DJ
         MIH8VlT511umTEtrZvJFbdH+Gp50HJLXKybfLDZhMaSJqU2LRFXIQV5PS19E1o6z5Pwo
         8Snmi9+2j2WV5Q4CFEv2sGmvY3nZ2YNs1PISpbMH+YKg1M7s9h5r7kXUcRp+z5i0EprU
         JCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781210045; x=1781814845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VXgpEb7Jl6rYUuemLw2bRvtLoodxIHoILodPUeD0OiE=;
        b=lDXJAloteQsgKHmc8IqT5o6FCM0AIDV17twiNjnQiGlRuMhw4yTmvQQ/09BHMC6sKr
         E+hyDy4MwqLh8UaatEfpyZp6JAu8JlFpJK4TNzRP90ybG9b5XGoPtGA85ZH/gnL/OJz7
         vZw6tXCQTjf2AcILg6NeKcQOFENUuFU7c/qmXmR46Z88aFcTv9kXd/mu1Gjfj1GxHXYS
         aGl5Kc32saAo9yU8cGPc6GnRrdOo3nECauBMJeS7meuhrWC43fjUVwE5n9fsOKm68uXe
         T9cYyyrN+caneOScJpBkTm93l9rYnZzj9V4l3Ks0bhphmZdGNUBM9KMEdlc4fROXaLjF
         Zz6g==
X-Forwarded-Encrypted: i=1; AFNElJ+hAIEFE0HwAhm00zlCj3RnbZOGmCOC95+LGrbkZRDm8oFLKK0nUGcd7WiyYsa96m3mQqk+PAsj5wd7DgypJfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YztdoHPI80Ti85VEqlb031bK+PwWcq/Huu5fUh2wBqRnWQAO7sU
	mzwpZJfe7edgE2P3vw2SofwOBsKQGQ9HlyVDo0snKwH7Wn/+MXR3QiT0xWOmKzWPJ2B2LpkuQgK
	ckNUVRspqMyeEZsaVorLOIi0LtHgcrsA=
X-Gm-Gg: Acq92OF7x+nOXjF6u0GQuKQnDs5zhDOjMsX96FOjqtW1QANEYGs+1uBMh/Kb6aiYAiD
	VncTKQPUfLblyMhO+irf0VGtpcGEAGpH7b21g8V/lThQZEmLJ2VwEbedfP2wJQxevfiezMfLaDU
	1xx3xi6qdCzbQr01UCr92tqyboOeJxnxxuRjTsn91ipjYcuBD+dLOncGurQpt8/B5DWXm/thUbI
	HyxRjmmRxBEml5gTt+NonJxTLRgw927281AXz4p3un8YvQJNt3jfYQi2YwWXmjEWdVeKC9FocX6
	jJwx2gfQEouFKumJWG1jrSTqNKORtEOAPX6oEuys5+mIhOPU4fY7GChLlj4TdP1bx+T2La89SWb
	qpNcHLM9BajzKr0bf4vEiPR2QCQ26tPXCs5nOCHMR1Cg9R6SPals4TcaoCyUKtH7Eitb80Woqgq
	TxMUc4BuUDDEKJ9k1nsryY
X-Received: by 2002:a05:6512:230e:b0:5aa:7ad2:f4d5 with SMTP id
 2adb3069b0e04-5ad27fb780emr1375910e87.38.1781210044818; Thu, 11 Jun 2026
 13:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aiplG8fGQOYmXS5g@stanley.mountain>
In-Reply-To: <aiplG8fGQOYmXS5g@stanley.mountain>
From: Steve French <smfrench@gmail.com>
Date: Thu, 11 Jun 2026 15:33:50 -0500
X-Gm-Features: AVVi8Cdu1uKQmjCfULGU_wu_t2erX4cmfDuYdIGcEcJxfNgKRpgUCSSL2tyI2Ps
Message-ID: <CAH2r5mutN9yDPF8Q=z_GYbgAzJFS6OE+2zBd8na9zY1Wbt3gyg@mail.gmail.com>
Subject: Re: [PATCH] smb/client: clean up a type issue in cifs_xattr_get()
To: Dan Carpenter <error27@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, 
	Shyam Prasad N <sprasad@microsoft.com>, Paulo Alcantara <pc@manguebit.org>, 
	kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org, Tom Talpey <tom@talpey.com>, 
	Bharath SM <bharathsm@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Doesn't your patch need a cast in the following code in xattr.c since
it returns a ssize_t and you changed rc to int with your patch?

315                 if (pTcon->ses->server->ops->query_all_EAs)
316                         rc =3D
pTcon->ses->server->ops->query_all_EAs(xid, pTcon,
317                                 full_path, name, value, size, cifs_sb);


On Thu, Jun 11, 2026 at 4:00=E2=80=AFAM Dan Carpenter via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> The cifs_xattr_get() function returns type int, not ssize_t so
> declare "rc" as int as well.  This has no effect on runtime.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  fs/smb/client/xattr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/xattr.c b/fs/smb/client/xattr.c
> index 23227f2f9428..5091f6c0d7fe 100644
> --- a/fs/smb/client/xattr.c
> +++ b/fs/smb/client/xattr.c
> @@ -272,7 +272,7 @@ static int cifs_xattr_get(const struct xattr_handler =
*handler,
>                           struct dentry *dentry, struct inode *inode,
>                           const char *name, void *value, size_t size)
>  {
> -       ssize_t rc =3D -EOPNOTSUPP;
> +       int rc =3D -EOPNOTSUPP;
>         unsigned int xid;
>         struct super_block *sb =3D dentry->d_sb;
>         struct cifs_sb_info *cifs_sb =3D CIFS_SB(sb);
> @@ -354,7 +354,7 @@ static int cifs_xattr_get(const struct xattr_handler =
*handler,
>                                 inode, full_path, &acllen, extra_info);
>                 if (IS_ERR(pacl)) {
>                         rc =3D PTR_ERR(pacl);
> -                       cifs_dbg(VFS, "%s: error %zd getting sec desc\n",
> +                       cifs_dbg(VFS, "%s: error %d getting sec desc\n",
>                                  __func__, rc);
>                 } else {
>                         if (value) {
> --
> 2.53.0
>
>


--=20
Thanks,

Steve
