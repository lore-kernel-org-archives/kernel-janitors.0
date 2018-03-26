From: Simon Wunderlich <sw@simonwunderlich.de>
Date: Mon, 26 Mar 2018 12:57:02 +0000
Subject: Re: [PATCH][next] batman-adv: don't pass a NULL hard_iface to batadv_hardif_put
Message-Id: <6736928.QjjYfqFu7x@prime>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart8955457.PBE51fOHfl"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323225350.7350-1-colin.king@canonical.com>
In-Reply-To: <20180323225350.7350-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>
Cc: Marek Lindner <mareklindner@neomailbox.ch>, Antonio Quartulli <a@unstable.cc>, b.a.t.m.a.n@lists.open-mesh.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart8955457.PBE51fOHfl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

this looks good. David, would you pick this patch directly? Otherwise, I can 
send a pull request, but right now we would only have this single patch for 
net-next.

Acked-by: Simon Wunderlich <sw@simonwunderlich.de>
Acked-by: Sven Eckelmann <sven@narfation.org>

(just discussed with Sven offline)

Thank you,
     Simon

On Friday, March 23, 2018 10:53:50 PM CEST Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where hard_iface is NULL, the error path may pass a null
> pointer to batadv_hardif_put causing a null pointer dereference error.
> Avoid this by only calling the function if  hard_iface not null.
> 
> Detected by CoverityScan, CID#1466456 ("Explicit null dereferenced")
> 
> Fixes: 53dd9a68ba68 ("batman-adv: add multicast flags netlink support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/batman-adv/multicast.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/batman-adv/multicast.c b/net/batman-adv/multicast.c
> index de3a055f7dd8..bd0ea374d043 100644
> --- a/net/batman-adv/multicast.c
> +++ b/net/batman-adv/multicast.c
> @@ -1536,7 +1536,7 @@ batadv_mcast_netlink_get_primary(struct
> netlink_callback *cb,
> 
>  	if (!ret && primary_if)
>  		*primary_if = hard_iface;
> -	else
> +	else if (hard_iface)
>  		batadv_hardif_put(hard_iface);
> 
>  	return ret;


--nextPart8955457.PBE51fOHfl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE1ilQI7G+y+fdhnrfoSvjmEKSnqEFAlq47h4ACgkQoSvjmEKS
nqFH1w//Yp5bHP7Izw/DndQ3ekThi16/0qDVMjbRWWQPTgBehexeXSA9snveR/rU
PK1i7EVE0Eu4HSfjTDWJK/X3Ea2gGq4Z7HcHIgEz4nj3TCwhlAOuoGsEKSgE2GLw
kfHHQGbIOMjHpjpkqV4r9vIaUwf45SrV5tSZYVmAoycpZ44r9hUVPFOFVCr3qnMe
i2h33lEm2rvS80T2gmi/OUmDM9nnBc17F0nYQnYP8UfO9tDihohKcRIZjCueRA8g
mtC7S+KGqW3GpeToiuM4gpEaqqUDdHU103Nx8/M+g/JZ3eT1ZsD8oyYax822hz0G
/x9r2ISIOMzqh9+8ZrmroyLR2roPvlp09Id8iBQrMdlJFKittm86WB4enc27q3vi
Pp3azGy6MK0hcKxwYd59QnTsW2lqSR+S7EABD97MH7uOlGDJj4is1ql/KQuHljIT
XZsgQQcrjaxaMHrNbbCFRyu30jm/FG0dkihBYssfvEhQmy2G8P33IvXN1p+7lit2
IDRuEjmEBl3mN+FI4eexHF7MKthH+BM3Md4gh7k8E9B2vin+AzgD/zoFA1dCKI0h
x6TyX4J2Jk85Rqm9wSx3FxkdmrTCgLC2Bn9qU0N3AO07gh2RjejdBKNcMzNRjCGF
gIsHTNgDI7JlXxjffFhE5dSx4HHXnAZm7s1g2VOk2hO7kPtWhyQ=
=rBOg
-----END PGP SIGNATURE-----

--nextPart8955457.PBE51fOHfl--

