Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4993F8819
	for <kernel-janitors@vger.kernel.org>; Tue, 24 Mar 2026 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358545; cv=pass; b=dGk4PL/BWsvBdOOVnDrAl3F61PdYFj4+wbB8a/zDpX446o6FRL05G7W2YS0J0W4B1mdjMs1avPK6jV5hO15t7quQxoi27ByzQbl/wr33FY4XaXU+KQsYnTVqpLT0LsEuDI3FZ2HuodKvC0EJ131PbkA9YUrkSvdZedzWBDQoIQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358545; c=relaxed/simple;
	bh=ulCS0AYFLk5GQA+hQOw/EbkiIq4EIhqjNbicPVaZWws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPhy93OoXbfVUvR23e7++gMmCQIwd792Az0KjrfPus9hly1BPECqzODkmeRjeU+Q5r9pArTQGkvWraEV2nZcShTpoJQiUyfHbejeXgWg0KA+0+hKLU8ffIKRP3CJ5Cf7myJO96zneYeg+qKVGnOA/wH11FZYnWvfZiX/HF3N3uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gri/V41/; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gri/V41/"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1273c690e5bso500748c88.2
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Mar 2026 06:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774358543; cv=none;
        d=google.com; s=arc-20240605;
        b=QFQoy9kRAxs9ehprt2ACXUa9cH7RbceWhCzTqIeAISOjF/Ow7/Lvj0oz4GIuJ1OdEv
         Il2So67uNRz8ukAT3horeGn/pPgn8WPeO3ODwLYTpt1KITpCh4YCCN35Px3nZk+luccH
         SL3gRZGgglYYbaVU6YFZTcoI3sYex/QNgCRfpHnRPICShQEQ9SFtSyfxqqA3rOdMFYxs
         8/miW21UnknZj9puHeNDAItGq8exAhoe8k3XhNoMcVcjb0qUg9MfJ5i2H0NIX31FtLcR
         mwEiUr4AcIxoGuERGtv3bt3FgPi9+DFkY4HEe8Lo7jekopU+jbmJ2KueykGmYPHCaaY1
         sxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FpafDwQpmjLC+aw1RTAqKBuFIpkEFXad75Wwh/OZldU=;
        fh=tt3z9JgHEN+ZQzr0xc10TRsATKtd9UZnFMgMoaExuCU=;
        b=ONkxgpxoRN1btH6Ei9upW2S4J38mNpY+kbdNyOGpZod9RONSY6rXKdEtLhEIx/euqY
         /vra/bJB+vkUoFdVVH4zxkOwWX+HogDdZb81swlk8IuzkCHT2CXhWtKW+O4Uga+/FsmN
         is3JeInrTRTXI0jAe0/x01B6Oiu0FXc8wGbgZOSjqLe3JeS49gEOmwp19CQF0bpWTJVf
         tTpwFNvTEMBzg4XDgdImHobmvIlD8JYHmKZfzaklBwqXTC/J5M+3yzpydFvQH40IFYly
         oLA/TYY4QoNf9WixlG98PyWvBzoLbjw9bSTymBgH1MeSuNsjQfR2fFQ34cRa4kLgJ6pg
         Kfqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774358543; x=1774963343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpafDwQpmjLC+aw1RTAqKBuFIpkEFXad75Wwh/OZldU=;
        b=Gri/V41/HATCPgSSsLDvpV+ex07ZnQapf1QoxLLEDLMBv8xiEUdJFLp72gAxhYGFfM
         Odj2ADZ1BZ1GkymrfH6sWmVsvUfM+m+NMMk8hLmhUxv87p+rVIEUUWrJr94VfZTugMgi
         9wTEivppDjJp34+uwtqsXtfcslItJBHusQOjYmhTXof4ij2teeP4opc4D2gPqEr8Jig4
         eHdO34FONh4TL+k9bz5fZzYbkCl7oWWClatGmgpxaA8W+qR1/fWD9Wl7F1cJMCN2nONI
         96sy8+kyg4F2BA+Y/I4gVDxFDxIXlz41ohdi54QbMvHXrPqKjH55m7cgJ02jaiYeZvzV
         Ocjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358543; x=1774963343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FpafDwQpmjLC+aw1RTAqKBuFIpkEFXad75Wwh/OZldU=;
        b=Zn+T43MrvekUzRS2pe9m/K1lU38oLBsVhYk3sU1ctQtBGWYjW30S23W03n++iz24S/
         rnH4WseMdGbe9IAsExG3hMOe4o+9hfrEN4dOIXJgkSqwrP5xGIpHROes4elXimZgXxpp
         ChXROUNRMmJi35MiGqTtQyb719SiUasrYGcB9NP4U1e9h1o42M31P+Gt1fqRypVfKl5I
         jo8Zsj9y94npKV9nsxJFxtT7HmvgtVM7WoqPUszUdK8ooaoaIv3AyopkKwZKs+4vlofn
         Giz2NdGlDaesI4jNEoBiQsr9iTKKyzurx3LVZwUlfgn7zIRhssw8JIq+cS496PKaTWBg
         6NLA==
