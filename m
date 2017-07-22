From: Pierre Moreau <pierre.morrow@free.fr>
Date: Sat, 22 Jul 2017 12:13:22 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau/hwmon: Uninitialized variables in sysfs
Message-Id: <20170722121322.7jig7u3i22bde4uf@pmoreau.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="dxempbyhgkz3lqlu"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170717081711.4mj76r6qf2de4em6@mwanda>
In-Reply-To: <20170717081711.4mj76r6qf2de4em6@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org


--dxempbyhgkz3lqlu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Pierre Moreau <pierre.morrow@free.fr>

On 2017-07-17 =E2=80=94 11:17, Dan Carpenter wrote:
> kstrtol() and friends can return -EINVAL or -ERANGE.  We have to test
> for both, otherwise the value is possibly uninitialized.  Also in some
> of these files we accidentally return "count" on error instead of a
> negative error code.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/no=
uveau/nouveau_hwmon.c
> index 7c965648df80..5e75af91c446 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -68,9 +68,11 @@ nouveau_hwmon_set_temp1_auto_point1_temp(struct device=
 *d,
>  	struct nouveau_drm *drm =3D nouveau_drm(dev);
>  	struct nvkm_therm *therm =3D nvxx_therm(&drm->client.device);
>  	long value;
> +	int ret;
> =20
> -	if (kstrtol(buf, 10, &value) =3D=3D -EINVAL)
> -		return count;
> +	ret =3D kstrtol(buf, 10, &value);
> +	if (ret)
> +		return ret;
> =20
>  	therm->attr_set(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST,
>  			value / 1000);
> @@ -101,9 +103,11 @@ nouveau_hwmon_set_temp1_auto_point1_temp_hyst(struct=
 device *d,
>  	struct nouveau_drm *drm =3D nouveau_drm(dev);
>  	struct nvkm_therm *therm =3D nvxx_therm(&drm->client.device);
>  	long value;
> +	int ret;
> =20
> -	if (kstrtol(buf, 10, &value) =3D=3D -EINVAL)
> -		return count;
> +	ret =3D kstrtol(buf, 10, &value);
> +	if (ret)
> +		return ret;
> =20
>  	therm->attr_set(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST,
>  			value / 1000);
> @@ -156,8 +160,9 @@ nouveau_hwmon_set_pwm1_min(struct device *d, struct d=
evice_attribute *a,
>  	long value;
>  	int ret;
> =20
> -	if (kstrtol(buf, 10, &value) =3D=3D -EINVAL)
> -		return -EINVAL;
> +	ret =3D kstrtol(buf, 10, &value);
> +	if (ret)
> +		return ret;
> =20
>  	ret =3D therm->attr_set(therm, NVKM_THERM_ATTR_FAN_MIN_DUTY, value);
>  	if (ret < 0)
> @@ -179,8 +184,9 @@ nouveau_hwmon_set_pwm1_max(struct device *d, struct d=
evice_attribute *a,
>  	long value;
>  	int ret;
> =20
> -	if (kstrtol(buf, 10, &value) =3D=3D -EINVAL)
> -		return -EINVAL;
> +	ret =3D kstrtol(buf, 10, &value);
> +	if (ret)
> +		return ret;
> =20
>  	ret =3D therm->attr_set(therm, NVKM_THERM_ATTR_FAN_MAX_DUTY, value);
>  	if (ret < 0)
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--dxempbyhgkz3lqlu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAllzQWIACgkQU3l4X80+
KSTEFQ//fklbl7W5Aix3EbXph0uO8i5nFVjiXuGvwHfKNI5hcfPMnj7f8kcMsEWW
Em67VVhp1domBjHpv1L+vakN4294w7pe9dNrCTgha3AlZ0oZfSmlI0mZWZ0tUlpo
vEi++chfCO4R9nmOxDrCgddAdp6VSRQvMfQIwxboIPihFVHDW+j/lGZUXU32tvWK
7tmBxnSn8fBDXvsH2GEWdMhG1m8L//5ZAVT6X6Kh/pqask0I1b996SaXehdX81N3
AglkZRomv6hMYv8w9lP9x2WgFKPgWV88JBSEIzefUxb8DbLHXnIFp0KWPN7yx9bu
lqANycr6pqnGA4lFETLcCTZC6LEV9sCVCj7OkpnKHBv2UhnA76gpzVGPiq/Ah9cT
5t8Y1U5zXSbr9grNiUjrij4yL2xZJOyLTo9JX7UONIz2ICEoDR+ES/QxwGN4bZ8I
k1rX6LVlgw3gNqLj+zqmJVDxmCJn9W5lC785VDxLnrcPOL0X/wqv7mJ2N1+3XEbx
IXkIlTW/YE6SxSsedG8jt/HobyTHf0D/LMpB6uICQr/mW1kZmd53ReFaMe6JY+Xb
HDkZL+sY6nclrn83OJt39Nz1/jaQpc7g2mfc6qj6KcCPvM2tZUz8JDFIHcHTBupg
eXrPRehsWva9kx8Y+XvaWQGZkgTQqEuSCmTcq9T+vz3o0NdlMvg=
=zHaV
-----END PGP SIGNATURE-----

--dxempbyhgkz3lqlu--
