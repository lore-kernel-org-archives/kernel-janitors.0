From: Wolfram Sang <wsa@the-dreams.de>
Date: Wed, 20 Jul 2016 15:55:00 +0000
Subject: Re: [PATCH 7/9] staging: ks7010: Replace three printk() calls by pr_err()
Message-Id: <20160720155500.GG1688@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="oXNgvKVxGWJ0RPMJ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <901acc3c-ff1b-6f0c-b744-2bfb36de18d8@users.sourceforge.net>
 <1468787163.1900.1.camel@perches.com>
In-Reply-To: <1468787163.1900.1.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>


--oXNgvKVxGWJ0RPMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 01:26:03PM -0700, Joe Perches wrote:
> On Sun, 2016-07-17 at 20:27 +0200, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sun, 17 Jul 2016 19:12:27 +0200
> >=20
> > Prefer usage of the macro "pr_err" over the interface "printk".
> > Fix a typo in an error message.
>=20
> Please and and use pr_fmt

Can't we use dev_* on the SDIO device?


--oXNgvKVxGWJ0RPMJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj57UAAoJEBQN5MwUoCm2/RAP/RCnCbV8Q7z8mxiIWIe26kpT
nTYL9kSQTATA7pe7Uy8Pph4eEVp5gdQU+9Qj8kYv9jUqjG35eXsnAwKnQATYk6ej
8PUumblhba5o3fR4zkQ2ZztaNZaM6fgm/60EJlACx/eF6+mopIb4mx1aSTwhhaoN
ReiiLDXcACVw278rulgq+IUmUV47XROjhn27Tcqxfu/6TI66e5mGmg+J+pWJoZG5
1m6sg+HgNmXWJPMSb5apnpg0VpS1KOHDBx8GkEno7v5if0zwpu7hn4mFELK1arzS
ka2Y1xYNXZlCPNLvg//vhZvM+XZmkht6wuUQdjRlVgG3BDj9APWdNRaUbJ9wCRzI
FArfZZbh1j3L43KZnhsSM7G8bBoW5TYU/0+JQfxqKQg9NIQWevQRr/luPe2U2wTr
wMhOJS4+MNmBcj+beBD4fnB76vPB3Iz2vMH/lahng2pcIawy6/JO+AKOw6+csEO9
v0LKRS0O5gXpbcEyfKyvXq6T9AAW5pq75IV4A9j8cwAEPsMUrHL5sSgRVAmdDP0S
tkqpDWL5xgRBqT9IrDa1uPRNzI4JF8OM2P8Ki0MDIs6PqNi1gcOIOpdXsz+LRSs2
vtcmu3rX4tcOJNWs6pz3CVHbuH0W4ObNFv6mXz+Tu+UZVsACLF//Gbvf8ou5xcX1
FhartlTr1UCAZJrcwjW5
=IiSh
-----END PGP SIGNATURE-----

--oXNgvKVxGWJ0RPMJ--
