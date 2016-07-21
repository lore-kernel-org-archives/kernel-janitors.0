From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 21 Jul 2016 20:11:53 +0000
Subject: Re: staging: ks7010: Rename jump labels
Message-Id: <8f15564a-86c7-0c46-8fe6-1f823d4bdf4f@users.sourceforge.net>
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
 <8ef974f3-b4ce-ed2a-0697-b6c8c0c35fd8@users.sourceforge.net>
 <20160721211342.6711a272@endymion>
In-Reply-To: <20160721211342.6711a272@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Jean Delvare <jdelvare@suse.de>
Cc: Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/scr=
ipts/checkpatch.pl?id=92d21ac74a9e3c09b0b01c764e530657e4c85c49#n4326
>=20
> "#goto labels aren't indented, allow a single space however"
>=20
> Can't be clearer :-)

Should such information from a comment in this script be also
explicitly mentioned in the document "CodingStyle" anyhow?

How should the support for indentation of jump labels with
a single space be expressed in all relevant Linux development documentation?


>> How do you generally think about jump label renaming?
>=20
> Renaming from "out0:", "out1:" etc to something meaningful, yes.

I suggest to take another look at such identifiers.

Would you like to support the renaming of a label like "error_out1"
(in the function "ks7010_upload_firmware" for example)?


> Did you have anything else in mind?

Not really for this update suggestion.

Will the software evolution be continued also with information from the top=
ic
"Source code review around jump label usage"?
https://lkml.org/lkml/2015/12/11/378
http://article.gmane.org/gmane.linux.kernel/2106190

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
