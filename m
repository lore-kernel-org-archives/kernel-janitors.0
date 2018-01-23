From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 23 Jan 2018 13:01:30 +0000
Subject: Re: [PATCH] mfd/viperboard: Delete an error message for a failed memory allocation in vprbrd_probe()
Message-Id: <20180123130130.powyttapsx3djawx@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c50fe6a-21cc-e49d-1b10-5d2457ed4e2a@users.sourceforge.net>
 <20180123125851.ysypf7375sjlgsc6@dell>
In-Reply-To: <20180123125851.ysypf7375sjlgsc6@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Lars =?iso-8859-1?Q?P=F6schel?= <poeschel@lemonage.de>, Samuel Ortiz <sameo@linux.intel.com>

On Tue, 23 Jan 2018, Lee Jones wrote:

> On Tue, 16 Jan 2018, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
>=20
> Markus,
>=20
> Can you please fix-up all of the patches I've NACKed and collect them
> up with all the other MFD patches you currently have on the list and
> send them as a single set please?
>=20
> Reviewing them one after another, is taking a lot of time and causing
> my a great deal of pain.
>=20
> I am marking all of your other MFD submissions as 'read and reviewed'
> and will not be processing any more until the are all contained in a
> single, threaded set.
>=20
> Thank you!

Also, could you change the subject lines, so they match that expected
by the subsystem.  You can check what that is by doing:

  `git log --oneline -- <subsystem>`

In MFD case it's:

  "mfd: <driver>: <Succinct headline starting with a capital letter>"

--=20
Lee Jones
Linaro Services Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
