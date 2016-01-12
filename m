From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 12 Jan 2016 12:03:54 +0000
Subject: Re: mfd: smsc-ece1099: Fine-tuning for smsc_i2c_probe()
Message-Id: <20160112120354.GF27358@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682957F.5000604@users.sourceforge.net>
 <20160111080850.GR3331@x1>
 <5694C0AF.2070809@users.sourceforge.net>
 <20160112091221.GU19803@x1>
 <5694DD6C.7050405@users.sourceforge.net>
 <20160112111407.GC27358@x1>
 <5694E6B2.4070604@users.sourceforge.net>
In-Reply-To: <5694E6B2.4070604@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tue, 12 Jan 2016, SF Markus Elfring wrote:

> >> Do you request that I should resend my four update suggestions
> >> for different components as a single patch series for the software
> >> area "drivers/mfd"?
> >=20
> > You have to make that decision yourself.
>=20
> I chose on 2015-12-29 to send them in the combination you see.

That was not a good choice.

> > What I'm saying is, if the cover letter says there are 2 patches
>=20
> These refer to the component "smsc-ece1099".

That's fine.  Then there should have been 2 patches in the set.  But
then to attach 2 unrelated patches to the set is not fine.  They
should have either been submitted as part of the set i.e. 0/4 or
completely separately.

> > in the set, that's what we should expect.
>=20
> Can changes for the components "dm355evm_msp" and "twl-core"
> be clarified independently?

Yes, or together would have also been fine.  The only think that is
not okay is to submit a set of 2 patches, then to "bolt-on" another
2 for some reason.

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
