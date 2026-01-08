Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DCA2ED154
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Jan 2026 18:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767895706; cv=none; b=b//Jgld+748yK0M5ZcXKWXQZalYfHXf39qVYJdJcqjALu4XsevstYJMdISoAyWCVeynrM48l++LUaFGa12jsRAnbzT/c4hQC0CNh4uozD6SmYMAqcLPQ6Hkai/rjpBOZe9wtIkacuaWJoONLw97NkxVlm+0DgpDLWB/SDxOGExM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767895706; c=relaxed/simple;
	bh=8+nP4P6uufce1/Xkb21nw0wxeSTCgFYuFU1qLyDqZRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h053jPmIb8muVv+Br4oTG3thohxwEzQb8S1tnY+e6ypCbnbKxbAWj2iy/zXAjjZEPmR8se5k+crqTDfyK8F+X6FH308FCYZBQ9R2YK8tAsEett96EEYw0XBj3DDT3jTMSe0e6yenXQq2slAuwncdY4vxgqI0tLL8lYXMMBYpB60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1iyscAY; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1iyscAY"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b07583340dso205713eec.3
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jan 2026 10:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767895704; x=1768500504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXUS0sW8xDHB4c+xLKoLwXG7WUF7jqTtXhEgI5LQ8k4=;
        b=V1iyscAY9v2/2CZBP2RlMuhvD2aXK9N7J9YXbRWTsBciq+MzoT/iOYJ2ReACbCfO+H
         1RVytVv2btmstKJlg/qA75a5cnua0uG0eHMYbm89lUaBxxmGU+anqjRyGWnzF1kdimbR
         RjRy7GJH6BFqn5wQKSABf5ZMxD2IEcRbRJJG8fL0t7ARiPzinAb9Lc04PcL/4DCUyhAd
         kL6unx+DKvg2WyLjHnR54llYb6owUFPp7+UrLGg8gzvBp88YFyn8+cVxLN1eddwg24e2
         yDzPO2x9dfTX+WcxEl+AS9dRfyjqABYzK1pLiJIQnkYZqykQ53qgn3hmCX2GkQNFsLWM
         ylfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767895704; x=1768500504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DXUS0sW8xDHB4c+xLKoLwXG7WUF7jqTtXhEgI5LQ8k4=;
        b=tJgMiVFctW7lGVyLl0KOXtvqLAgWialcSNYuHKIHNR7xEDZ9JK7maL9YhHvhDTBkSf
         AJes2FO59XiEHStwgYvKLjQou6u7EDqLjfRzGLnUCnWj5Nik52zLycMCbQK+4PBIusvo
         A54xwjWabjUvLr78jk+JUTBOUDERKxv5GxrDDqp3QCC4+/Fth2yIZ0PNgfio8fbachG3
         s1Q1yZ5BFWSiXRy6tKnJsDzT7O/n95OekuY2XUzSlCtBKf+X7XS2hY+sZgHdRFK/bsa+
         EIZS1jqtseV9dcoJHXAuxnzLgMATZx4RylJ/PEXhfxNGtRbY9Z61c9beP1u1ZNhQ0MOY
         YBJA==
X-Forwarded-Encrypted: i=1; AJvYcCUzicLpjVlaITjzPqJ3z+JTFulLPjPbYdLkM8Q3a++B43TSoF+3d6pUFTqeob4TzekhFq42fFAG5lnZpQSrIJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YysYmtqtAHlfs9nkxADH3fhGqfuAAOUeqmRrOo/GD8zA7B+zewv
	genRcdTk2kI54KWasbee5x/IlSVahOajjjWiixkHtvoCDer4TpBPHvj7kIcdhfO/56xuL/scXJe
	OSvwuMpJ9PLAteF+b93YY38lIaiUwRDs=
X-Gm-Gg: AY/fxX7dn7ccLurvEg7VzNjv57wQCjoHi7BiOzIvKPy0Q1z06ZUVcaLOSk8SBIPbe6x
	vhtg4N5UqGSws14/4aIbX1kDdqqMwl8Z9Bf4epHhk8OWHXYDRTT7hYShYt0on5zFacXtpoXlFo8
	+jHUiFvIMuwIQWysOikRpssO15W+sm4V7OHjFN0hx2HmaxKH9voqwBh5gWOl4eumjDJOnsoEm6b
	M6zmo+tnTSDPzQZimZnIzVWKdMthpBo8TSOB+hnIeGHNOd6HkppP/jn3zCIKUysddjTS+gi
X-Google-Smtp-Source: AGHT+IEMxYW5olsKhaFfSHEchb/xPWvGCY1hA4pzxMkgokTlS6YbyEil5FB2/wbNWl91n/7QB6Jp9tN/G6GmQ66/ivs=
X-Received: by 2002:a05:7022:6723:b0:11a:2020:ac85 with SMTP id
 a92af1059eb24-121f8b7d702mr3293866c88.4.1767895703446; Thu, 08 Jan 2026
 10:08:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <66adb62e93993ac0a70fdbe174908c36a560b98d.1766330018.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <66adb62e93993ac0a70fdbe174908c36a560b98d.1766330018.git.christophe.jaillet@wanadoo.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Jan 2026 13:08:12 -0500
X-Gm-Features: AQt7F2qpeJJDtMGtlgzzhVlKAJGrFRpZjPdprLstNhcJ3aZVDrytkh8Vd6C19_4
Message-ID: <CADnq5_N3JiRShWTa7N+C+b_-cBxOiyAo_XiDSn0W-J3LaUfqgA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Slightly simplify base_addr_show()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 10:31=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> sysfs_emit_at() never returns a negative error code. It returns 0 or the
> number of characters written in the buffer.
>
> Remove the useless tests. This simplifies the logic and saves a few lines
> of code.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index 20d05a3e4516..b44f0710b00e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -888,22 +888,19 @@ static ssize_t num_base_addresses_show(struct ip_hw=
_instance *ip_hw_instance, ch
>
>  static ssize_t base_addr_show(struct ip_hw_instance *ip_hw_instance, cha=
r *buf)
>  {
> -       ssize_t res, at;
> +       ssize_t at;
>         int ii;
>
> -       for (res =3D at =3D ii =3D 0; ii < ip_hw_instance->num_base_addre=
sses; ii++) {
> +       for (at =3D ii =3D 0; ii < ip_hw_instance->num_base_addresses; ii=
++) {
>                 /* Here we satisfy the condition that, at + size <=3D PAG=
E_SIZE.
>                  */
>                 if (at + 12 > PAGE_SIZE)
>                         break;
> -               res =3D sysfs_emit_at(buf, at, "0x%08X\n",
> +               at +=3D sysfs_emit_at(buf, at, "0x%08X\n",
>                                     ip_hw_instance->base_addr[ii]);
> -               if (res <=3D 0)
> -                       break;
> -               at +=3D res;
>         }
>
> -       return res < 0 ? res : at;
> +       return at;
>  }
>
>  static struct ip_hw_instance_attr ip_hw_attr[] =3D {
> --
> 2.52.0
>
