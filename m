Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417637;
	b=hiKnHqEDDZ3ZftSN0q+mDb8LZiFVVdEeeMsUYOjtdLBL31SkOEewFT0bZlrfheYnjk9G
	 jx4SzD5MSmHHyg6+YM6um8C4sg1TAGckn+loK/1exX+3MXKinWYX8t5OBSJ9DFDZZyu5P
	 b7qU7IFYdU0kF/tkH9R9saglm0t9l1WKOUZKsaQiqkiw73nLzpcAcEUF0EbmMdvr1DPZg
	 nrk99zz0r7trJNGMtUGngBqFDjgzNkTA7ub0L+kMU9AE21VGi/GHjqV5D+oEPkSjQV0NK
	 RqOhv6SJ9r0J4uYaBq0KKUmp5jhf7rR3yKJ7QNYNhEeEqmdm7vxmItvtVe3y9WOo4jQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pxB40q79An19C6sh7p3I+5Mbwo7e0V/V+8imyCMYB8o=;
	b=4cAkAFcV/kdT9yfPqJtW5Ep054BVxCOObFTq2Y4/xAV3oj7Sm+n67eqXA4cBLqLBm6mU
	 pwy+qG1A8XKFz89XHNQLSIRPhAwK1NpEut7CBDjcYuqMG2uFM9MLS8p/3BQE+sf10a8L5
	 uOgZOUWTmtR1QE2kN6AVz8tv+UEm9KyhhgOlq6+RL535rXmL9nwsiMhSHRh/7zWFB2qqo
	 wuoLzzoRvgiQnyQg8QnydQBVWqM6ajD4WO8gwknkVAGM9K0vjl5Adj60Cxw68P7zo+4tZ
	 8cj0QkUH8crBlFMeQftGcwcREGoXjnQVYx/+KrRMGwiyQlqk72FyCEgSNq/FdHTJRdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jZs5JaPv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89481606A31C
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Nov 2026 17:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89481606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jZs5JaPv
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36ca32a0faeso94988eec.1
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Nov 2026 09:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794417637; cv=none;
        d=google.com; s=arc-20260327;
        b=b93STz6iOUoLR8WDAex2dgIMWau/aFjd4kYD06N4rLWIs/V/dctCX1nA3fK/6EMB6l
         yRkMVNEF0Yh+n2z/UDG1p7pFUtymt2Cf6KG7++8ImCPhPPyNLSvGKLi+gnApsqP2gYUU
         fa7zTVRvBYCoQArG7X9FUQA01B+6L/YMWxdV+np3E12CJ3g4WIlCZdgIegQtpX3I1JYV
         zSIW5ETkVwzaVNnQmNRRM50YgN79KqzdsZJKUiUlnT3TcNK6kPFnHUcLIljyytXiOlfz
         4ImkuZzjxDpcRqLc7sx6z01uH0uR0/hhbk2tK4kJ1stbGoOZL8JqxHdDlwSXPZLdmgcv
         gLHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pxB40q79An19C6sh7p3I+5Mbwo7e0V/V+8imyCMYB8o=;
        fh=o9w3YB6O+Ik5I3cI8VROi5FQsaY0KgXfONV5nINARUg=;
        b=NCDJr3dF6p3krfNhrxgFp4ovbNZRrmvb3oaUNINQRFp6T92S7OEzJcXPzb5uxLFjPG
         vG9kid79io7BRSYE4w4ggyG1XNjyrB8hLbC8wGRUi6jpycixWgbHzpUpUR/rKAhcyhUg
         7GLimr/VCtHXDzVteOmHHqywh+UAmHO19kEVayq1zBgYTB6LPngYulxQu8I2MvZP64dv
         79Dy5zIn31Ar7dTNnzIp0o+HbpUpE2kkAQzis4hG2epJUZKTRvsX4XczIm7tLdM9Hm8K
         EXHdv2U6eJdc5Ltp6EdVlbmkXAeClr580ily9EGUMX/iYUa5pnJRNT1iwXbhZeI3EgiQ
         H6nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417637; x=1795022437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pxB40q79An19C6sh7p3I+5Mbwo7e0V/V+8imyCMYB8o=;
        b=jZs5JaPvzzKoZT+pGwPsj8NQZaL3pQgSbYOZ8exWg5qnih8fyGqgrW5l9R9+IsihNj
         Rb0/ksUvUNLYihQzs1iQ6sGZpzFM2lvLyprPiSMFitn1q1K2A7mfgDJXOHJLDS4UyH/7
         xyjaHFe4icHqyEDMQ67x2Vjr7w1Q8dYSmNZ0SXPh7hhCHPHUON+813htLOXDhOdzJxjv
         9ungVpu3YRplhcElctCUML91SJCTECdOru9cs11fk0hPZn3mhtRvg3wVDVL1uMq0H+gh
         DdJeAlfIm+4DLR0S3qrOvuAvfPZG9jKIb59h1HVJgGhIVT3V+GMTwKaOoz4f6TRj3nJu
         gZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417637; x=1795022437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxB40q79An19C6sh7p3I+5Mbwo7e0V/V+8imyCMYB8o=;
        b=Gg97/dwq0W0ETNOPnODDvEGm2qMnk8Xlh8ncta7rfI6oW2DqjKcXxIVmwA8cLRjHgA
         Oq90K07PHQoi8ntjC0QGHzT8ghjfD7W+CB9xnYRU/5oDvyU1Uy2cxge8vBNVeLrFLE5r
         nPwIc08xv7RV4fX7gSQY65SQLdonnPDdSyKGeRkkj89sKCbLi6rKLNnFFjtnJmMYN9wH
         6WTt17m+c3VQwrdhfZwL0+G4BCMlYdbtbZtdZhX5MPb4PtTUolPYmOZ7wRuG1Rz+hf01
         v37IhJmVRpsRaJ14Wt+ASiw4WaneqCiMRwNRw341ZzT2x49ndzb8BfPgpzcs0BgypFoI
         zy9Q==
