From: Tariq Toukan <tariqt@mellanox.com>
Date: Thu, 10 May 2018 15:03:36 +0000
Subject: Re: [PATCH] net/mlx4_en: Fix an error handling path in 'mlx4_en_init_netdev()'
Message-Id: <49d89081-95d8-e7ae-2903-372a201ff92c@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510070226.19575-1-christophe.jaillet@wanadoo.fr>
 <20180510133808.GA10943@lap1> <20180510141836.2qlm676j4675buti@mwanda>
 <f29e851d-c4d7-cd04-dbb7-582adebc2854@mellanox.com>
In-Reply-To: <f29e851d-c4d7-cd04-dbb7-582adebc2854@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Yuval Shaia <yuval.shaia@oracle.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, davem@davemloft.net, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 10/05/2018 5:36 PM, Tariq Toukan wrote:
>=20
>=20
> On 10/05/2018 5:18 PM, Dan Carpenter wrote:
>> On Thu, May 10, 2018 at 04:38:08PM +0300, Yuval Shaia wrote:
>>> On Thu, May 10, 2018 at 09:02:26AM +0200, Christophe JAILLET wrote:
>>>> If an error occurs, 'mlx4_en_destroy_netdev()' is called.
>>>> It then calls 'mlx4_en_free_resources()' which does the needed=20
>>>> resources
>>>> cleanup.
>>>>
>>>> So, doing some explicit kfree in the error handling path would lead to
>>>> some double kfree.
>>>
>>> Patch make sense but what's bothering me is that mlx4_en_free_resources
>>> loops on the entire array, assuming !priv->tx_ring[t] means entry is
>>> allocated but the existing code does not assume that, see [1]. So i=20
>>> looked
>>> to see where tx_ring array is zeroed and didn't find it.
>>>
>>> Am i missing something here.
>>>
>>
>> It's zeroed twice.=C2=A0 alloc_etherdev_mqs() allocates zeroed memory and
>> then we do a memset(priv, 0, sizeof(struct mlx4_en_priv));
>>
>> regards,
>> dan carpenter
>>
>=20
> We do zero (twice) on init, that's right. But I think Yuval's comment is =

> valid in case of the driver went into configuration change, or down/up,=20
> that reallocates the rings. I'm double checking this.

Well, the flows in which we need to nullify the tx_rings pointer (if=20
any, I still need to investigate this) is not related to this init function.

Here we're safe.

Anyway, a V2 is already submitted, please use it for your next comments.=20
I think patch is OK.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
