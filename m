From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2011 06:37:58 +0000
Subject: Re: Is there concept of EOL and LTS in linux kernel
Message-Id: <20111208063758.GI3236@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="r4QXMf6/kyF/FvJJ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1238080865.4631101323318218585.JavaMail.root@tilmb16.indiatimes.com>
In-Reply-To: <1238080865.4631101323318218585.JavaMail.root@tilmb16.indiatimes.com>
To: kernel-janitors@vger.kernel.org


--r4QXMf6/kyF/FvJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I don't remember the exact rules, but it's something like this:

1) Linus releases the kernel.
2) It is supported for a while as a -stable kernel.
3) Some kernels are selected for longer support and supported as
   -longterm kernels.

Currently the 2.6.32 kernel is the oldest -longterm kernel and it
will still be supported for a while.  I don't think 2.6.33 is
supported any more.

Honestly, I would prefer to use a distro kernel over the -stable
kernel.

Oh, and btw your question is totally offtopic for this list.  ;)

regards,
dan carpenter

--r4QXMf6/kyF/FvJJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO4FtGAAoJEOnZkXI/YHqRyoIP/jAR8AN29mRC7MP8HsnvOWnE
4nKEDTkYUwkcf3PGBCwfJUrQkK9wW5NRNw/Nq9LDwX7Js9EfIbxkc6zALTJ+BE1C
o7T0iSFc83wx581mGJu3VNEptHx/8f7T3xVppom4cRIXBKBNVD+6oT+JVW0wvYoe
0xzMgoX8cger3e2uO95BbQ/ZYws6+SS9xDX64CYUcv3gp+u2NDiPQe2PrjB6S5/F
amIrEtC+R0jGn9QYCyxMrU7UhL+Bb7Dz2PH1EzKMDzfVZo97wYhVxDID8MtFQBCS
RC1nSZXH37XXPy2wPaXCc+gRVfCAxCFN+Ukdt3BOZ9sJVuDbNplbTx8GUFbl51/o
D/W9eTLUsNMzUTDy1E4hP92djrdX+2p3pqfDP1YzwXxgrNrIo94igCl3HJWRofMg
b9ZG3PgIjYuTsBfAnnREWjioCDc+svtKhpLNwaEKN/WO67x4my0gwtIeGwCFBMsF
dC+0H3WDasA19BPZlu5twG+DqJvd3OpJrU2nno90emLCG8cxz9WoRQNKrJZGo7Vb
ca/EC0n2J35/36ZW5G814bDlkhKjLfzQaICnHLfkzAZN0sdDHz3yFxC7DzE9x1HI
7gtP8oxDlfPz54DRFGLwBgfUd0+s6fZ4Hfqcy23PPW6Ms1Z8lEE5CFPdJkCTJ0dI
kZETWlsKOANYTrNp2P/0
=g9TR
-----END PGP SIGNATURE-----

--r4QXMf6/kyF/FvJJ--