X-Forwarded-Encrypted: i=1; AL+hErGlJsLZqtM2ytO3L2rbIWxJOpJWEXG3YP2olX7lZCM6n+GH6C0dDT7EM5ryGXKAUQyj1fckcaXk36ziO/H7FWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o+03iWM+hJ3ICUkjNFaETFm9BRgZM8flRQEsekNzdwSjVJ3ps
	74OmIduGU7SjvNiM/MygnqAez08Br+mI6z+eoi49yruNDFgRJ5o2a4TGlzZWOtvVAqC8MvAZnQL
	SyhacXZO0h2yIdJOxMEKDDG3qn+BKhUI=
X-Gm-Gg: AYBFou2pm859AIy/6MVCwliXy/4R2CDnLKVEOSdFPSubAgAuyrViROim1/9JJnBNalZ
	ng5kg9IK1Xh8bBn2Bgea/n++4mdyOgIUu0o1hYK1LU1hxXE9HyBCvR25tb4hrKDZkh/J5v7NJTJ
	HAkmLc/R3fCNMe40cwoHyVzamrNI6g8Uc8EDuxpRX8kjIS9IufwU7xFDIetsy8YeDcwtlJPHyU3
	27Djod1MIGuDzv/B+Z8zAH/fF31itksLwJqA6JLDNSshNiYT9CkvcR4OYpG2dRpcMmJ1jEODM+L
	jrI1Bqn6p2i+vLFlEY3s3uak7sO4RIsOupfI0ih81nmqVuFoT0e3VKVmM08NufbkjYDGfgmmYFF
	YY9LNgbxytbaOLIrVlVKQKuRkIsw2mBmPeuxVmCx3fwFnb/3uIg05GR1BfPwAmgnB6O0pois92O
	b4Pp1aQXbGew4sInMqHpbYjAlh+utWvhwA9UV0wv3+sFGxZPO5zSUQO8CzBvA=
X-Received: by 2002:a05:701b:450c:20b0:17f:641e:7f6b with SMTP id
 a92af1059eb24-1b3c02cf135mr4365930c88.1.1794417636541; Wed, 11 Nov 2026
 09:20:36 -0800 (PST)
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110160429.892673-1-colin.i.king@gmail.com>
In-Reply-To: <20261110160429.892673-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Nov 2026 12:20:24 -0500
X-Gm-Features: AclHuK96pzFNcsCpriytYsF_JfHFuBx3rYaQSacUjjgQ682B45jmkk_N34BB_lU
Message-ID: <CADnq5_OWtqzN9VDK7F6F_FBy9XkDmk_1jAMR6bivEsJABe1rag@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: make the read-only const array
 fw_err_code_msg static
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Felix Kuehling <felix.kuehling@amd.com>, Mukul Joshi <mukul.joshi@amd.com>, 
	Philip Yang <Philip.Yang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed and applied.  Thanks!

On Tue, Nov 10, 2026 at 11:31=E2=80=AFAM Colin Ian King <colin.i.king@gmail=
.com> wrote:
>
> Don't populate the read-only const array fw_err_code_msg on the stack
> at run time, instead make it static
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ualink.c
> index d025b4183b29..91c863649972 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
> @@ -5427,7 +5427,7 @@ static int amdgpu_ualink_metadata_init(struct amdgp=
u_device *adev)
>   */
>  static void amdgpu_ualink_remote_error(struct amdgpu_device *adev, u32 s=
tatus)
>  {
> -       const char *fw_err_code_msg[] =3D {
> +       static const char * const fw_err_code_msg[] =3D {
>                 "Unknown FW error status",
>                 "FIFO overflow",                /* error code 1 */
>                 "Invalid RB command",
> --
> 2.55.0
>
