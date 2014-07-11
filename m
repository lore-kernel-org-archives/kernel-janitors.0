From: Arvid Brodin <arvid.brodin@alten.se>
Date: Fri, 11 Jul 2014 16:12:31 +0000
Subject: Re: net/hsr: Better frame dispatch
Message-Id: <53C00CEF.1070100@alten.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140710210037.GA14669@mwanda>
In-Reply-To: <20140710210037.GA14669@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 2014-07-10 23:00, Dan Carpenter wrote:
> Hello Arvid Brodin,
>=20
> The patch f266a683a480: "net/hsr: Better frame dispatch" from Jul 4,
> 2014, leads to the following static checker warning:
>=20
> 	net/hsr/hsr_framereg.c:293 hsr_addr_subst_dest()
> 	warn: this array is probably non-NULL. 'node_dst->MacAddressB'
>=20
> net/hsr/hsr_framereg.c
>    286          node_dst =3D find_node_by_AddrA(&port->hsr->node_db, eth_=
hdr(skb)->h_dest);
>    287          if (!node_dst) {
>    288                  WARN_ONCE(1, "%s: Unknown node\n", __func__);
>    289                  return;
>    290          }
>    291          if (port->type !=3D node_dst->AddrB_port)
>    292                  return;
>    293          if (!node_dst->MacAddressB) {
>                     ^^^^^^^^^^^^^^^^^^^^^^
> This test is never true.  It could be deleted or replaced.
>=20
>    294                  WARN_ONCE(1, "%s: No MacAddressB\n", __func__);
>    295                  return;
>    296          }
>    297 =20
>=20

Yes, this code (the whole if block; lines 293-296) is useless and should be=
 deleted.=20
Thanks for finding it!


--=20
Arvid Brodin | Consultant (Linux)
ALTEN | Knarrarn=E4sgatan 7 | SE-164 40 Kista | Sweden
arvid.brodin@alten.se | www.alten.se/en/

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
