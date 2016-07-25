From: Jean Delvare <jdelvare@suse.de>
Date: Mon, 25 Jul 2016 12:32:04 +0000
Subject: Re: staging: ks7010: Rename jump labels
Message-Id: <20160725143204.366c8502@endymion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
	<530CD2C4.4050903@users.sourceforge.net>
	<alpine.DEB.2.10.1402251840450.7035@hadrien>
	<530CF8FF.8080600@users.sourceforge.net>
	<alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	<530DD06F.4090703@users.sourceforge.net>
	<alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
	<5f019748-0e67-6077-5abc-381725410b66@users.sourceforge.net>
	<20160720155216.GD1688@katana>
	<ca946880-bb63-b0a3-c9c8-e8233ce9656c@users.sourceforge.net>
	<20160720231044.4b4f2864@endymion>
	<trinity-e74f2332-c8f0-4a38-a217-42ff1ac97e89-1469087754940@3capp-webde-bap54>
In-Reply-To: <trinity-e74f2332-c8f0-4a38-a217-42ff1ac97e89-1469087754940@3capp-webde-bap54>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Wolfram Sang <wsa@the-dreams.de>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@lip6.fr>

Hi Markus,

On Thu, 21 Jul 2016 09:55:55 +0200, SF Markus Elfring wrote:
> > > How do you think about information from the chapter "7: Centralized e=
xiting of functions"?
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/CodingStyle?idGef4ad2684d380dd6d596140fb79395115c3950#n389
> >=20
> > I'm not impressed by this piece of documentation.
>=20
> I would also appreciate further improvements there.
>=20
>=20
> > Back to the lack of space before labels, it's at best a personal prefer=
ence.
> > If you insist on standardizing, I'd call it a bug in the documentation,
> > which should be fixed. One space before label is the way to go.
>=20
> Would you like to contribute another patch for such a coding style issue?

I just sent a patch out, let's see what people think about it.

> > That being said... checkpatch does not complain about leading space
> > before labels. Not even with --strict. So why are you mentioning it her=
e?
>=20
> How do you think about a similar software update?
>=20
> staging: lustre: Fix a jump label position in osc_get_info()
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?i=
d=C71d264543f759fea147734cb63de36397817534
> https://lkml.org/lkml/2015/12/21/401

Intending labels with a tab is wrong, so fixing it is welcome. I'd turn
the tab into a space instead, for reasons explained before, but no
indentation at all is still better than a tab.

--=20
Jean Delvare
SUSE L3 Support
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
