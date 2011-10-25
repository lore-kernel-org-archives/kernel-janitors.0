From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Oct 2011 09:22:36 +0000
Subject: Re: [PATCH 3.0]isdn add audit to request_region
Message-Id: <20111025092236.GB9887@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="wq9mPyueHGvFACwf"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAAgJb5vScDn0j4aTr498OWGr31bjGwLofyfaaAXzshXf8O68_Q@mail.gmail.com>
In-Reply-To: <CAAgJb5vScDn0j4aTr498OWGr31bjGwLofyfaaAXzshXf8O68_Q@mail.gmail.com>
To: kernel-janitors@vger.kernel.org


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2011 at 04:18:47PM +0800, Jimmy Pan wrote:
> Add three audit for request_region() function.
> Mere newbie here, I don't know if my style of posting and developing is c=
orrect.
> If anything I've done wrong, please correct me.
>=20

This patch doesn't really do anything worthwhile.  It just adds some
debugging output that no one will ever see.  If you really need this,
then can you explain why?

Other details:
1) The patch doesn't apply.  Your email client line wrapped.
Read Documentation/email-clients.txt  Send the patch to yourself.
Save the raw email (including headers).  cat raw_email.txt | patch -p1
2) You need to add a Signed-off-by line.
3) CC the right maintainers.  Use the ./scripts/get_maintainer.pl
Add kernel-janitors as a CC and we can give you any hints.

Don't worry that your first patch was not accepted.  Everyone starts
as a newbie.  Welcome.  :)

regards,
dan carpenter



--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOpn/bAAoJEOnZkXI/YHqRaGQQAKhpckLeHeSAxqIAZscGS7se
yeimj6p5iGHmGEJgihJu1zSmTNdeDM+10zcuUal0X3NNDmJsglcuTVHY5srjOxdD
aug6jK5Z9rz4uRyGU/iLWlZR39KdRvHZeaDXSRpOz6p4cbK+qgfh3Db6l54PLHI1
QEkKraYmkv2Li9Gj2hyNu58N56JMiXZ2+b+or+DS/6PmTNWt2ekL1deMEJkEdPOK
g5B6B1pPAFdIwgrkMki68wC2u1BCU7nO3c9JXZ62boM4xU1B2Ur4qTO5fka2hgap
xFdtr2pJqeFpYXVWt9IA+Y/klxE9PiHQVQZ1Wo6x9YGfDRKxJgijdXqMe4kIKCSM
/KnHICB8vnhFhKnSEt/id/YK7Cf4mWkeBBqbV21hR2l0VSLDNFCJs0Z1JVepDgNd
AFbfZku/HjAqCvgntjlOQTgjKprImO53pM2YgDMmmJzW43cR7dyswUUzqIOd9ahZ
4EMZ1vvWRImzCTsHjC2Bsj76qo09bdkAER9XCz8WSgcOZMuwjPzaUlyIf3EAL4Xc
Fi5Jq9ncgemHe2KW7vdaJzTW5gMqT7vcsopS1Wi8V5/ezPtecm+rdefIuxSA+4cR
Wenz9JLNyG1s8Z+K9G8RMeGC/CrniNlO+Ar5SdkAJUcyB3V/xASsgU3th00Z596u
D7PSL6HtOZMI8ipYFFwR
=sB8g
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
