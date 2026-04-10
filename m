Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F203446CA
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 23:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775863435; cv=pass; b=dzR2Oqi4FvQzo23NP/VA1UnkprGmirlMxhGssUneiRd7wMD5k7Ch5DF9dZzoRCHyWveaDkpkc9t7sI1Dv1/dG53w6B00FPDitV92t+fcEeE/JFA9iXdpC44ngJjL9ispc64ORBHQ+oKJna7xQ5JGmgAU+rci8ne/GNskcceb1wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775863435; c=relaxed/simple;
	bh=Os0BCB17opKvNzfWaWmy35HOKb/otcD9H0RdbQOsd18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zjeky4aIDjuha2jjiTNf6Ja15+xEgiD3Jd0IIGYvnKy8Los2bk0yqSY8Me0kg+ocNaFb5uscwhfc3blTlxd2WpkZwdR2ii7aB1z0jXamIEWPy47D/YWlV9EFcRtVJpGz4lftx63ylOFduVgW8xBsnG8t9nY0WsS3jwbF/PtnXkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfCFDHpd; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfCFDHpd"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so26961701fa.1
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 16:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775863432; cv=none;
        d=google.com; s=arc-20240605;
        b=gU9G6lQtrkCaV70z1yLgjsVXnWqzPOouFhO6iOFD5ChSLY0tkFt20RoY9o4dgenoqF
         V88SAYDS2HB7a/WDt+2nzC/F45XPFLnWouDeq0CD4Ike+hRC73N/63xL4rGxpR0wU/ey
         jgsmmOTKyDjZZCWewki5ZEB3hHYwyhRArKcwYldsKyJX0ACjqVGHHlaZtZSshTc3hIVI
         g9EpI8R/u+KEL2MUEQtDGzNFl366Rr5Yoa4M618MgXuRzQkca6tJG73tOapAvnmdBI2K
         /JGkXmvRzuQvI0roJLSY+N+IbUYgePvBtYdb1qbjLfG0Gc9kZTwYfJFQLXTaajkVZ0Fu
         lSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DMaw5i2hxWOm6x4SzpF4gNjjqFipmF5/iEGGBkTmhWU=;
        fh=Xzk1cNFHuFJ6nLr0hTVUcjWFkVwzpbHPnJitCUmwf5E=;
        b=Sz4sP2abY3DQPaLnCp8UgsOMldyIR1NLojGA5ZcsZK+nd1kOdyF2UqLPXmUu0Q66VC
         MxuRGRjD4VFqoYf3aiwKwBOQgFdU8gT30l3QYPhff891RUFfdMJimn2AaasoV9mTY3su
         3kA4gEsyw44AXqEtCfEjLDO8jOy0A2nPk0JicAPGpvwXy7fGuSwlnEEoFm9bMKoXZhCO
         Is6uv1GKsnzgM/0wRLqyftQ8W4Oe6Ss4KIBmG4Af7+8HDetciwKVz+xP709rCA4mKoHI
         RFQF61aSmqhqXJGhhb+qvlbQf7oNfMRh/G8hs6kmQFvCkwsqZsNc2Gt43AYNjDXHtzL/
         /3wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775863432; x=1776468232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMaw5i2hxWOm6x4SzpF4gNjjqFipmF5/iEGGBkTmhWU=;
        b=JfCFDHpdNtOa6lKi27dBIwIh76EnDNFUP1k2d5UqehdXUMnP8cZR0+0+p8Ttjl0O08
         GdelU64ur11Q7FuNGpWnJKUcUOmKvWF+mdpPKyvc9feSnwLEir3FTXsH/CU2IiIp6Rxz
         oY9DBikqHLLqbJPkhKyDLd76eTgDIemLC5hxvWu/6bai+g9tG7oqam72IbP8FKbnAo0r
         2KtG+/eQ0Ty1Nd/+tase6Yr7KkrRbNyXNk5ZOHbPU04coVxSaXGDXcJFnbKGuvnuyeaw
         LZKHdbQnKBiEGyrTSBwjEJuOoJFjWYMJxaFgrLMWPKcwEcl8hGYXbquqZaE5wUCo3IVy
         u6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775863432; x=1776468232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DMaw5i2hxWOm6x4SzpF4gNjjqFipmF5/iEGGBkTmhWU=;
        b=R+gOz9JAGTuse6iFpJw7yLwJddy+IJzCGqCmy7IFfnHdzihcLL9ORztGvqCTuru95m
         deZZNAgJ0EQK+DaYjfZOcBjj5OVwQ4Es8LXi0SrPZHRNpjITz5AXOCGEIR7O8vlfXOdO
         Lnu+Tm6wNzvLYC7wZzhRKOiT9UNsPQgPRtuNWwbb1zIpN+Lj5b5MRnFJNfpD4M9HsnDi
         QvtD0oGDBsvh9p/iPOwMr1cobQLSH3GhxxN6DXzn9T6ktl1X120Mn6l504kh5cg+6jml
         /j2pUZrjtrbSpyzwEJYdBCz/UBZ/jcmonRVUofbwEtKOjUK+BKj0u5tJeS687vbEXDiz
         gj2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUY1eA+NE8IKGjDPz9JFMkhTapmV8I5TR1eo4RRVa/e8HkMXXwOu4mBMZZ1lbjU1F4ajFFlmpzdY8ZiwKKG+7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyWSN/drTYvdXNRUqntD1Tx87Bzq69zLdGp8Dp07HeE1PnAdb0
	6YsGEMJQRK8C4D0aZ8SuBzKo2owT7SCVyIyDcd2T6n+Ke/SxjEr//yAaMNopfew9upFzAV4KEYe
	SE2QLibpVXL97ocdhPx1WdipVz2UG11w=
