From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 18 May 2015 09:27:41 +0000
Subject: Re: mfd: Support 88pm80x in 80x driver
Message-Id: <20150518092741.GP22418@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150514103124.GA21248@mwanda>
In-Reply-To: <20150514103124.GA21248@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, 15 May 2015, Dan Carpenter wrote:

> On Fri, May 15, 2015 at 09:06:55AM +0800, Qiao Zhou wrote:
> > >>@@ -360,8 +366,14 @@ static inline int pm80x_dev_resume(struct device=
 *dev)
> > >>  	struct pm80x_chip *chip =3D dev_get_drvdata(pdev->dev.parent);
> > >>  	int irq =3D platform_get_irq(pdev, 0);
> > >>
> > >>+	if ((irq < 0) || (irq >=3D 24)) {
> > >>+		dev_err(dev, "pm80x: wrong irq 0x%x\n", irq);
> > >>+
> > >
> > >Superfluous '\n'.
> > Will refine it.
>=20
> The \n is ok isn't it?

It's not a blocker, but it is superfluous:

  git grep -A2 dev_err

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
