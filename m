From: Shannon Nelson <snelson@pensando.io>
Date: Sun, 26 Jan 2020 18:36:00 +0000
Subject: Re: [PATCH] ionic: Fix rx queue allocation in 'ionic_lif_alloc()'
Message-Id: <0a90fbcb-430e-d059-cd1c-7960e7ec6806@pensando.io>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200126102540.14812-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200126102540.14812-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, drivers@pensando.io, jakub.kicinski@netronome.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 1/26/20 2:25 AM, Christophe JAILLET wrote:
> The 'struct ionic' has a 'nrxqs_per_lif' field. So use it instead of
> using two times the value of 'ntxqs_per_lif'.
>
> Note that with the current implementation, this patch is a no-op because
> both fields are set to the same value in 'ionic_lifs_size()' which
> is called before reaching 'ionic_lif_alloc()'.
>
> However, it is more future-proof.
>
> Fixes: 1a58e196467f ("ionic: Add basic lif support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Another alternative could be to use 'alloc_etherdev_mq()' if really using
> the same value for both fields is what is expected.
> ---
>   drivers/net/ethernet/pensando/ionic/ionic_lif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/ne=
t/ethernet/pensando/ionic/ionic_lif.c
> index 60fd14df49d7..96d3b3e993ad 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> @@ -1663,7 +1663,7 @@ static struct ionic_lif *ionic_lif_alloc(struct ion=
ic *ionic, unsigned int index
>   	int err;
>  =20
>   	netdev =3D alloc_etherdev_mqs(sizeof(*lif),
> -				    ionic->ntxqs_per_lif, ionic->ntxqs_per_lif);
> +				    ionic->ntxqs_per_lif, ionic->nrxqs_per_lif);
>   	if (!netdev) {
>   		dev_err(dev, "Cannot allocate netdev, aborting\n");
>   		return ERR_PTR(-ENOMEM);

NAK

Even though the NIC configuration seems to allow for different values,=20
the rest of the driver assumes that the values are equal and things will=20
likely break if they aren't.=C2=A0 This is why the ethtool service=20
ionic_set_channels() only allows the user to change the Combined value,=20
and not the individual rx or tx values.

If you really want to tweak this, a better change might be to use the=20
min of ntxqs and nrxqs, and maybe add a warning log message that they=20
are configured with different values.

sln
