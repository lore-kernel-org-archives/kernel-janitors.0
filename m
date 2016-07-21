From: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 21 Jul 2016 16:35:46 +0000
Subject: Re: staging: ks7010: Delete unnecessary uses of the variable "retval"
Message-Id: <20160721163545.GA1616@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="SUOF0GtieIMvvwua"
List-Id: <kernel-janitors.vger.kernel.org>
References: <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <6a8f4258-188e-36f6-28fa-1626c29cf361@users.sourceforge.net>
 <alpine.DEB.2.10.1607172056220.3177@hadrien>
 <20160720155333.GE1688@katana>
 <b249584b-47b8-ffd9-432e-986d69260ff1@users.sourceforge.net>
 <20160721062726.GC1664@katana>
 <alpine.DEB.2.10.1607210925200.2927@hadrien>
 <c3f1fe70-1270-602c-08ba-b8ba5acbe224@users.sourceforge.net>
 <alpine.DEB.2.10.1607211451350.2927@hadrien>
In-Reply-To: <alpine.DEB.2.10.1607211451350.2927@hadrien>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > * Do you really want to assign every return value from a function call
> >   to an extra variable before it is used again?
>=20
> If it's a choice between 1) function call on many lines, 2) function call
> over 80 characters, and 3) extra variable, I definitely prefer the extra
> variable.

+1


--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkPnhAAoJEBQN5MwUoCm2LSAP/3HcbD9R8G+OdGW+WoHe3LYM
OB8fSfPpTbxyk9zeaSckwR3C7ytWQUbZr4kTREYbfE8vPkLauqK2Zj/YNns5RL4e
pd5f6kkLPUmfrL/fzmd3rt3ex3JV8zz8efd8FqBwlI/WtsHDwPNubXF8/INY7lcr
smm4XFT1t3qXLQcoqDvvzFeFk3UGu3HrrmWdQM1VbcrW84JO/af2bj8LjDx4YbXu
EIA716IA7cd4FMloLyAvTO6J+5IOBw/9FwW075Ilo6uRRS34k1L/G8cxcbdkDdmq
Wnu8zuFwnNAexoHfLl2v8zQcSbuVVXkdHToGGhHDOzjFVt3ZgqQLIfBH4umAs4YZ
/ZhVmuzYbYKUIuEqJExUL9DQl+HORlZz5BA74ZZnD+kMXmQCwFytyQenBwTplcVg
PSusMs0F2QvTr4SGtcWm1nhVShpOumzN1LPKEd5XtHCbA6XPnTD+4Q0h5VqygFKk
RklAKX4F16UlJoBHEF/FXcwx1F4bIzwCn6GgIbKPjPQo6BpsRt0Ao09UGOkwGnnV
iGQCQ/Gfn0VhMqxgeppNiPhwbQuX+vNgltM04rCcO6zzMralonfSKRLP0FgrXq3e
FkpmqvQLUvWGKS60mybBLJ6OLfNI1mwMRd/PprTGfnFeuMCfyqi6+Tj4x2JVgNVK
hN1IVRjJXL+y2qsvnRpn
=Ngiy
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
