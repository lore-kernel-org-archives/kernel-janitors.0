From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 07 Aug 2017 07:16:59 +0000
Subject: Re: [PATCH] i2c: imx: Remove a useless test in 'i2c_imx_init_recovery_info()'
Message-Id: <alpine.DEB.2.20.1708070916300.2061@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-747096559-1502090219=:2061"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170806234953.30682-1-christophe.jaillet@wanadoo.fr> <20170807063617.5wr4i7b7k72uyrit@pengutronix.de>
In-Reply-To: <20170807063617.5wr4i7b7k72uyrit@pengutronix.de>
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, wsa@the-dreams.de, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

--8323329-747096559-1502090219=:2061
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



On Mon, 7 Aug 2017, Uwe Kleine-K=F6nig wrote:

> On Mon, Aug 07, 2017 at 01:49:53AM +0200, Christophe JAILLET wrote:
> > 'devm_pinctrl_get()' never returns NULL, so this test can be simplified.
>
> That's wrong. If CONFIG_PINCTRL is disabled devm_pinctrl_get returns
> NULL. But I think this shouldn't be considered an error, so your change
> is right, just the commit log is not.
>
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index 54a47b40546f..7e84662fe1c0 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -997,7 +997,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2=
c_struct *i2c_imx,
> >  	struct i2c_bus_recovery_info *rinfo =3D &i2c_imx->rinfo;
> >
> >  	i2c_imx->pinctrl =3D devm_pinctrl_get(&pdev->dev);
> > -	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
> > +	if (IS_ERR(i2c_imx->pinctrl)) {
> >  		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\=
n");
> >  		return PTR_ERR(i2c_imx->pinctrl);
> >  	}
>
> Side note: I'm not sure, this construct is valid. IIRC PTR_ERR should
> only be called for values x where IS_ERR(x) is true. Here it is at least
> surprising that an message hints to a problem but the return code is 0.
>
> @Julia: I'm sure coccinelle can find more of those?!

I only found a few.  Christophe, if you want to fix tem up, please go
ahead.

julia

diff -u -p /var/linuxes/linux-next/drivers/net/ethernet/intel/e100.c
/tmp/nothing/drivers/net/ethernet/intel/e100.c
--- /var/linuxes/linux-next/drivers/net/ethernet/intel/e100.c
+++ /tmp/nothing/drivers/net/ethernet/intel/e100.c
@@ -1370,8 +1370,6 @@ static inline int e100_load_ucode_wait(s

        fw =3D e100_request_firmware(nic);
        /* If it's NULL, then no ucode is required */
-       if (!fw || IS_ERR(fw))
-               return PTR_ERR(fw);

        if ((err =3D e100_exec_cb(nic, (void *)fw, e100_setup_ucode)))
                netif_err(nic, probe, nic->netdev,
diff -u -p /var/linuxes/linux-next/drivers/i2c/busses/i2c-imx.c
/tmp/nothing/drivers/i2c/busses/i2c-imx.c
--- /var/linuxes/linux-next/drivers/i2c/busses/i2c-imx.c
+++ /tmp/nothing/drivers/i2c/busses/i2c-imx.c
@@ -997,9 +997,7 @@ static int i2c_imx_init_recovery_info(st
        struct i2c_bus_recovery_info *rinfo =3D &i2c_imx->rinfo;

        i2c_imx->pinctrl =3D devm_pinctrl_get(&pdev->dev);
-       if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
                dev_info(&pdev->dev, "can't get pinctrl, bus recovery not
supported\n");
-               return PTR_ERR(i2c_imx->pinctrl);
        }

        i2c_imx->pinctrl_pins_default =3D
pinctrl_lookup_state(i2c_imx->pinctrl,
diff -u -p /var/linuxes/linux-next/drivers/crypto/chelsio/chcr_algo.c
/tmp/nothing/drivers/crypto/chelsio/chcr_algo.c
--- /var/linuxes/linux-next/drivers/crypto/chelsio/chcr_algo.c
+++ /tmp/nothing/drivers/crypto/chelsio/chcr_algo.c
@@ -3159,8 +3159,6 @@ static int chcr_aead_op(struct aead_requ
        skb =3D create_wr_fn(req, u_ctx->lldi.rxq_ids[ctx->rx_qidx], size,
                           op_type);

-       if (IS_ERR(skb) || !skb)
-               return PTR_ERR(skb);

        skb->dev =3D u_ctx->lldi.ports[0];
        set_wr_txq(skb, CPL_PRIORITY_DATA, ctx->tx_qidx);
diff -u -p /var/linuxes/linux-next/fs/ocfs2/acl.c
/tmp/nothing/fs/ocfs2/acl.c
--- /var/linuxes/linux-next/fs/ocfs2/acl.c
+++ /tmp/nothing/fs/ocfs2/acl.c
@@ -331,8 +331,6 @@ int ocfs2_acl_chmod(struct inode *inode,
                return 0;

        acl =3D ocfs2_get_acl_nolock(inode, ACL_TYPE_ACCESS, bh);
-       if (IS_ERR(acl) || !acl)
-               return PTR_ERR(acl);
        ret =3D __posix_acl_chmod(&acl, GFP_KERNEL, inode->i_mode);
        if (ret)
                return ret;





>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--8323329-747096559-1502090219=:2061--
