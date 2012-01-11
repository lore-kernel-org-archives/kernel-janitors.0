From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jan 2012 11:47:40 +0000
Subject: Re: [PATCH 12/16] Staging: quickstart: Use list.h API for buttons list
Message-Id: <20120111114739.GM3644@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1hVIwB4NpNcOOTEe"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326147815-11451-13-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326147815-11451-13-git-send-email-szymon@janc.net.pl>
To: kernel-janitors@vger.kernel.org


--1hVIwB4NpNcOOTEe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2012 at 11:23:31PM +0100, Szymon Janc wrote:
> +	list_for_each_entry(b, &buttons, list) {
> +		count += snprintf(buf + count, PAGE_SIZE - count, "%d\t%s\n",
> +							b->id, b->name);
> +
> +		if (count == PAGE_SIZE)

snprintf() returns the number of bytes which would have been used if
there were space so this test should be >= instead of ==.

> +			break;
>  	}

regards,
dan carpenter

--1hVIwB4NpNcOOTEe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPDXbbAAoJEOnZkXI/YHqR6YoP/iSIceTFMn7kS8k6vyiaw4m3
wBrNM3DF/Wns408bX6nDoVRNwJfLGbU1zVyBl0qaoJ+aksi1bmYwORI9QVQfPpRp
eLeej/CJWWLgoRM3em61j3dPYVdsm+bJ6eFEai42qq27bvcYIXRNs/QT4KkpSiGg
zzNq61T56w0xQ074zpz+oFeI7TgpZP+uScV7JllnCF3eP6kdSh8pA6szhyq/JE8M
I1OeQdDEC04q3w85acy2/iuTm6yiLrTcIzUY/NgeBNXw6fdACJ3L/zNi+Zbtvka1
wU/f0kNgQV+mhLP+UEM2n7sgUB2bci1wOefvj+47skdAxNcIzv3abVvxG8omX+Ua
KYLEdod+qXCBCNFqdUWtdf0tQ3jtGB2rkUs/IBb55Vuij8I0w4vJRM4gDzIUFK5Y
woeo2BTwQjC4pFpJpdgE//IB2Ds/NrrQQtYlezwFC2hThZqeoptfVaY9AnkUa8p5
pOsKmH7xSdCgxOA3331ijE2gDebToYwuXsiXwCsGe9geGWgMsSJ51UUX89FOR/Cn
OYy5WntsXBMUPBJTCfjvccuSwgsv4O8FZDouF4op1xdvPM2I1ZRxbyegaQ+9avvL
oLYZon0um47b6WtpYfaUPhIIrh1zsWgOfd2rAO+Jno89VPKy723VTE01IVH1iO+r
conreQ3U13zvspZYbfsk
=FZqc
-----END PGP SIGNATURE-----

--1hVIwB4NpNcOOTEe--
