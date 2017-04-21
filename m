From: Jens Axboe <axboe@fb.com>
Date: Fri, 21 Apr 2017 19:39:54 +0000
Subject: Re: [PATCH] mtip32xx: Uninitialized variable in mtip_no_dev_cleanup()
Message-Id: <0bb97411-d1bd-5c6c-69d0-a7bceb69efa7@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421193717.u2cxdq2jyithqqxi@mwanda>
In-Reply-To: <20170421193717.u2cxdq2jyithqqxi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Christoph Hellwig <hch@lst.de>
Cc: Johannes Thumshirn <jthumshirn@suse.de>, Hannes Reinecke <hare@suse.com>, Bart Van Assche <Bart.VanAssche@sandisk.com>, Sachin Shukla <sachin.s5@samsung.com>, Pan Bian <bianpan2016@163.com>, Ming Lei <tom.leiming@gmail.com>, Eric Biggers <ebiggers@google.com>, Mike Christie <mchristi@redhat.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 04/21/2017 01:37 PM, Dan Carpenter wrote:
> We set "cmd->state =3D -ENODEV;" but "cmd" hasn't been initialized yet.
> It's weird that GCC doesn't catch this.

That is weird...

> diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/m=
tip32xx.c
> index 66a6bd83faae..bd4bf70a5bcd 100644
> --- a/drivers/block/mtip32xx/mtip32xx.c
> +++ b/drivers/block/mtip32xx/mtip32xx.c
> @@ -4105,14 +4105,12 @@ static int mtip_block_initialize(struct driver_da=
ta *dd)
>  static void mtip_no_dev_cleanup(struct request *rq, void *data, bool res=
erv)
>  {
>  	struct driver_data *dd =3D (struct driver_data *)data;
> -	struct mtip_cmd *cmd;
> +	struct mtip_cmd *cmd =3D mtip_cmd_from_tag(dd, MTIP_TAG_INTERNAL);
> =20
>  	if (likely(!reserv)) {
>  		cmd->status =3D -ENODEV;
>  		blk_mq_complete_request(rq);
>  	} else if (test_bit(MTIP_PF_IC_ACTIVE_BIT, &dd->port->flags)) {
> -
> -		cmd =3D mtip_cmd_from_tag(dd, MTIP_TAG_INTERNAL);
>  		if (cmd->comp_func)
>  			cmd->comp_func(dd->port, MTIP_TAG_INTERNAL,
>  					cmd, -ENODEV);

This is wrong, you can't use the internal tag bit for both cases. A proper
fix was already merged earlier today:

http://git.kernel.dk/cgit/linux-block/commit/?h=3Dfor-4.12/block&id=95c55ff=
425faa190fd8ba55090fbdf33d8b2f0ae

--=20
Jens Axboe

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
