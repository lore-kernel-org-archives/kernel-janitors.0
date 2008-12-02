From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 02 Dec 2008 23:19:01 +0000
Subject: Re: [PATCH linux-next] powerpc/powermac: Add missing of_node_put
Message-Id: <20081203101901.4f317425.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Signature=_Wed__3_Dec_2008_10_19_01_+1100_WWFdrGq5wBXyzaor"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200812021445.18670.npalix@diku.dk>
In-Reply-To: <200812021445.18670.npalix@diku.dk>
To: Nicolas Palix <npalix@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Julia Lawall <julia@diku.dk>, paulus@samba.org

--Signature=_Wed__3_Dec_2008_10_19_01_+1100_WWFdrGq5wBXyzaor
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thanks for all this work.

I think this particular patch is also required against Linus' kernel (not
just linux-next).

On Tue, 2 Dec 2008 14:45:18 +0100 Nicolas Palix <npalix@diku.dk> wrote:
>
> diff --git a/arch/powerpc/platforms/powermac/pci.c b/arch/powerpc/platfor=
ms/powermac/pci.c
> index bcf50d7..800fcce 100644
> --- a/arch/powerpc/platforms/powermac/pci.c
> +++ b/arch/powerpc/platforms/powermac/pci.c
> @@ -661,6 +661,7 @@ static void __init init_second_ohare(void)
>  			pci_find_hose_for_OF_device(np);
>  		if (!hose) {
>  			printk(KERN_ERR "Can't find PCI hose for OHare2 !\n");
> +			of_node_put(np);
>  			return;
>  		}
>  		early_read_config_word(hose, bus, devfn, PCI_COMMAND, &cmd);
> @@ -669,6 +670,7 @@ static void __init init_second_ohare(void)
>  		early_write_config_word(hose, bus, devfn, PCI_COMMAND, cmd);
>  	}
>  	has_second_ohare =3D 1;
> +	of_node_put(np);
>  }

This part looks good.

> diff --git a/arch/powerpc/platforms/powermac/time.c b/arch/powerpc/platfo=
rms/powermac/time.c
> index 59eb840..394593c 100644
> --- a/arch/powerpc/platforms/powermac/time.c
> +++ b/arch/powerpc/platforms/powermac/time.c
> @@ -265,12 +265,14 @@ int __init via_calibrate_decr(void)
>  	struct resource rsrc;
> =20
>  	vias =3D of_find_node_by_name(NULL, "via-cuda");
>  	if (vias =3D=3D 0)
>  		vias =3D of_find_node_by_name(NULL, "via-pmu");
>  	if (vias =3D=3D 0)
>  		vias =3D of_find_node_by_name(NULL, "via");
>  	if (vias =3D=3D 0 || of_address_to_resource(vias, 0, &rsrc))
>  		return 0;
> +	of_node_put(vias);
> +

But this needs to also do the of_node_put() if the above "return 0" is
taken i.e. if of_address_to_resource() fails.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Dec_2008_10_19_01_+1100_WWFdrGq5wBXyzaor
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk1wmUACgkQjjKRsyhoI8zgWgCffoqxkxrFkBlN8yL6i1vzoj4g
ZsIAn25E5T+i24Wp2RwAzm3PMXPyKQ0Y
=0dBa
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Dec_2008_10_19_01_+1100_WWFdrGq5wBXyzaor--
