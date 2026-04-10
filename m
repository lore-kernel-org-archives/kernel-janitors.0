Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9DE387594
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 23:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775863564; cv=pass; b=n/dbDWIq9nJZn/HlmQfNxljllUoSIqIPyHj+ohH7Sw4VYCTukP4NKfZ6aI+sE9RwuTSPRrtXYwgMlDilYWzINdt2KiUfMH7juIPftGlPJZT+NPKuQYulYNEelLh3k4HkYodHbS2qQe+jT8ASHu/ya7nOb2P2zh5+3gr/76MHBjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775863564; c=relaxed/simple;
	bh=Ctedkfm08XoSSUXxENdCsLe9XNAH9ADnJHMTWYIWX+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufVOfVWNhHzT9MEMjU78vN2Nj4wAREiVgN3fGx5E6nkbZu6kYI8TrB1oR61VqkCp+5GGXn2XGivzfSD0D9mJ059O3pbDtPyzZlG+33Pg6tGG4LnNf/TTLrV0nGLfIwRKU+uqMgFLwux7cIENSkzKXbvaEHumn6daSq9K6nPbXP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djvp6uSM; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djvp6uSM"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2a70bb69eso2769756e87.2
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 16:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775863562; cv=none;
        d=google.com; s=arc-20240605;
        b=H8l/96zdy3HfKIchyuA01SeFDFm4ZZzd1DRG4P/eVWK/Xi2nj2QGGSKCI2/9eRHGEb
         sNfvr0kpSSVzCeicOlnLaK6BFhvzLeAE8qJ4wzZA5peDEHGOcDhvADrFFghKeok9IvqB
         XW8LF9eFjXpODZTdiQ3htooL85EOwvFbSurrx3keDFKoAgaaCa8tjsgR8p0dVKgRLhG7
         z57g7W363D8xrI7+Q67gSVZyIyAdugVHEqnx9Vd71ibnbF8ivKWfIR1Lslu8LlP0BRHH
         3md/jyStPMqyYE0pDEy7Qj85wwh3Kih6qwJltLsh8CGx1TI5Ai9knyX+cUVk1BCgCUxT
         ZXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=URHDsYQxbWckRjRtpI0pZvLDTeFqTvzZhMylWv9xs6o=;
        fh=X663WxSXOzwjffw7m4gaFYNQF4E7XwWcRcyjgap3Dp4=;
        b=KVzC1uYpI2DnwMxnEGTOTBvzhvuvisKDApWfxPZQTNO2zX1FmP3+eGTqRyWYtoYIhV
         nochxVOzM7Q5w3h90/luiZ3kKSYyYGlSb2ZwS1WVmZzlFvzIs111V+cMKxQWtp63wB1l
         Pbv5GaJf86Vekc8bLcNYhEf/gi0yatQhzUpqHIUvcOYv+B/T1wAI4q6OKBur7kkFcCBf
         LV7LiLWeXtXJ1e51TvbaioAhaF/qWsS2lAv+mk0WTQTXyecy0HCE3bMYWznbDGIErbNa
         ewbW82VFj0JW31JBUNFQch4BurTgCoZMdoPF6Ln9jUpAs3Pe0CN4d93YXkrLJ1DVQT4A
         YFrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775863562; x=1776468362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URHDsYQxbWckRjRtpI0pZvLDTeFqTvzZhMylWv9xs6o=;
        b=djvp6uSMn1jDY+NjDFzdacnXB7uSMsLn91qrBb1ZNnO+qeR6ClcgrDoglgqsBgSZ29
         BQt48nFfkPy/ghYxJBuQti+82Ux6JMbqZymTKYiPCuwZ7jTMEYkJT7Mba2lNJDn/Y8Vy
         SQuw8jFzYXFfmLiB+JNtKLZPeCrMqYbaQSDjB7KA/aPoR9cTOySbeeWI1p0dTvSK6wW1
         r03p9oEHpv84FNwqLA4waMJwSXAP0sYkPipAaF1LCo0p9hHoIpg06lEUkA+qA7NzlFab
         tmXUvMU6tDIqziDnhpMDyuJzA4SRdpkzavxotMgFoB7V77/IEBBMxXtQEM3+/F0RO5aW
         kQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775863562; x=1776468362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=URHDsYQxbWckRjRtpI0pZvLDTeFqTvzZhMylWv9xs6o=;
        b=kkbCsD5/vqSp/SK7yTxrSPj5E1DfoICaSdMIplGpWZOF/tw4CkUW7CGqJ0ws9hzdV6
         3miE3K8bytjbOOfVGzlx6Ca917hTWiRaB9xfgNhPfe+RCgymThaZ4JZleG5bQYns5Sox
         Te2NX5ZOWxBsdI64r1bDaXM51pMoHxDzBznJfOn2X9Vazk20EiFtoy6oWF1YhdeDo8gF
         kmcYpnOHcpLDpFzILqjb/P/8oL74ERi5rfrRW1SmNuFFtjrNTiOKfY1Artr+QCagZbMX
         yv/nrL/YcRmxbnS2ZMUq1AFW81uFjgu6TU8LQWaHIC43WY6vlReWRa4NQ+r5Vhifjadq
         s1HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtK+frzjAGANLDhC95CiTuF6eqCaSd9aFC0Ym+B77C3ydpVhh7eri7flq28qSVJNpeysB9U9LJDHYzB6g255A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV5vGRZkRD3mUy5EjhFLPeldl9lgv+zl8NVl2Ij2Y3HcnpyHbN
	cgUmHgbSU8Lz6D17r/zinMqoz8o7lRQR4eCRH0eKtNSypjS/T/OEIMBgjqfDtNpADqJiX+iCXUJ
	6489dY4xV0NmzUJiPNKEsTXYApDswJCmiggm1
