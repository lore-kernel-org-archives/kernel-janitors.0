From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sun, 03 Jul 2016 20:04:23 +0000
Subject: Re: [PATCH] phy: fix error handling
Message-Id: <20160703200423.GD4604@lukather>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="TybLhxa8M7aNoW+V"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1467525332-12963-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1467525332-12963-1-git-send-email-christophe.jaillet@wanadoo.fr>
To: linux-arm-kernel@lists.infradead.org


--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 03, 2016 at 07:55:32AM +0200, Christophe JAILLET wrote:
> This is likely that checking 'phy->hsic_clk' instead of 'phy->clk' is
> expected here.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXeW/HAAoJEBx+YmzsjxAg0A0QAKU9R0boBhPHMEcxol9vMAai
1Iq7xhr1vLDVRgn5hOoUSVzPl6VtB97orfsAICFtfVCIFsQKg50U4EicqcVlJq7h
6DTEHKOy4eXbwsc9w+vh6xOpE/8N8dz6LrGTE33RKMhf4jJf6SeYgdiYJT29HiW2
R56dspyYht+uNy3FuXe82k7BhrC99aoYHlX1AY6NImkMvpvg1p6/7w6Hp6NoR+QA
KOdmIjUoIAABGU53Zq4JMvi9LuaGjMU5qgt6cOWmFBJ4qX0u8ID/KoFL+EcZLCY8
8psd4JFx5FbtQgHxuyA4riwn9cLaeYetSFKJb/5dVLwTkmB9nEbQ9xW3TH7IbOfs
rPrCBYRr8osRLJbZxeIOqXahpklZJXHCezzx2/f1d7rTAwtzJBym7Odo0cmskIiw
mNJri0ITSi2JQkFHTAv1Noez4rse7RNcI2iocPTDit1R4qfD30DUhFMSkwl/AZWL
Vzm5n9zTlEpCPypFy5mjPERxqxHNVAt5MfjTPALJd6qVjPniA4AASr7AXBEGE0I5
5lg9OvLa4iCA1Nv0Aynlm1y2oXs1rHxr0p7Z+HUHPcdxfy6OvKUyfoCkD1SlrZiW
Ju+ZlXFKA6ulChoUHj0l+67MEGlB9w3Reo46+L4E8WZnaeqe1Ia/6ywUEA+VCfIR
8fh0qweOKHqcYQGRWYjb
=IekG
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--
