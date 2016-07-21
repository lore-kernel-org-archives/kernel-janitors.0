From: "SF Markus Elfring" <elfring@users.sourceforge.net>
Date: Thu, 21 Jul 2016 07:55:55 +0000
Subject: Re: staging: ks7010: Rename jump labels
Message-Id: <trinity-e74f2332-c8f0-4a38-a217-42ff1ac97e89-1469087754940@3capp-webde-bap54>
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
 <ca946880-bb63-b0a3-c9c8-e8233ce9656c@users.sourceforge.net>,
 <20160720231044.4b4f2864@endymion>
In-Reply-To: <20160720231044.4b4f2864@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jean Delvare <jdelvare@suse.de>
Cc: Wolfram Sang <wsa@the-dreams.de>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@lip6.fr>

> > How do you think about information from the chapter "7: Centralized exi=
ting of functions"?
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/CodingStyle?idGef4ad2684d380dd6d596140fb79395115c3950#n389
>=20
> I'm not impressed by this piece of documentation.

I would also appreciate further improvements there.


> Back to the lack of space before labels, it's at best a personal preferen=
ce.
> If you insist on standardizing, I'd call it a bug in the documentation,
> which should be fixed. One space before label is the way to go.

Would you like to contribute another patch for such a coding style issue?


> That being said... checkpatch does not complain about leading space
> before labels. Not even with --strict. So why are you mentioning it here?

How do you think about a similar software update?

staging: lustre: Fix a jump label position in osc_get_info()
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=
=C71d264543f759fea147734cb63de36397817534
https://lkml.org/lkml/2015/12/21/401


> Just looking at the thread on lkml makes me feel dizzy.

I understand your concern to some degree.


> When you are about to send that amount of messages,
> you should pause and think again.

This happened already.


> Is it really worth it?

I came to such a conclusion for the shown source code clean-up.
Some software developers can also support it.


> I think I'd be less annoyed by regular spam.

It can be harder occasionally to become familiar and comfortable with
the suggested change pattern.
Could you accept other details from my update suggestion?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
