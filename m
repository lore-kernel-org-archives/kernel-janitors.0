Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3876153BD9
	for <kernel-janitors@vger.kernel.org>; Tue,  6 May 2025 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551843; cv=none; b=s6amQ6C6W5sPGmH3xLKnHnl618C3nuYN1KRYDSNmjsoA1sWbJwN1fcjTRhqEw/27BNQs7piypBkU9YCnhlxiyOBqeGDgBkY33iMgrDQAkZ/LyIpQ1GTwLAzzdj43akSN7zfryZ4VvQlZQ3tBO4Rioit5zExWo3XPaLNsXrJ08PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551843; c=relaxed/simple;
	bh=Y1D/Ai7Th8b1ulsQV8Rw/WzGuOfLtn4luAEIHycJPbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWmDNfuDOiA++NcGUbVYSMSlEHdVp4Pn9PvJkwD95gD277l3IUgGGBYOIIKIVw0dDwp0bsjrvae88P1TVdI+aPY3CwdYxlcWn1KS+UHGyR9VOpTtJs9KOndBliI4z4WrRPjvL9s37ze45PkBJBKNxsNh3/o/yxjAFe1eWLPzH3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ho65UNVd; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ho65UNVd"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 25EB53F215
	for <kernel-janitors@vger.kernel.org>; Tue,  6 May 2025 17:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746551252;
	bh=WQHjxQ599keg+lxgKKgv5hY1aqkd9MG97ygANGkcWy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ho65UNVdU0TpPIDaxVPqfcJu4n9rDTe+VYQXTwEXp7ZlNznz/9ZN+dNTZg9QXVVrF
	 tOuFdujAwkh7bY4c4tDKO1d1Y/ZB5QjVnK5nVWpGiSmo8G13p2saoKAvweEqssS5BQ
	 R5BupcqBqfXrufv5dYiYj5+zHSeNgdthCp3fjKr4ZC8jyx17++vmkXEApIhAE9V/6V
	 KZilmxVpmgpp+dbvEIgEdZ6TJUncm2x4nMFBSAmSCeiWIVzWEFfBmJXfZSEliVgDxM
	 k144RnjVtpSupDG3zSpOeXLoxckmGr8uoHaPvfsZk4Qqvw5e+CTpB29sPJPLURD13E
	 cd889P70NJmdg==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb66d17be4so479482466b.2
        for <kernel-janitors@vger.kernel.org>; Tue, 06 May 2025 10:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551251; x=1747156051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQHjxQ599keg+lxgKKgv5hY1aqkd9MG97ygANGkcWy4=;
        b=qYA/M7fo7R89wIVZKL+PycAYye7MwiDBPsEKOz/SCnxaqDWc45KnX/UKduGRFI+Pz5
         GZnpK7Hb9RNGvqdR9kf/vHlOsJUfV6UIICHlG/4NB/5urUfmSMUoso13LxblNpcd8Fuq
         WyzbmsF65yzR8RkYs4xvY83zqgQeMKnY9KIxrwyKPAgS6rdZq+QffjxgP+2O+OLHT3St
         B/wU/95I7pguMyf8Voj0S3E1ntDvZNaXHlWq4J6hswXTBLDMH8mmqpcxYavuVkb8xRQs
         k5n9y83QZGW9HmPIQxKzmd6L4uXblovpeSmKYxLx+26pt/PbftdcIOcluK5D511duhDZ
         Jodw==
X-Forwarded-Encrypted: i=1; AJvYcCU+ufkMuPvgwLIo7l0fT3JtUel1MZgPLjIkGA7n/T9O4ZxgBSG+ttTiS01yE4BzW969NSyWahl+bak5hvKnFFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZud3f/OxxOTFiSME6EgjDq9amLLuLhlS/L8Tb2uHDkj4HwS4R
	YHxFTildaX+Axh7NhT8FXzwVQ/GoHcxhSDVOmfT7bOhv1N7o93wq3wTjE6U1fMg8tcnzAyojolX
	kt91k/Prco2nbNFiAS3Bnxe6Iw3oUaKT/SX/EBN4R7izG5mD6c32aE76WnFwBepHbgRZOqnLSyp
	3p2HT6FGPcgUxIYs3zmJBPUURFfK/Eo4xLJLPYCOLI/3ekU5VNl/VT7NRN
X-Gm-Gg: ASbGncvkx0XltRlJEvOmJEQ+R697wJ4SwkI/jiB4w+RLUSXMd21fmuFuij/VJ9op2Rl
	XpbZubJE0ZNYKYqUoo6505pCcxmMAAf72LAo7cppFYo9UXLvTiRYnr60/CcM/HC25RUaB
X-Received: by 2002:a17:907:a4c1:b0:acf:c80d:ad81 with SMTP id a640c23a62f3a-ad1e8d03300mr24484566b.39.1746551251643;
        Tue, 06 May 2025 10:07:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEELCfRqIOuYUnndVtrp9GHbcIPFv6oQ0mX4mJunFchFQKzR4N7i7UxFMlcDKaCqsfET+x4XtS3/doFGJc8mF0=
X-Received: by 2002:a17:907:a4c1:b0:acf:c80d:ad81 with SMTP id
 a640c23a62f3a-ad1e8d03300mr24480566b.39.1746551251309; Tue, 06 May 2025
 10:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506170425.152177-1-colin.i.king@gmail.com>
In-Reply-To: <20250506170425.152177-1-colin.i.king@gmail.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Tue, 6 May 2025 10:07:17 -0700
X-Gm-Features: ATxdqUGnt11yRJyWyktYtIrCkZT5mDo5sbrkN2hZjNJrjV5n2rzCVahg-DNhbLY
Message-ID: <CAKCV-6uAdn9SvUFrYqGo0ZzJUtPAYgRFcfHPgmrG_GDt2Ob6Hg@mail.gmail.com>
Subject: Re: [PATCH][next] apparmor: Fix incorrect profile->signal range check
To: Colin Ian King <colin.i.king@gmail.com>
Cc: John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 10:04=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> The check on profile->signal is always false, the value can never be
> less than 1 *and* greater than MAXMAPPED_SIG. Fix this by replacing
> the logical operator && with ||.
>
> Fixes: 84c455decf27 ("apparmor: add support for profiles to define the ki=
ll signal")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  security/apparmor/policy_unpack.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy=
_unpack.c
> index 73139189df0f..e643514a3d92 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -919,7 +919,7 @@ static struct aa_profile *unpack_profile(struct aa_ex=
t *e, char **ns_name)
>
>         /* optional */
>         (void) aa_unpack_u32(e, &profile->signal, "kill");
> -       if (profile->signal < 1 && profile->signal > MAXMAPPED_SIG) {
> +       if (profile->signal < 1 || profile->signal > MAXMAPPED_SIG) {
>                 info =3D "profile kill.signal invalid value";
>                 goto fail;
>         }
> --
> 2.49.0
Reviewed-by: Ryan Lee <ryan.lee@canonical.com>

>
>
