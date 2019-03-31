From: Mukesh Ojha <mojha@codeaurora.org>
Date: Sun, 31 Mar 2019 09:56:02 +0000
Subject: Re: [PATCH] net: dsa: fix negative loop bound error on for loop
Message-Id: <3723042a-88db-fa87-02ec-4ff231bbaff2@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330214241.15311-1-colin.king@canonical.com>
In-Reply-To: <20190330214241.15311-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 3/31/2019 3:12 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the for-loop using an unsigned int for the loop counter
> which is problematic when comparing it to the signed int count
> This is an issue because if the signed int is negative then
> the negative loop bound is implicitly cast to an unsigned int on
> the comparison to loop counter i and will yield a very large value,
> eventually causing an error when memmove/memcpy'ing outside the
> allocated region pointed to by ndata.
>
> Fix this by simply making the loop counter i a signed int;
>
> Fixes: f2f2356685bc ("net: dsa: move master ethtool code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   net/dsa/master.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/net/dsa/master.c b/net/dsa/master.c
> index c58f33931be1..1b659647a303 100644
> --- a/net/dsa/master.c
> +++ b/net/dsa/master.c
> @@ -87,8 +87,7 @@ static void dsa_master_get_strings(struct net_device *d=
ev, uint32_t stringset,
>   	struct dsa_switch *ds =3D cpu_dp->ds;
>   	int port =3D cpu_dp->index;
>   	int len =3D ETH_GSTRING_LEN;
> -	int mcount =3D 0, count;
> -	unsigned int i;
> +	int mcount =3D 0, count, i;

This looks fine but why the return value checking for the negative will=20
not be good here ?
 =C2=A0count =3D ds->ops->get_sset_count(ds, port, stringset);


Cheers,
Mukesh


>   	uint8_t pfx[4];
>   	uint8_t *ndata;
>  =20
