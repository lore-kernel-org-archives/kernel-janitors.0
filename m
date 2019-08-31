From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
Date: Sat, 31 Aug 2019 10:30:18 +0000
Subject: Re: [PATCH] staging: exfat: remove redundant goto
Message-Id: <295459.1567247418@turing-police>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==_Exmh_1567247418_4251P"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190830181523.13356-1-colin.king@canonical.com>
In-Reply-To: <20190830181523.13356-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--==_Exmh_1567247418_4251P
Content-Type: text/plain; charset=us-ascii

On Fri, 30 Aug 2019 19:15:23 +0100, Colin King said:
> From: Colin Ian King <colin.king@canonical.com>
>
> The goto after a return is never executed, so it is redundant and can
> be removed.
>
> Addresses-Coverity: ("Structurally dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Good catch....

> -	if (dentry < -1) {
> +	if (dentry < -1)
>  		return FFS_NOTFOUND;
> -		goto out;
> -	}

But the wrong fix. The code *used* to have returns like this all over the
place, but that meant it returns with a lock held - whoops.  The *other* 287 or
so places I changed to 'ret = FFS_yaddayadda',  followed by a 'goto out' but I
apparently missed one.

And thanks a bunch for feeding it to Coverity :)



--==_Exmh_1567247418_4251P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXWpMOQdmEQWDXROgAQIm0w//aPU0Rv6gMxB2mP0p2L7LaEtmwIdoEwD9
ntgSn8am4fv/Zi99Y7BOBzCw5/KAyV8qo0V5LzIt4seIgXCa+I/gd12ngxmfRt1B
0HAjQQQZl5TX5l2gnAzTIlUasA6mnxkb27/9x+qSUZRwoCRSliQC4wsaNzHbDO0y
iSNdDeiRz9hqSHtim2p7OJG2DSMTzrahN5BYD58a78/ocgOGjokb4v1nSHkU2zIS
+3C1AhCU9K6o9RedPZ3aoLELlWfwXa6EWgtiMsNC28ay/b0LkJBiA8XelQkdlfmE
mXq+g51uNim/ZT5m2YZWx6znD/SjGbwBgmftA/oawZuw4REpvAHVihULK5SGVwNn
ClPsmzGIzLvlDeAE3NKnyMAZZ5/Ip49aLxjViJMAPKFhTOHpI8mKJFYjKja8DF/c
Bu16fZqvbm7Ux50iljUwc94NEVw1QDefd8PkTc3UgwInv54xpUvb5pckweHWe8bj
FANfoJKJWmYy2aDIHyww9Yj5obKJLazQTISnUZrpgP8b2HlvFolaLC/669sLd36v
Rdvz/nNh5bUL5vA8nojDQ+mSYMEy5zi38hRQdGnM45IW1K+GOquDRRTl3w82DNRF
TfuiZym2//hGZFaPD/tZuGLwmWcxN+5gvn6U5IPwaBHnDwYf4GgHmqh0G0PaOg5W
v4SY1xOsplg=
=O42f
-----END PGP SIGNATURE-----

--==_Exmh_1567247418_4251P--
