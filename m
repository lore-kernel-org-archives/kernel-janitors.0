From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 21 Jul 2016 15:37:52 +0000
Subject: Re: staging: ks7010: Rename jump labels
Message-Id: <8ef974f3-b4ce-ed2a-0697-b6c8c0c35fd8@users.sourceforge.net>
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
In-Reply-To: <20160720231044.4b4f2864@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Jean Delvare <jdelvare@suse.de>
Cc: Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> That being said... checkpatch does not complain about leading space
> before labels. Not even with --strict. So why are you mentioning it here?

I remembered a warning like "INDENTED_LABEL" instead.
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/script=
s/checkpatch.pl?id=92d21ac74a9e3c09b0b01c764e530657e4c85c49#n4326


How do you generally think about jump label renaming?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
