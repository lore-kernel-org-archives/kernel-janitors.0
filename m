From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Jun 2011 13:45:46 +0000
Subject: Re: [PATCH 2/2] mfd/ab8500: Use kstrtoul_from_user
Message-Id: <BANLkTikKRVP4PW48YtR+mMMNsaxTDxoGtw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1307393012-32582-1-git-send-email-peterhuewe@gmx.de>
	<1307393012-32582-2-git-send-email-peterhuewe@gmx.de>
In-Reply-To: <1307393012-32582-2-git-send-email-peterhuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

NAK
You should use kstrtou8_from_user() and drop 0xff check as well.

Do NOT blindly replace strict_strtoul with kstrtoul.

On Mon, Jun 6, 2011 at 11:43 PM, Peter Huewe <peterhuewe@gmx.de> wrote:
> - =A0 =A0 =A0 err =3D strict_strtoul(buf, 0, &user_val);
> + =A0 =A0 =A0 err =3D kstrtoul_from_user(user_buf, count, 0, &user_val);
> =A0 =A0 =A0 =A0if (err)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return err;
> +
> =A0 =A0 =A0 =A0if (user_val > 0xff) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "debugfs error input > 0xff\n=
");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
