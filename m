From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2012 09:51:58 +0000
Subject: Re: [PATCH] staging: wlags49_h2: Replace kmalloc+memset by kzalloc and add error handling.
Message-Id: <20120323095158.GB3181@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="QKdGvSO+nmPlgiQ/"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 23, 2012 at 03:11:45PM +0530, santosh nayak wrote:
> -        dev_wds = kmalloc( sizeof( struct net_device ), GFP_KERNEL );
> -        memset( dev_wds, 0, sizeof( struct net_device ));
> +	dev_wds = kzalloc(sizeof(struct net_device), GFP_KERNEL);
> +	if (unlikely(!dev_wds)) {
> +		printk(KERN_ERR "%s: failed to alloc memory\n", __func__);

Don't resend, but kmalloc() already prints out way more extensive
and useful error messages than this.  No need to print an error
message yourself normally.

regards,
dan carpenter



--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPbEe9AAoJEOnZkXI/YHqR9MsP/0fdqlHsE4Rv/Qvr7pRhEl2B
XNgEG+o3Lg4uIERqaomnJ346LBeqUHa0AWtNR8qiYge+RyF1M1RiyWnrO9Ufy86h
i2q8OjaehK3HQAX0+YlhW72mHDht0Xa/ozxHmuwJpFw7V4IEll3Bqvhm0jk4xKqa
YPW1qQiDfMF5xqqBAtj/0nK0TA/SVPYrx49xaeGBCCaVSqmLN9VIMcFhc5Rg0rW/
em+j3WwdUc3A0HlIDqaL6szYGg9RzA8+ehBGklJ+YTeyv5sbOWDaT1+Nbqvr89t3
08Ct1FAjiF1ytB6Q9WCob/oc0Owzk8nzigs3hNGMUMVCep1HTFdpTdCrs/oNsQp7
5wIC9HQHUFjAslkVNBz8tB1CxBVZKKgrSIYvHKU5GZZBYVa6Rj+dXaTEzIO/XicC
XGVy+vI/ppcINO44zqV4jGMQBtNwXSrSuVoEz4FY8sT9+dN99d/VVKF0rRWjMLtM
g4H17EM7iBvFWnpzn3k+7/9FGe5bcBZ9kMr8SMPqaVZQBYTPYdzcWlwp/wjphVix
fU72hhSyWw5yOhmqKGdtuNCXNtw+nBTtbwoRxKC852P0pOzaosRVr17iHhIlMCAO
lv9wrTFINRL2Ybcz3pVOGIUca9xdVy8LFePL7l4+B2nBUKUKHCIAKO1NpKwIOEbx
lcZzWhQ1UPa01johtkxy
=rc6j
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