X-Forwarded-Encrypted: i=1; AJvYcCVVIeJIap1uLasgTcxZ0LQV97pZbc2BNGYtazuOqRTmRlebkErYrjMN5YTxDd5uOjIptm+va9Ywotvxx+9eOtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtYsdDtgOcbUXCrjdsGEGd1LnOLuPiEui9k/lLC/67U1Q2ifdm
	FB79o7YIKkVf8Yf9sBrHVWSkORYmBekcqGZ0ZNi5C0256pJeUz44t+BzK3P3kSfPNASBx5dgLcT
	C6Vxk/ry7ZPFZPbxjWBVILd8IpL1SjRo=
X-Gm-Gg: ATEYQzwhmiSS4dv43ea+Hm9oFa5wdRREwKtWDj5g03ig5eRqO3ENSM1nfqfeJeK9wzE
	MykhHSW8ufp8GNQCFws+XXasmhLmv1kgm8L59FAh8wIGhjbnJ9o2m7ntrwSUnNwGBnAcvGr+Myi
	PEMJIK6m4vlsJqhxfyz4V9LE7htz1A79OL48s9GbbqJzgOH7HOxh5xxgEFEvhbeoPM5qzaUAdlG
	+lu7y7RSE4mskfjDA0N2abnhYbhGrbuD2PjVlNpABXYVuXUpGokl5BH0B47sIq52jACUgDYIA5P
	WSjgrmUvSwXnVTpy1VrPgewkQ8zBb2BhYnYBqJzE5gOQWb5KeEK6NJ6WZrNj0s8F11yX2A==
X-Received: by 2002:a05:7022:2224:b0:128:d590:2947 with SMTP id
 a92af1059eb24-12a726c143dmr3378135c88.4.1774358543184; Tue, 24 Mar 2026
 06:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323224348.343495-1-colin.i.king@gmail.com> <1060acb4-1a8c-4e52-add2-fbda4f2efb7d@amd.com>
In-Reply-To: <1060acb4-1a8c-4e52-add2-fbda4f2efb7d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Mar 2026 09:22:10 -0400
X-Gm-Features: AaiRm5365YdEJSMouctlHAFL3xVlmZM5_M9mMvfLm75WvY684wOEa50LTTLTuN0
Message-ID: <CADnq5_MBNLH6ArJT5J87xcqvPo4y4N15EKO-oJPa3MAqEnr2_g@mail.gmail.com>
Subject: Re: [PATCH][nexr] drm/amdgpu/mes12_1: emove extra ; from declaration statement
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Colin Ian King <colin.i.king@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Tue, Mar 24, 2026 at 5:49=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 3/23/26 23:43, Colin Ian King wrote:
> > There is a declaration statement that has a ;; at the end, remove the
> > extraneous ;
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/mes_v12_1.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v12_1.c b/drivers/gpu/drm/a=
md/amdgpu/mes_v12_1.c
> > index 5dcc2c32644a..0e9089544769 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/mes_v12_1.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/mes_v12_1.c
> > @@ -2227,7 +2227,7 @@ static int mes_v12_1_self_test(struct amdgpu_devi=
ce *adev, int xcc_id)
> >       struct amdgpu_bo *meta_bo =3D NULL, *ctx_bo =3D NULL;
> >       void *meta_ptr =3D NULL, *ctx_ptr =3D NULL;
> >       u64 meta_gpu_addr, ctx_gpu_addr;
> > -     int size, i, r, pasid;;
> > +     int size, i, r, pasid;
> >
> >       pasid =3D amdgpu_pasid_alloc(16);
> >       if (pasid < 0)
>
