From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 01 Oct 2015 15:23:19 +0000
Subject: Re: [patch] mfd: 64 bit bug in bxtwc_val_store()
Message-Id: <20151001152319.GE3214@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150928095636.GB11367@mwanda>
In-Reply-To: <20150928095636.GB11367@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thu, 01 Oct 2015, Dan Carpenter wrote:
> On Thu, Oct 01, 2015 at 06:13:31PM +0300, Dan Carpenter wrote:
> > I looked at the subjects to every other patch to that file and I
> > followed the same pattern.
>=20
> This is literally a part of my kpatch.sh script:
>=20
> git log --oneline $fullname | head -n 10
> echo "Copy and paste one of these subjects?"
> read unused

Okay, this is good.  Unfortunately I guess process over-ruled common
sense on this occasion (meant more of a joke than offensively). ;)

When new drivers are sent, the patch format is more likely to be:

  mfd: "Adding new driver for ..."

As there is no <device> to mention.  However, as yours is an add-on
patch which makes changes to an existing driver, a better subject
line would have been:

  mfd: <device>: "I'm doing this"

... but I completely understand the confusion.  Not much to change
then, keep doing what you're doing.

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
