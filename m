From: Antti Palosaari <crope@iki.fi>
Date: Fri, 05 Oct 2012 16:06:16 +0000
Subject: Re: [samsung:v4l_for_mauro 14/73] drivers/media/dvb-frontends/cxd2820r_core.c:691:10: warning: unuse
Message-Id: <506F0578.2000907@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121005010806.GB6635@localhost>
In-Reply-To: <20121005010806.GB6635@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,
Thank you for the report. If you wish to fix it then reply soon. 
Otherwise, lets say after 6 hours from that, I will do it myself and add 
you as a reporter!

regards
Antti

On 10/05/2012 04:08 AM, Fengguang Wu wrote:
> Hi Antti,
>
> FYI, there are new compile warnings show up in
>
> tree:   git://git.infradead.org/users/kmpark/linux-samsung v4l_for_mauro
> head:   7f06319c3a6e99fcdf9774556384c62661a31940
> commit: a36a66d7aaa6468a91941ffcfb6d324f28825910 [14/73] [media] cxd2820r: use static GPIO config when GPIOLIB is undefined
> config: i386-randconfig-b124 (attached as .config)
>
> All warnings:
>
> drivers/media/dvb-frontends/cxd2820r_core.c: In function 'cxd2820r_attach':
> drivers/media/dvb-frontends/cxd2820r_core.c:691:10: warning: unused variable 'gpio' [-Wunused-variable]
>
> vim +691 drivers/media/dvb-frontends/cxd2820r_core.c
>
> 14c03862 drivers/media/dvb/frontends/cxd2820r_core.c (Manu Abraham    2011-11-24  685) struct dvb_frontend *cxd2820r_attach(const struct cxd2820r_config *cfg,
> 1e8f31f3 drivers/media/dvb-frontends/cxd2820r_core.c (Antti Palosaari 2012-07-19  686) 		struct i2c_adapter *i2c, int *gpio_chip_base
> 1e8f31f3 drivers/media/dvb-frontends/cxd2820r_core.c (Antti Palosaari 2012-07-19  687) )
> 14c03862 drivers/media/dvb/frontends/cxd2820r_core.c (Manu Abraham    2011-11-24  688) {
> 1e8f31f3 drivers/media/dvb-frontends/cxd2820r_core.c (Antti Palosaari 2012-07-19  689) 	struct cxd2820r_priv *priv;
> 14c03862 drivers/media/dvb/frontends/cxd2820r_core.c (Manu Abraham    2011-11-24  690) 	int ret;
> a36a66d7 drivers/media/dvb-frontends/cxd2820r_core.c (Antti Palosaari 2012-08-16 @691) 	u8 tmp, gpio[GPIO_COUNT];
> 14c03862 drivers/media/dvb/frontends/cxd2820r_core.c (Manu Abraham    2011-11-24  692)
> a36a66d7 drivers/media/dvb-frontends/cxd2820r_core.c (Antti Palosaari 2012-08-16  693) 	priv = kzalloc(sizeof(struct cxd2820r_priv), GFP_KERNEL);
> 1e8f31f3 drivers/media/dvb-frontends/cxd2820r_core.c (Antti Palosaari 2012-07-19  694) 	if (!priv) {
> 1e8f31f3 drivers/media/dvb-frontends/cxd2820r_core.c (Antti Palosaari 2012-07-19  695) 		ret = -ENOMEM;
> 1e8f31f3 drivers/media/dvb-frontends/cxd2820r_core.c (Antti Palosaari 2012-07-19  696) 		dev_err(&i2c->dev, "%s: kzalloc() failed\n",
> 1e8f31f3 drivers/media/dvb-frontends/cxd2820r_core.c (Antti Palosaari 2012-07-19  697) 				KBUILD_MODNAME);
> 14c03862 drivers/media/dvb/frontends/cxd2820r_core.c (Manu Abraham    2011-11-24  698) 		goto error;
> 1e8f31f3 drivers/media/dvb-frontends/cxd2820r_core.c (Antti Palosaari 2012-07-19  699) 	}
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
>


-- 
http://palosaari.fi/
