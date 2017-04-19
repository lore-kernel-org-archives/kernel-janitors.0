From: David Lebrun <david.lebrun@uclouvain.be>
Date: Wed, 19 Apr 2017 14:05:04 +0000
Subject: Re: [bug report] ipv6: implement dataplane support for rthdr type 4 (Segment Routing Header)
Message-Id: <99b5955e-9516-cbde-c005-f0f858e1b6bf@uclouvain.be>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="FDgauix8An44NA28VvEF8dLWsrNXa8C2m"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170419135500.ntv67xcc3wnkkzr6@mwanda>
In-Reply-To: <20170419135500.ntv67xcc3wnkkzr6@mwanda>
To: kernel-janitors@vger.kernel.org

--FDgauix8An44NA28VvEF8dLWsrNXa8C2m
Content-Type: multipart/mixed; boundary="08xU9Owjs2nBbn6exDcX1cLRKDGxKd7AS"
From: David Lebrun <david.lebrun@uclouvain.be>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org
Message-ID: <99b5955e-9516-cbde-c005-f0f858e1b6bf@uclouvain.be>
Subject: Re: [bug report] ipv6: implement dataplane support for rthdr type 4
 (Segment Routing Header)
References: <20170419135500.ntv67xcc3wnkkzr6@mwanda>
In-Reply-To: <20170419135500.ntv67xcc3wnkkzr6@mwanda>

--08xU9Owjs2nBbn6exDcX1cLRKDGxKd7AS
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 04/19/2017 03:55 PM, Dan Carpenter wrote:
> Hello David Lebrun,
>=20
> The patch 1ababeba4a21: "ipv6: implement dataplane support for rthdr
> type 4 (Segment Routing Header)" from Nov 8, 2016, leads to the
> following static checker warning:
>=20
> 	net/ipv6/exthdrs.c:391 ipv6_srh_rcv()
> 	error: double free of 'skb'

Thanks for the report ! I'll send a patch to fix that right now :)

David


--08xU9Owjs2nBbn6exDcX1cLRKDGxKd7AS--

--FDgauix8An44NA28VvEF8dLWsrNXa8C2m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQT8nTbQ2eQR5sQwCJ+NvOfruxnoAwUCWPdukAAKCRCNvOfruxno
A28qAJ9hxEL3JHD8Y8/7MZYxZgD7edOqDACdHzlFF6o6UOIRc7BxeLeOXTe4pe0=
=wulw
-----END PGP SIGNATURE-----

--FDgauix8An44NA28VvEF8dLWsrNXa8C2m--
