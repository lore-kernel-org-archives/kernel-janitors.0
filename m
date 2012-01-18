From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Jan 2012 07:37:30 +0000
Subject: Re: busy loops in kernel
Message-Id: <20120118073730.GG3294@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="t4apE7yKrX2dGgJC"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
In-Reply-To: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
To: kernel-janitors@vger.kernel.org


--t4apE7yKrX2dGgJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Interesting stuff.  You guys are doing static analysis on the .o
files?  I'm looking at the first line.

ticks 25 What does the ticks count mean?

Infinite Loop:142  Ok.  I see this on drivers/atm/zatm.c line 142.
It's a real infinite loop (if you're zatm hardware is broken).

Dynamic array:393  What's this?  I don't see any dynamic arrays in
this driver.

regards,
dan carpenter


--t4apE7yKrX2dGgJC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPFna5AAoJEOnZkXI/YHqR/KYP/0kdl3P+cH5N/eoyciO9z3l4
rfyATnMQr5qrkZ6g3nkuain4OtaBQJAZ8LduiJ0DJbMOqNzkiS+L9yzqSbRrpr0O
HRbdXRiTZ4KxY6813mgq1ghF82qowREjE+pBJcN09d7HSGL7BmVzNx7kkDEo1yyD
YRdcTrtqG58xi/Ea9Vg4Bja3dwdJhXyuPNIKx7IFM+wMUoO9kCmPDPvZQfhKfdAW
XHR5IjQdd7OK5EDtPTMlfnjgVI97/rA55WdAUugOY/vFMgmoHhSWVMENfLjbJfxB
ktzQtdCIVsLsaqg0y6lJDzYeXFUQ9Peqffb0D+vPv4R/jYpLhiHC0GZiWR3lJyPN
5CYVGs76pTBZI5iP42ly/qvkPOQQYTo99m6pwG/4f24ejc3eNgDXOmMXkxt0xfzz
2o0TEhw0LqTQzQaTL1ktkhQLFaEfRbSNCR9em/Ys6VoRZdTu7TFVgsGz1/ZUxsYb
FrSDuUSh+sSM0tEI3EDN3CwvtgZbdaUUg75aPFaBJjZP0sNk7ZzzfBzGG6sSjP6z
/scTu5NJmK3XkDRvEwvzzCgpHw6V48M05BFPUxVzJ4CKX2oJFKyNt0ASCDoeJ3n5
T5M4D6Ec5wopz3MAmrkEsedyxjUKR/eV08RT4XtKraYjvkT/vLvn3LTPnfhthMGH
peMgaV0IgoV4mn+WKt9K
=vWOA
-----END PGP SIGNATURE-----

--t4apE7yKrX2dGgJC--
