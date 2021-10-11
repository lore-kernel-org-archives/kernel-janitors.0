Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFCFC433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 11 Oct 2021 13:30:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0776A60273
	for <kernel-janitors@archiver.kernel.org>; Mon, 11 Oct 2021 13:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbhJKNch (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 11 Oct 2021 09:32:37 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:54849 "EHLO
        fanzine.igalia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235280AbhJKNce (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 Oct 2021 09:32:34 -0400
X-Greylist: delayed 1819 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 Oct 2021 09:32:33 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=PoKytWeTWU9o8A8VzF3YqI0Hh2P+ySoZTfaCGvR1j9E=;
        b=iOBOmQCgQMMZz/Er7xMX0pCLOWQJwIoZvGT1WKNonAefGjm9XMmU6t0+6s4/BOubzNHVgMADUY8nMem8xkA6zhRgNDyYuP900kvzwrJb4GFGN0HZkRHb4Vw7GgD7sgaffyGqF3+kEpRzg/U9XXwZHct/SQ7qnIT5Qb6tFJf/lhgql8VDb3U6EQPD32cQabfIFHUqGeCSpXDJwXBtLFM9DiNIC4S67JKv1k+z9PzNm5H8jpuIt8zY58Ggo/9j9Ar7KxtQgfYnvDp1vL4IE7qK07LuuiIoJfHJJ8C2s3hLgYx4KgUrxsZtk92LS4fqmOaHdNxPHuDeTSpHN1n4COnjCg==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29] helo=mail.igalia.com)
        by fanzine.igalia.com with esmtpsa 
        (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
        id 1mZuuQ-0005DT-JX; Mon, 11 Oct 2021 15:00:02 +0200
Date:   Mon, 11 Oct 2021 13:59:08 +0100
From:   Melissa Wen <mwen@igalia.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Iago Toral Quiroga <itoral@igalia.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/v3d: fix copy_from_user() error codes
Message-ID: <20211011125908.rqsaunju5weqmhbi@mail.igalia.com>
References: <20211011123303.GA14314@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eyr67bt3k6i7edlt"
Content-Disposition: inline
In-Reply-To: <20211011123303.GA14314@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--eyr67bt3k6i7edlt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10/11, Dan Carpenter wrote:
> The copy_to/from_user() function returns the number of bytes remaining
> to be copied, but we want to return -EFAULT on error.
>=20
> Fixes: e4165ae8304e ("drm/v3d: add multiple syncobjs support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 6a000d77c568..e47ae40a865a 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -487,8 +487,8 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fi=
le_priv,
>  			for (i =3D 0; i < se->in_sync_count; i++) {
>  				struct drm_v3d_sem in;
> =20
> -				ret =3D copy_from_user(&in, handle++, sizeof(in));
> -				if (ret) {
> +				if (copy_from_user(&in, handle++, sizeof(in))) {
> +					ret =3D -EFAULT;
>  					DRM_DEBUG("Failed to copy wait dep handle.\n");
>  					goto fail_deps;
>  				}
> @@ -609,8 +609,8 @@ v3d_get_multisync_post_deps(struct drm_file *file_pri=
v,
>  	for (i =3D 0; i < count; i++) {
>  		struct drm_v3d_sem out;
> =20
> -		ret =3D copy_from_user(&out, post_deps++, sizeof(out));
> -		if (ret) {
> +		if (copy_from_user(&out, post_deps++, sizeof(out))) {
> +			ret =3D -EFAULT;
>  			DRM_DEBUG("Failed to copy post dep handles\n");
>  			goto fail;
>  		}
> @@ -646,9 +646,8 @@ v3d_get_multisync_submit_deps(struct drm_file *file_p=
riv,
>  	struct v3d_submit_ext *se =3D data;
>  	int ret;
> =20
> -	ret =3D copy_from_user(&multisync, ext, sizeof(multisync));
> -	if (ret)
> -		return ret;
> +	if (copy_from_user(&multisync, ext, sizeof(multisync)))
> +		return -EFAULT;
> =20
>  	if (multisync.pad)
>  		return -EINVAL;
Hi Dan,

Thanks for catching this.

Reviewed-by: Melissa Wen <mwen@igalia.com>
> --=20
> 2.20.1
>=20

--eyr67bt3k6i7edlt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFkNRAACgkQwqF3j0dL
ehy/8w/+NA5rtf+1hM9UHJtkm2sonSUdSnemnNvtHpbvA8N7x9J3xfATkFvmRuus
Eax1lSMDJmamubhDeeOj0EwZXIWfUdTxMahFJrnjW1VMZw+mWmbwqPCP4S1/52za
bH8fwjDzP+d4GOY9iVk+ILxw7VbZbPF+PLsoOmC8BTP8/mdo0afakvAf8xfa644J
eQ1Z8Yk7V8wq5+rbHojW22lH1+xRsOZ64WlTiraLvHA5VR+WBwe/E8m8Bq5V3aga
2TF9aD8Fw3x7EP86QqK4eVo30c9hdVNMPmrWF8jeGtyexxMFG7PphDiEr/A21IQZ
crzhBgEH8N3AfdHQNENmY11rtMAzJ/g/dt36PzLvq7tYDGrTt5hs7F4GANgYXE3Q
rke/rk/O4Z/p0NT5sDlkoJ5RXtoLFv+bf9eaVhgcTCJzR5Sjm6xQpqwbKdAEWrT6
SMp3w46k/jN2+vAKuxayBsj65lLDK8kZGLx/bP82lF0Z/wusTsllsiTLnww4v/dj
vZ/hedq/MXFzkb/C82gOmsMzT20LRo+aDJL1YWD5PPD540b0PZC+GEkkF3W7aQeZ
DPyCD2PuCM53gsCdLc9OeV6SbbUPTprvktPK+nBYr5+6bPwCM/cQuYg7FPc9r02y
UzI1PopTq+cQqYD+8LO0pJxuunwVm8+be8ofAgALN06J+lH6/WI=
=JAyb
-----END PGP SIGNATURE-----

--eyr67bt3k6i7edlt--
