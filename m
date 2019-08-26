From: Stefan Roese <sr@denx.de>
Date: Mon, 26 Aug 2019 07:27:08 +0000
Subject: Re: [PATCH v2 -next] net: mediatek: remove set but not used variable 'status'
Message-Id: <ce9fd217-f838-1e04-eacd-7fe9f07dc745@denx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190824.142158.1506174328495468705.davem@davemloft.net>
 <20190826013118.22720-1-maowenan@huawei.com>
 <20190826071048.Horde.gwS9nzceYYiYGJLnJ6-x2hz@www.vdorst.com>
In-Reply-To: <20190826071048.Horde.gwS9nzceYYiYGJLnJ6-x2hz@www.vdorst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Mao Wenan <maowenan@huawei.com>
Cc: nbd@openwrt.org, nelson.chang@mediatek.com, netdev@vger.kernel.org, sean.wang@mediatek.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org

Hi!

On 26.08.19 09:10, Ren=C3=A9 van Dorst wrote:
> Let's add Stefan to the conversation.
> He is the author of this commit.

Thanks Rene.
 =20
> Quoting Mao Wenan <maowenan@huawei.com>:
>=20
>> Fixes gcc '-Wunused-but-set-variable' warning:
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function mtk_handle_irq:
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1951:6: warning:
>> variable status set but not used [-Wunused-but-set-variable]
>>
>> Fixes: 296c9120752b ("net: ethernet: mediatek: Add MT7628/88 SoC support=
")
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>> ---
>>   v2: change format of 'Fixes' tag.
>>   drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> index 8ddbb8d..bb7d623 100644
>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> @@ -1948,9 +1948,7 @@ static irqreturn_t mtk_handle_irq_tx(int irq,
>> void *_eth)
>>   static irqreturn_t mtk_handle_irq(int irq, void *_eth)
>>   {
>>   	struct mtk_eth *eth =3D _eth;
>> -	u32 status;
>>
>> -	status =3D mtk_r32(eth, MTK_PDMA_INT_STATUS);
>=20
> Hi Stefan,
>=20
> You added an extra MTK_PDMA_INT_STATUS read in mtk_handle_irq()
> Is that read necessary to work properly?

No, its not needed. This read must have "slipped in" from some earlier
patch versions and I forgot to remove it later. Thanks for catching it.

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