X-Gm-Gg: AeBDiesfVbU9ZXmXcKAL2CyigNUqVpjRuZdChGZhkq9yN70pnOYHcnyjtUGBA9plNiS
	vkCi0niFiXUAhZbIMQSXMEQmeTznDbrOSyIu6Dr9UpH3nH/5OxQt2LWltVxWLoNuAtmjow1J9mQ
	Gm9Z/gu8KTdiFiaOw83sqUvQnmeKMlT9MNC90n44L7j75JB9B4YnFxk8U/PJrJ0/w7QD25bkZMz
	lP858Er+Lc3IdIXx3J9/J+VetNVNf40z1DVeopRLED/IFF7omJVfWDZMrpY0gqeGlD41oPAjZUB
	Pypxe6vpiw==
X-Received: by 2002:a05:6512:1285:b0:5a1:885:1dfa with SMTP id
 2adb3069b0e04-5a3ef90436dmr1879326e87.13.1775863431596; Fri, 10 Apr 2026
 16:23:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adic_St-SP3UONMV@stanley.mountain>
In-Reply-To: <adic_St-SP3UONMV@stanley.mountain>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sat, 11 Apr 2026 08:23:39 +0900
X-Gm-Features: AQROBzBhLpZG-I1c_Bu4YQMcsFFScuG3SLWCs6sXVpoZNk1o0cnTBlZ7Klt6YCE
Message-ID: <CANFS6bY_9YtCSpATnhEqzZKv48g86Sk4Cf36cVvLgZm3gQ8Bcw@mail.gmail.com>
Subject: Re: [PATCH next] ntfs: add missing error code in ntfs_mft_record_alloc()
To: Dan Carpenter <error27@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 4=EC=9B=94 10=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 3:47, D=
an Carpenter <error27@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Return -ENOMEM if the kmalloc() fails.  Don't return success.
>
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
> This email is a free service from the Smatch-CI project [smatch.sf.net].
>
> I have wanted to avoid sending patches but it was easier to fix it than
> explain the warning.  :P
>
>     fs/ntfs/namei.c:677 __ntfs_create() error: uninitialized symbol 'ni_m=
rec'.
>
>  fs/ntfs/mft.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index bf028c1aea26..0c545fd08b66 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -2503,6 +2503,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, =
const int mode,
>                         folio_unlock(folio);
>                         kunmap_local(m);
>                         folio_put(folio);
> +                       err =3D -ENOMEM;
>                         goto undo_mftbmp_alloc;
>                 }
>
> --
> 2.53.0
>


--=20
Thanks,
Hyunchul
