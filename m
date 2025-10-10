Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E430217C
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Oct 2025 21:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760132873; cv=none; b=Fj4DNfzw8aM/2OOy4mQxX90J+/uCgwDOG48l1GfcXSOPWbzqa7w7UhJpBdddyCLYjI+6sJdKslB1GeUUWD/Tr1rVB6kXKHbwTVDvOJCZNC3v3cdfZ1JQc5xpSSBkNXhfHdet/a3e5pLplwaW51aJnwYYzB0hD4Zi2V+nNfjKEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760132873; c=relaxed/simple;
	bh=mIpoIuiWbWTkQzK3YQSho5nZUTLiqCNHcBr5TymQZzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T62XiegAaLH4gnwbjvyuMoODVXy3mDXTsbzfd0wkYxhkj9F0Ette6yZl63dJLt0KdDC/mQHu4qNMSG1vXD86mKH5fIklwv+476g2SrblwDoisbrrDrokJAgZFBByiIVYnRGZs5yM+Y/Ja1jqLM2EySIokb4tOrHy9140FrQM1Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3ijQDaD; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3ijQDaD"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-7960d69f14bso16112536d6.2
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Oct 2025 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760132871; x=1760737671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CR2CWtGpIxQ0lSsR8U+87pwlo1Y1um+ZQFcDhfvovw=;
        b=Q3ijQDaD2AHW/EG7DDiHVpxv+hIqECbLvbhJ0KXspevceWzPdqD1ATxDCYTDUim7Ab
         EGdz743vlKt8lwcrvYb5m+WNnwRxOxmlO0LJLumBaXVqMdHmrk6crAlidfCCZOiUc/BY
         GH2+ehwaSMIvkUUljndO68sF6AERxteYABlX6oBsk/I85s7EmGBcYoTFN7HzY7ARwReq
         vusdQpT56ODQnjNQCDYjuB5BoGDJb5E+MJnrlWgOAN47N6xUm6SbMcICux37lAoUTMwB
         jv1+gx6aqNH3aZ9bNq9ogje5CZpGGJA9jv8mGmaLvnHZn8izkmN7TZRIQxQl6rbkoEVI
         Hhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760132871; x=1760737671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CR2CWtGpIxQ0lSsR8U+87pwlo1Y1um+ZQFcDhfvovw=;
        b=WoCywPDBmWYKQkBe+pZWlKLA674tf2J2YwvpfWr9Qot6lARd85HIDUdz1zBtxqPDKl
         LW66TJU3gvg3pSDuMaU32iH+Zc7wQd7/qwJAUN5ihpwvpYw22Y1OdgUyznXiMNrSUTQv
         DGXBL2/fqnF5mbu0owlOQVdFnozzHbIaLy0rTfa8Fjh92drC36817F/1hu17jMpLVIrI
         biM0fRL/rirc4vvzfQs64b8d6MrNYJ1Do4VX/kE35IsszXm3skbFJKU3fkB5pbGtD1pX
         UyfAN9fIsfhfMiVFUITILj1MJhbhoQA977QqFQm/wwrsUGXG6th9ztCx1axcqJR+82Kz
         AgZw==
X-Forwarded-Encrypted: i=1; AJvYcCVntm+O/XEkNj4Qs9CreKuY5O9qBijKNvbwlp3kN3VO6uceVbodn6rFoUHIkprfQI2E0k7oUJjZdaK9HZeTG7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjiWQI+5dRDuuJR+pa6bAi8boSABXyVhkihG9kUr5kzCz/e2R/
	sJ+5J0fy9APbh87qBW3KQlllhU4qy6irJVSmd5sM810DpjL2i7igtCt8z37+Hu36l61BhDl1eQN
	H8UYWFGMY60t5QDiBJVYJoZFFhzsOrpY=
X-Gm-Gg: ASbGnctJpSmz+etPFPU0B6+KpkzdAzrP3dn5z3Q7WQXduTUfoNO2DGe7LxFUbh/FFDk
	Em3McMf9DpD75p3BWgkTmYQyVJkz5vazaNbBJm/9B1b6ln7EsITRfLZ5tcUge9QL2mSmo9fdx7S
	Cly6e++jycuA/l2eF9NKrRVQD/9b4dnr+dCIxNXHg/pOnMICcDxbnRF6OjaK6qjTmXDAjBJ0Wv/
	rRDw9vg/lAB2jpbhuTPuYpyqte89kQlWTdJrvDMJyvp+Ku+5bntjg/AxNmVK7yhRJ/iVTnXCevT
	IplD9CjOUM7/KNYqQoL6lJWGe/5EEG7YdoeSZqeGEo3mPHHLsF2Lk4J1zpUXKe1oLkxmP4Jcxbb
	92UW9VeiVMeK5XYJ2JLoRQmUlZGhqfSacA6CgJkgoySa4wBKw408=
X-Google-Smtp-Source: AGHT+IEKPVwEdU4o07u55ueyk8vUy2UzmXDdxkCxRSLFg22YsdbJNI49WIX6CJNsbf/SmtfBMyBAU8Q57eqBkexOrMk=
X-Received: by 2002:a05:6214:d4e:b0:879:dc43:6334 with SMTP id
 6a1803df08f44-87b2101ea49mr216502996d6.25.1760132870981; Fri, 10 Oct 2025
 14:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e8a44f5e-0f29-40ab-a6a3-74802cd970aa@web.de> <8f7ac740-e6a8-4c37-a0aa-e0572c87fe9e@web.de>
In-Reply-To: <8f7ac740-e6a8-4c37-a0aa-e0572c87fe9e@web.de>
From: Steve French <smfrench@gmail.com>
Date: Fri, 10 Oct 2025 16:47:39 -0500
X-Gm-Features: AS18NWDpFATkfplY4kQV4nikbT2tj78bFi9hHJ8bS3alHy0nVzf3BOr0-aoJg40
Message-ID: <CAH2r5msRAejKX=vo7xGxMZDG_s++zZyHTazoFomd6GKOSt1XQA@mail.gmail.com>
Subject: Re: [PATCH 3/3] smb: client: Omit a variable initialisation in smb311_crypto_shash_allocate()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Aurelien Aptel <aaptel@suse.com>, Bharath SM <bharathsm@microsoft.com>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged into cifs-2.6.git for-next

On Fri, Oct 10, 2025 at 1:52=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 10 Oct 2025 08:05:21 +0200
> Subject: [PATCH 3/3] smb: client: Omit a variable initialisation in smb31=
1_crypto_shash_allocate()
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> The local variable =E2=80=9Crc=E2=80=9D is immediately reassigned. Thus o=
mit the explicit
> initialisation at the beginning.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smb2transport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transport.=
c
> index b790f6b970a9..3f8b0509f8c8 100644
> --- a/fs/smb/client/smb2transport.c
> +++ b/fs/smb/client/smb2transport.c
> @@ -50,7 +50,7 @@ int
>  smb311_crypto_shash_allocate(struct TCP_Server_Info *server)
>  {
>         struct cifs_secmech *p =3D &server->secmech;
> -       int rc =3D 0;
> +       int rc;
>
>         rc =3D cifs_alloc_hash("hmac(sha256)", &p->hmacsha256);
>         if (rc)
> --
> 2.51.0
>
>
>


--=20
Thanks,

Steve
