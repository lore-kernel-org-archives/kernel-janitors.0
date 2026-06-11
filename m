Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503AC3FCB29
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 20:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210235; cv=pass; b=mUVQ72XYV6zxEhCu5ZEaNYak6YE3YOugk2wWe+mbqw22+oaVHccev+rFnMgQjM8lUr2m9aobOKd1ZGSqy03N2/5nh3hM0SQgEdXMH/G62Yir0Euo4VPcAkdfFhQvrqZufS+viM5Cwp1IO9mHiNNCOJCwpBmOGzQGvu7bAOTSLow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210235; c=relaxed/simple;
	bh=73WLJC21hhKpLbbOzveQZZ1Rz8sJ9alAYv7Z/ugl/4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HU4C/vYeA604IgFCC3gWfPrChq7QatMmTDgBnss/3Ce8K9mc1Y8WNJRmu4j7CCC3CnECFiy782DK6lhGoFtHsRnqJsGa4KdjjPZYD1a0IRKp25pl20ai28OEJdIA+Fey8+VZi6YTMz634lRr+LLDaoLerIXvRG+52gB9d/xP7no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUVmH4wn; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUVmH4wn"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so210192e87.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 13:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781210231; cv=none;
        d=google.com; s=arc-20240605;
        b=cATwwNawvUPFdFMiY9466a16+OYpNPsdtJMfq/jE11p+JPjjxQVsHhrd8RAticB0SQ
         WvyLS5Lhal7Gh/8chtvHWRc1toBkD/466uC8xo+YxXNa3w53FwtDb9k4dYPo5+W566Qm
         uLAdgZcPpbgvM3zPevdUzVqLkadf/+VSUIcrAtUnOXjsm95OI1AcOzbqxINy/Polsuxu
         j/d/qyqn7YaHuiHXffwwmNIffCqMDUgI2lPQWE4TpNm8F97Vkgzge6oNJRIMomIjARha
         tA8X0+8+RifQvRsxmk8m/3gxNxV5viJaR0t6p2Hh/ZlX6v6iAkeEvFoA2SetfxzyZzEn
         4JOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hR6L+m7wu2NX+62gnu6yr+xDqGZjBXR2Xn5NG9Z4K9g=;
        fh=GsVyiM29F2AzxMGSUfFwmOPfVHfhyGTThXctoU2gwxs=;
        b=NHh/9+/ouvNyuCHmQqE4UHqORJub4Nw2NDgSd8ILw6Ivo3hMuD/oibf9Tl+WwGmCsb
         FqTqA+0SjyJpmR+YRR/FjINyNU1zW1m6NwFpG9hA+YKWeieUZzgoww97VVnrHi8zujbS
         PsYmzwnZpDPp82ZxnBid/CcNDvW8GZSapcnWhEzqH5xPAuqLAHcUFw7mojNEsfGVBuuM
         rqqXMf/3S0+wMFqJS1jXVjRifbbBgNLy63BUpyBAKRw7fbLINylg+CxM2wnqkC9X6nEA
         dAdKq8UMOQDJYYFHo3wgDWtKLzfAdiiA308nviRboGVHxRret5/CRc34GpLUUVum4WxZ
         68Yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781210231; x=1781815031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR6L+m7wu2NX+62gnu6yr+xDqGZjBXR2Xn5NG9Z4K9g=;
        b=QUVmH4wn6WGBiPfSiWio+QRAYJkBtGALeM5dpU9NpBj/5/2udTMFDXv/nzE6L5Qrs6
         PBpRQDQQ+fwLTlu1X8V+1wB22DHVUt0ZKj92M8ib4RsQjKN6cqTsJ1W6diKKRMU3zykQ
         YNy0CbCh5MjD4H8Ux/oVHtfEHEKTPlTjuIiYYJC+aOYVU6h4opvUUPWSIGfjSlWXl+GF
         6Pw4temSBOYZj3KBxS6PM6uEOYyKRueCB6KBYQlJAQBptpKqmmhVHT9znWa8JJCKVusz
         IEuz3x5qdt0aW6I08p4U8IcYLXxn47BX6gmDAVOsRgyJRaUvE+07rSeG7SV77UvFRqf3
         YKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781210231; x=1781815031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hR6L+m7wu2NX+62gnu6yr+xDqGZjBXR2Xn5NG9Z4K9g=;
        b=K1BhxKIDBWzZmsCZViFrUyNb1WrG3W8FZkWkjEUrEvd+HCb4IYrD86Jjza7Q0R1pFI
         OU6GblgRNQ0akpLolyTa/kcSh2pK250dFLzeSFR+/sWJ202VYgVWSR7Bzz6MZUzZBXRc
         31DnbpqalPPX8/oLdTQAep5sg2oRbqDb1zDeyHgRtZWtRUvMQoxslhZPvH2xIl9/5IEI
         M4t6fQ7eOm302nIZO+gwwX/9GZ8yh/UISdJqH2XcrqxG3gyTRGyG8wsUkj01bxMlxPYx
         wWbnnt+8bSP3PbGP+UbylW6qsDB0jP3Ixs0Vtpwjo/tusf2v86WyChwC9LdXfQQC67SQ
         5ZgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+q5oVzR8IF8wf6m3ridZQ4dps/GGFjVtV5KQRaq3mkJYCldm69UsM9THQoWbfxeXrrqT6oP5B3suubFRc2uqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaWuvLwUeYQI7O6enNAAHCSZHrKuXXJvw7k2NPD1tdHpEllmcz
	PmCUpJbH8OvQEe5I9UiaRVDBramPF30tz0TI9hR1Q5fyI7w9GpSo3+WisjyhJYTGsEO6nJUz9Vu
	CAfYyRVfqSihFidM1HZfkNX4Rjqcp634=