X-Gm-Gg: AeBDievomoV0eCAet+dWKkQqcwYclQAdF+hOBLgP6aOgYe1XlwDWJK/1QKO9IHxjTQE
	QjfzIy3KZU1HZlIXMJD9S5lsO37oWLY977pku9wHLwufLie0EdAJu0tQJWCHBBgUVbpv59dwVLx
	8mxCMZsujtRQldXL7TjzEEvnN/77127K7KgglLp6MMHuY7eTpkTfg/So3Ed0Z5yLRBS7MsVxCQl
	njpiSQVjEdjaEJMqzKRfrOtuB6jKJW4kF2953eA7uScE2UqupiSSGm1arAqBEnAJVjR8KF6Ba5l
	ENsEFB7Z0LqduGKriBLe
X-Received: by 2002:a05:6512:3189:b0:5a3:e016:979c with SMTP id
 2adb3069b0e04-5a3efe994c1mr1626268e87.36.1775863561443; Fri, 10 Apr 2026
 16:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adjMsTa3Xv7O3jWH@stanley.mountain>
In-Reply-To: <adjMsTa3Xv7O3jWH@stanley.mountain>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sat, 11 Apr 2026 08:25:49 +0900
X-Gm-Features: AQROBzBThMHBhMrYKU48tKnMzybia1V7xtSEq8GeK9_HbMfZiOVJhmzFsQUW2Zk
Message-ID: <CANFS6bZxN8iqtyMRxrvdXBssMBu2S=zBDFds_Asc1W1vs_WDoQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs: delete dead code
To: Dan Carpenter <error27@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 4=EC=9B=94 10=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 7:11, D=
an Carpenter <error27@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> We know "ret2" is zero so there is no need to check.  Delete the
> if statement.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/file.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index e5b897a6c1e1..b04919124989 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -534,10 +534,9 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *ioc=
b, struct iov_iter *from)
>                         ret =3D -EIO;
>                         goto out;
>                 }
> -               if (!ret2)
> -                       invalidate_mapping_pages(iocb->ki_filp->f_mapping=
,
> -                                                offset >> PAGE_SHIFT,
> -                                                end >> PAGE_SHIFT);
> +               invalidate_mapping_pages(iocb->ki_filp->f_mapping,
> +                                        offset >> PAGE_SHIFT,
> +                                        end >> PAGE_SHIFT);
>         }
>
>  out:
> --
> 2.53.0
>


--=20
Thanks,
Hyunchul
