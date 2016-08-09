From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 09 Aug 2016 09:30:22 +0000
Subject: Re: [PATCH v4] mfd: dm355evm_msp: Refactoring for add_child()
Message-Id: <20160809093022.GU5243@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4dcb4cab-e2cc-87c0-9cfc-d140f185254b@users.sourceforge.net>
 <20160805075511.GN5243@dell>
 <0a2ef320-a95a-2611-2554-a2a83838fb9b@users.sourceforge.net>
In-Reply-To: <0a2ef320-a95a-2611-2554-a2a83838fb9b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, 08 Aug 2016, SF Markus Elfring wrote:

> >> v4: Further feedback was integrated into this message.
> >=20
> > This is not a good change-log.  What actually changed?
>=20
> Which kind of information would you find more useful in this case?

That's for you to tell me surely?

If I wanted to know what changed, I would normally look at the patch
change-log.  But the change-log in this patch says "I did some
stuff".  What stuff did you change?  Which review comments did you
tend to?
>=20
> >> @@ -222,19 +222,20 @@ static struct device *add_child(struct i2c_clien=
t *client, const char *name,
> >>  		status =3D platform_device_add_resources(pdev, &r, 1);
> >>  		if (status < 0) {
> >>  			dev_dbg(&pdev->dev, "can't add irq\n");
> >> -			goto err;
> >> +			goto put_device;
> >>  		}
> >>  	}
> >> =20
> >>  	status =3D platform_device_add(pdev);
> >> +	if (status)
> >> +		goto put_device;
> >> =20
> >> -err:
> >> -	if (status < 0) {
> >> -		platform_device_put(pdev);
> >> -		dev_err(&client->dev, "can't add %s dev\n", name);
> >> -		return ERR_PTR(status);
> >> -	}
> >>  	return &pdev->dev;
> >> +
> >> +put_device:
> >> +	platform_device_put(pdev);
> >> +	dev_err(&client->dev, "failed to add device %s\n", name);
> >=20
> > ... and remove this line.
>=20
> -Do you really want that this error message should be deleted?
>=20
> How does this response fit to your request to introduce such a message
> for the function "add_numbered_child" (on 2016-06-08)?
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1162299.html
> https://lkml.org/lkml/2016/6/8/467

You've lost the context.  The "..." is meant to intimate that it
follows on from a previous comment.  In this case:

>  > status =3D platform_device_add_data(pdev, pdata, pdata_len);
>  > if (status < 0) {
>  > 	dev_dbg(&pdev->dev, "can't add platform_data\n");
>
>  Please take the opportunity to convert these to dev_err()s.

So, convert the specific dev_dbg() calls to dev_err() and remove the
contentless one at the bottom.

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
