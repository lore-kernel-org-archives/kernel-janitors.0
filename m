From: Joe Perches <joe@perches.com>
Date: Fri, 12 Aug 2016 19:43:50 +0000
Subject: Re: [PATCH v2 08/10] staging: ks7010: Replace three printk() calls by pr_err()
Message-Id: <1471031030.18251.18.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
	 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
	 <530A086E.8010901@users.sourceforge.net>
	 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
	 <530A72AA.3000601@users.sourceforge.net>
	 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
	 <530B5FB6.6010207@users.sourceforge.net>
	 <alpine.DEB.2.10.1402241710370.2074@hadrien>
	 <530C5E18.1020800@users.sourceforge.net>
	 <alpine.DEB.2.10.1402251014170.2080@hadrien>
	 <530CD2C4.4050903@users.sourceforge.net>
	 <alpine.DEB.2.10.1402251840450.7035@hadrien>
	 <530CF8FF.8080600@users.sourceforge.net>
	 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	 <530DD06F.4090703@users.sourceforge.net>
	 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	 <5317A59D.4@users.sourceforge.net>
	 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
	 <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
	 <1471e8af-129d-8a7a-c7d9-1e1fbe0237ec@users.sourceforge.net>
In-Reply-To: <1471e8af-129d-8a7a-c7d9-1e1fbe0237ec@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Jean Delvare <jdelvare@suse.de>

On Thu, 2016-08-11 at 07:48 +0200, SF Markus Elfring wrote:
> Prefer usage of the macro "pr_err" over the interface "printk".
Not correct

> diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks701=
0/ks7010_sdio.c
[]
> @@ -998,11 +998,11 @@ static int ks7010_sdio_probe(struct sdio_func *func,
> =A0	/* private memory allocate */
> =A0	netdev =3D alloc_etherdev(sizeof(*priv));
> =A0	if (netdev =3D NULL) {
> -		printk(KERN_ERR "ks7010 : Unable to alloc new net device\n");
> +		pr_err(pr_fmt("Unable to alloc new net device\n"));

All of these pr_fmt uses are redundant as pr_err already does pr_fmt
alloc_etherdev already does a dump_stack so the OOM isn't useful.

> =A0		goto release_irq;
> =A0	}
> =A0	if (dev_alloc_name(netdev, "wlan%d") < 0) {
> -		printk(KERN_ERR "ks7010 :=A0=A0Couldn't get name!\n");
> +		pr_err(pr_fmt("Couldn't get name!\n"));
> =A0		goto free_dev;
> =A0	}
> =A0
> @@ -1042,8 +1042,7 @@ static int ks7010_sdio_probe(struct sdio_func *func,
> =A0	/* Upload firmware */
> =A0	ret =3D ks7010_upload_firmware(priv, card);	/* firmware load */
> =A0	if (ret) {
> -		printk(KERN_ERR
> -		=A0=A0=A0=A0=A0=A0=A0"ks7010: firmware load failed !! retern code =3D =
%d\n",
> +		pr_err(pr_fmt("firmware load failed! return code =3D %d\n"),
> =A0		=A0=A0=A0=A0=A0=A0=A0ret);
> =A0		goto free_buf;
> =A0	}
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
