From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 26 Oct 2015 09:52:51 +0000
Subject: Re: mailbox: Add generic mechanism for testing Mailbox Controllers
Message-Id: <20151026095251.GF597@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151021202610.GA31470@mwanda>
In-Reply-To: <20151021202610.GA31470@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, 21 Oct 2015, Dan Carpenter wrote:

> Hello Lee Jones,
>=20
> The patch 8ea4484d0c2b: "mailbox: Add generic mechanism for testing
> Mailbox Controllers" from Oct 16, 2015, leads to the following static
> checker warning:
>=20
> 	drivers/mailbox/mailbox-test.c:71 mbox_test_signal_write()
> 	warn: copy_to/from_user() returns a positive value
>=20
> drivers/mailbox/mailbox-test.c
>     42  static ssize_t mbox_test_signal_write(struct file *filp,
>     43                                         const char __user *userbuf,
>     44                                         size_t count, loff_t *ppos)
>     45  {
>     46          struct mbox_test_device *tdev =3D filp->private_data;
>     47          int ret;
>     48 =20
>     49          if (!tdev->tx_channel) {
>     50                  dev_err(tdev->dev, "Channel cannot do Tx\n");
>     51                  return -EINVAL;
>     52          }
>     53 =20
>     54          if (count > MBOX_MAX_SIG_LEN) {
>     55                  dev_err(tdev->dev,
>     56                          "Signal length %zd greater than max allow=
ed %d\n",
>     57                          count, MBOX_MAX_SIG_LEN);
>     58                  return -EINVAL;
>     59          }
>     60 =20
>     61          tdev->signal =3D kzalloc(MBOX_MAX_SIG_LEN, GFP_KERNEL);
>     62          if (!tdev->signal)
>     63                  return -ENOMEM;
>=20
>=20
> This feels racy.  Also if ->signal has already been allocated then this
> leaks.
>=20
>     64 =20
>     65          ret =3D copy_from_user(tdev->signal, userbuf, count);
>     66          if (ret) {
>     67                  kfree(tdev->signal);
>     68                  return -EFAULT;
>     69          }
>=20
> Normally we do it like this:
>=20
> 	if (copy_from_user(tdev->signal, userbuf, count)) {
> 		kfree(tdev->signal);
> 		tdev->signal;  <-- also let's set it to NULL or it leads
> 				   to a use after free.
> 		return -EFAULT;
> 	}
>=20
>=20
>=20
>     70 =20
>     71          return ret < 0 ? ret : count;
>=20
> "ret" is always zero here.  But we can just get rid of that variable
> completely.

Thanks.

Will follow-up with patches.

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
