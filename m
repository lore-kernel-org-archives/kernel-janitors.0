From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Thu, 22 Nov 2012 10:31:37 +0000
Subject: Re: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
Message-Id: <1353580297.2701.29.camel@sauron.fi.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-zYHTm0CMNzcZ/Pr8CVX+"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121117151126.GA16900@elgon.mountain>
In-Reply-To: <20121117151126.GA16900@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>


--=-zYHTm0CMNzcZ/Pr8CVX+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-11-17 at 18:11 +0300, Dan Carpenter wrote:
>  	out_len =3D le32_to_cpu(dn->size);
> -	buf =3D kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
> +	buf =3D kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
>  	if (!buf)
>  		return -ENOMEM;

I think this makes the code unreadable, because we really allocate a
buffer, not an array.

--=20
Best Regards,
Artem Bityutskiy

--=-zYHTm0CMNzcZ/Pr8CVX+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrf8JAAoJECmIfjd9wqK08cYP/jOl53JXbK3VY7CZ5sd56MIV
tlyeDlvbGYMY6DP7MDvpxR3EUoa484XqNoYfVMH95Gz+I3Q9P2ec9EBP1g39JikV
WlHU1oCL8wpzceCl1mTLpt+guz1Bb6/+B/hwRZxQfRNtOT3FNGU9BILRpGTlTgcD
s1+mZNeMWej6UnEgAlndSR44aBDlnMIQxk4LmjOYOx63wT+Ddaqqvi2XMjPyvu3E
JnXkpit78r2ijJVMiuNrVqEIXEHwpbVU6dVZNt6XsHlZVpnJkyNbWnnzvap1VRZ5
FR5ValzXq5bKofwvC5lgmNldHxcimZEaaOgCDZVZDSahB+jWVgZqGd4bW0WloQyU
Fufp/K4fTdiMh1gSjmxX+ZjZlGHR6Y6UQpGa5oYuZOes56cckoC0JnxmmwfJh6qZ
P3BLCk/1Xf/HzZuw/a4khVNSWq1qA6aD6oz1ib3k2AH0jr73l4OTi5cZSSENFiI7
WqPqmx3gtjBOARKHnHmME4Emz5dUjieeEq+lMAIrwPUkaTglw1xgeGoBa8d0b3DI
hE6to24S1dn8A+OdKUxJFuUFIa1g+0IWvhVFfUxEqkzCu35qXtODIVhvDTE4c1D3
Btyy7GtiXqZ1XUsxqMIc8UN3RrbBuecCSZGp7NyVJWxBb98UyOsunce9mlEJ9BmX
S6aaSrU979ZB+LzFh8lZ
=PKkJ
-----END PGP SIGNATURE-----

--=-zYHTm0CMNzcZ/Pr8CVX+--

