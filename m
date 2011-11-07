From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Nov 2011 05:43:06 +0000
Subject: Re: [PATCH] drivers/staging/vt6656/iwctl.c: Remove PRINT_K macro
Message-Id: <20111107054306.GU4682@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="yIMHf/Pa6CzSkARF"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1320634885-5845-1-git-send-email-marcos.mage@gmail.com>
In-Reply-To: <1320634885-5845-1-git-send-email-marcos.mage@gmail.com>
To: kernel-janitors@vger.kernel.org


--yIMHf/Pa6CzSkARF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marcos,

This should be sent to devel@driverdev.osuosl.org as well.

DBG_PRT() is just as bad as PRINT_K().  The first example in
iwctl_siwscan() should be either pr_debug() or dev_dbg().  Also the
message itself is wrong.

regards,
dan carpenter


--yIMHf/Pa6CzSkARF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOt2/qAAoJEOnZkXI/YHqR6ogP/jEaAu9yYe3QUf756xKyCjvE
/ezBnesuGly4zT8uLZXhYwjdgVYx3gB/eUyGcVRYJITo0ToXPDevzlPLybGZu21g
Ctb/E4fGRfuQ1Hg2Cf34yw1sKJzn5wbI38puoqQJ7HWsDettZnfwXUDRfz7UUdsT
r6/eFqhZNlb+gMUFePaTd2ue3qCUHP4orrv1JyrWoH36UzgBbE9CovlPeRzfoJ+V
wmlXFAj/1AxqX3jHeKZTqGejDgIGBe0dyPcJNC7xX6Xm2fDVUXNdNtV5DYQsuBPW
Ey/rFPwdQi3BknO/oSG2tKEU+ENwuZV/K6VGAP8dc65umascB5NZrHfDajJSPZIh
kd5ENQFyFOQj3YysABOVaKemDv8/FIimKVSN8hHZjZ5w2wu1YUQuv3W3WRs9ey4A
tMXlGghZ9m4gk96zsy24G1p7xfiSiw1uuHe3djaNJhcEK/cDWZJQk7kgBdXzOWYo
rrwsxspeT0sofLxAP56Wc8rdyzzTSPyDUqRH06rOHNy6oI9w0PMuwbfh39gEm9iN
v9X+P4CcjxIU4Ac+XLEBDXwQHEbQrFq8qIKyCHXM4JODQJfTcpbEDrFMfRWXtTly
Q/a2fkcHjSi6t2mWttfraADSQMWEJwIbFle6ueNzc6Vn7V9E66y3xnrRPDpg/vA9
8n69ZEkD34IICyLpXrLv
=QRdA
-----END PGP SIGNATURE-----

--yIMHf/Pa6CzSkARF--