X-Gm-Gg: Acq92OEeU6jIA8t0uJWqqVKnU/pXUlW5nxGtYlVqrMGkxyc/k+px0sBJ7QZfVk0rdaJ
	FIaDLV8Yo1vXWliwBM68aXfGdh9eZV1lg333xQRg8toVZgiuLGKI57+Y8qIwJCS/TystchJXCkn
	XHBWVL3HjAnBGLtZ6s4N8Bv4i0xYnF6D9krV4crdu6Mqi0iYLVZi60HzPIepkgtx3zRf/ajVZL1
	XbBep+4U5m7cLpMwAMRsjvkQUquUeEJLQkGL9zykFj3a9epsNhsJfs5fn3TpU0rDgvFe1idUKIj
	pbrSiCTzITMK7vRGe1ca2aqeYzbAzTX3OKNMZXkzi2pJX3OGlkizDAFnLnYianUa/xeFUr73oeU
	C4myzPC6Dg/Xl193+5ivgI7igTiIR4iIOB38agZnmtFuhUjPF192X1+V+/ES3GqFcoFB4MysG7m
	4W32iH+9xTNenEAa6XRm9S
X-Received: by 2002:a05:6512:224a:b0:5aa:6f5d:ee0b with SMTP id
 2adb3069b0e04-5ad2db15619mr5675e87.2.1781210231441; Thu, 11 Jun 2026 13:37:11
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aiplQF3QGXmXAEk2@stanley.mountain>
In-Reply-To: <aiplQF3QGXmXAEk2@stanley.mountain>
From: Steve French <smfrench@gmail.com>
Date: Thu, 11 Jun 2026 15:36:56 -0500
X-Gm-Features: AVVi8Cd4EQliyIHLF8hHkVDnv7pEGey5HCW41kivA4WOaBYOV5igv-hjRbl4GJw
Message-ID: <CAH2r5mvKDLssgLBs8x5zNhp-+-h7yNPYzgtf_LQm3kchRVtZ4w@mail.gmail.com>
Subject: Re: [PATCH] smb/client: Fix error code in smb2_aead_req_alloc()
To: Dan Carpenter <error27@gmail.com>
Cc: David Howells <dhowells@redhat.com>, Tom Talpey <tom@talpey.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>, 
	Bharath SM <bharathsm@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged into cifs-2.6.git for-next

On Thu, Jun 11, 2026 at 4:00=E2=80=AFAM Dan Carpenter via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> The "*num_sgs" variable is a u32 so "ERR_PTR(*num_sgs)" doesn't work.
> We would have to do something similar to the previous line where it's
> cast to int and then long.  However, it's simpler to store the return in
> an int ret variable.
>
> This bug would eventually result in a crash when dereference the invalid
> error pointer.
>
> Fixes: d08089f649a0 ("cifs: Change the I/O paths to use an iterator rathe=
r than a page list")
> Cc: stable@kernel.org
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  fs/smb/client/smb2ops.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index a3257815e661..a8f8feeeccb5 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -4359,11 +4359,13 @@ static void *smb2_aead_req_alloc(struct crypto_ae=
ad *tfm, const struct smb_rqst
>         unsigned int req_size =3D sizeof(**req) + crypto_aead_reqsize(tfm=
);
>         unsigned int iv_size =3D crypto_aead_ivsize(tfm);
>         unsigned int len;
> +       int ret;
>         u8 *p;
>
> -       *num_sgs =3D cifs_get_num_sgs(rqst, num_rqst, sig);
> -       if (IS_ERR_VALUE((long)(int)*num_sgs))
> -               return ERR_PTR(*num_sgs);
> +       ret =3D cifs_get_num_sgs(rqst, num_rqst, sig);
> +       if (ret < 0)
> +               return ERR_PTR(ret);
> +       *num_sgs =3D ret;
>
>         len =3D iv_size;
>         len +=3D crypto_aead_alignmask(tfm) & ~(crypto_tfm_ctx_alignment(=
) - 1);
> --
> 2.53.0
>
>


--=20
Thanks,

Steve
