Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B391C54AF
	for <kernel-janitors@vger.kernel.org>; Thu,  9 Oct 2025 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023812; cv=none; b=FfbbsdLJh3Li7m/QsRShEB6PGH+sCXKRqPivcurdsx7Z0lalutEdzXfnnKq4ENN9p9grBE4aXeCX2JZ7JKgeEQWRxuA+4fNbyeatqAmDrqk9M4vwW6jEJg30KHXwAR/t7H3pLrF0cYi0fgY8yX08VXEHnAoRuAM1lAs5lwZlfxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023812; c=relaxed/simple;
	bh=xKdHY98uifDCA/ZQ54Qd29uwoqQwdPCP6AZELTJbBvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9QN+vOPSncngdA7eJP8cCr+w/qlBJ2i2zlDsHdotsTdKxa3WBODA+PpqDgSEPtJ/EdczS831cPJkcn/5m4Btnha6YNYInImVBia/rxFN5tmLfFKrS7DKkctm4dqqQmg376nRbTYAaB8Gi2MFV7i9rCfoIA2OEsgbHjsnNip3HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lihEbgME; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lihEbgME"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-879b99b7ca8so12660176d6.0
        for <kernel-janitors@vger.kernel.org>; Thu, 09 Oct 2025 08:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760023810; x=1760628610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K/OkTfxaQVQjtAI923mEKQkdyC4/Ch4flZGg5G+nto=;
        b=lihEbgMEpSlA5LSNoA9Qp9VepM65F3cxM6NZN/eNaRMWaYFu7pQlUnnNl6K5bw/0EX
         trWDdJ6Ke3Mv/19+6xR1t5SDsu8TFJgaUdkFHyCly7Cif7zgmjUdVf6x2XWS6A621If1
         BmU4PoYpgxl0BhbALg0FqpIdWpRV5L4l/QNAGjFOu5kjyhrY3OnB3Tej+z8in8B3xrdH
         dE93j/mteX93Ud8/ily/c5XJXe1wqj2fxiEV4bmflkX3+oI6jFB/s3P5dj/h52X+VxQ0
         FeqX1w3/BJYvM9fepsETt32d+dyVIo099qaKTkrB0uzC+yZy/GoJwCPrxgl4obz25q0s
         10uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023810; x=1760628610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3K/OkTfxaQVQjtAI923mEKQkdyC4/Ch4flZGg5G+nto=;
        b=LucZInb3oDtVRmPLFQf2KgQw+P4c2CU41flsFVZuy1PSPhYSaKhFG/7qcMcQZcD53P
         4yVmx2aqULOoOxTG+inH90ewKFz9W8U9bUgOkoell/4pGUdNlonV2FkNlbtA8tZczoOG
         yuiNRXCuouyNP2aDOFlVNRjpx3RLjPx21Ayrb9tC7juxp+dBURA7SpYAMUrrgT6vUIKN
         Pg2Ai8DKDq52ZbpfcUo4Uj2eJfIQ2SpPsRbT9AH96DpRPWfEKIqrSEojMuhdk45EPIsw
         MhneRwnvFEJQZmm9yoLklfMlowJRH/0TKutzgW2qG7mB89tMjZH4NGgDZfwAL+P/nmgy
         kVHA==
X-Forwarded-Encrypted: i=1; AJvYcCWFhWoWsTEqbk9UP/SxuawRPzbIeI2z9yzocOAtQLJp91dJrRX1zpkiRSRG1RurGfPmVslTLHFWGoR+RJGVV90=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTnR5PS2O/Gd3UcYTT9D/40bQCk0hBFpuHYrK9sLdkGihziM8Z
	VC6qg1bOYV4FAcYV44QalOjBynlHDExY4YMl3s1v8c5AFvzY+hDeK7xuWA9jI1vKsSL/2Jp/pZq
	8I65bFB5sfgEfOscvgGACF/RO6CTh2Ks=
X-Gm-Gg: ASbGncvBZ/3NLbaRYNqmvleK8QF21Xy08/IqkgQM77SFFCXdpTzjZnrlpWA0Z67jL4r
	nhr55bthrm2NZzCd/36yGtC/bh8hqGCuNvsTAAci3AjLNRMYmbNRD4fkhPQOMATpoN3NAyjNIYJ
	HXZBIk9lkZo0ApWxgFFHZLu33JsOZJCT2WJiGryEsL5x+zJprtVpNFU1lFf1IdwhCbp06IQ7LKg
	gG6ym3UpvE//qI+wUpHmPRNXJksX6ZKy81VxTC2BPjdy27IIpOkQtVvts81B9ijx8vTJwuj5O9M
	AZKx7OQDX5pNfk0l0rs4cvX5GCTaMg8OTkraUGyZfn1vnhAnBxZbNtJaniox81fnnPpEG9bZzTm
	yxxoxqf2Tdl/TQ8Ple+RQ6yQh9/ttyVlR2yfQWYvGKuJWWtrhe92rJYW2
X-Google-Smtp-Source: AGHT+IGJdcJchywsY80gAXJqF2Dh5hkmMc+nT1QmiKbYTO/FxvtFxR8ICSKzlj+TOaws0AV2aAY8SzOBjdCxSsbgzqY=
X-Received: by 2002:a05:6214:484:b0:7cd:91ff:6215 with SMTP id
 6a1803df08f44-87b2efc2c6dmr99245676d6.61.1760023809944; Thu, 09 Oct 2025
 08:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5b95806a-e72e-4d05-9db8-104be645e6e5@web.de>
In-Reply-To: <5b95806a-e72e-4d05-9db8-104be645e6e5@web.de>
From: Steve French <smfrench@gmail.com>
Date: Thu, 9 Oct 2025 10:29:57 -0500
X-Gm-Features: AS18NWC3ORxIiPJ-wdFN48myFn8Rs2UbLqRS_MIq9LzeT2xWYlDBUeIINdVmdKk
Message-ID: <CAH2r5mvg=kqPyA2nYF=Nhjr3vkt4dT1R4p-Bk_MBQtddjx_EhA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Simplify a return statement in get_smb2_acl_by_path()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Bharath SM <bharathsm@microsoft.com>, Paulo Alcantara <pc@manguebit.org>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As pointed out by the kernel test robot a few minutes ago, this patch
would introduce a regression (uninitialized rc variable in free_xid
macro), so will remove this patch from for-next.


On Wed, Oct 8, 2025 at 3:02=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 8 Oct 2025 21:56:34 +0200
>
> Return an error pointer without referencing another local variable
> in an if branch of this function implementation.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smb2ops.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 7c3e96260fd4..bb5eda032aa4 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -3216,9 +3216,8 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
> -               rc =3D -ENOMEM;
>                 free_xid(xid);
> -               return ERR_PTR(rc);
> +               return ERR_PTR(-ENOMEM);
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> --
> 2.51.0
>
>


--=20
Thanks,

Steve
