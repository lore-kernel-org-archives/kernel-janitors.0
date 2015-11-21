From: Marek Lindner <mareklindner@neomailbox.ch>
Date: Sat, 21 Nov 2015 21:47:11 +0000
Subject: Re: [B.A.T.M.A.N.] [PATCH 2/2] batman-adv: Less checks in batadv_tvlv_unicast_send()
Message-Id: <9988401.mi5Gfk0igO@voltaire>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart3115496.lf9YDrhiNn"
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <56484502.8000206@users.sourceforge.net> <5648463F.3070403@users.sourceforge.net>
In-Reply-To: <5648463F.3070403@users.sourceforge.net>
To: b.a.t.m.a.n@lists.open-mesh.org
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Antonio Quartulli <antonio@meshcoding.com>, "David S. Miller" <davem@davemloft.net>, Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--nextPart3115496.lf9YDrhiNn
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, November 15, 2015 09:45:51 SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 15 Nov 2015 09:00:42 +0100
> 
> * Let us return directly if a call of the batadv_orig_hash_find() function
>   returned a null pointer.
> 
> * Omit the initialisation for the variable "skb" at the beginning.
> 
> * Replace an assignment by a call of the kfree_skb() function
>   and delete the affected variable "ret" then.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  net/batman-adv/main.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

Applied in revision 5a878b8.

Thanks,
Marek

--nextPart3115496.lf9YDrhiNn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWUOZfAAoJEFNVTo/uthzAmIIIAIhojBp2a/my4W/0Q1Q5mhMr
ZlWxOIdgKhWPsYJ/OGPNEgpLHa543ItCCyiF0lf4N3NUEvhCoMmLJhOWqS82KoUM
X7oxaBJe4hjIOWkNSozWWYvERt+FlBUBUOQyWMxoEmnRvYcdyRG0DuB1s1tyWu88
1KqGJY8n1a8ogQim3sBCsmMNZyF33W/5t26cyogrZjiKwheA8K0BX92pjjgxY/0J
OzOhCNHn0O+bI3B/n9teKM80ZWbp74ffiChHl/v+Nf/K2U2fySiHnaRSSb7z/YjG
meknJjGKc51xb+RkAt8oVtPnj/hYv1IS9PL0vo9C+fNiqrRytOs1jFP7XJ8yIyM=
=Wl4b
-----END PGP SIGNATURE-----

--nextPart3115496.lf9YDrhiNn--

