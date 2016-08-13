From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Aug 2016 21:15:22 +0000
Subject: Re: staging: ks7010: Replace three printk() calls by pr_err()
Message-Id: <2afc5de9-cd4d-7175-1807-a8acc2fc2006@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
 <1471e8af-129d-8a7a-c7d9-1e1fbe0237ec@users.sourceforge.net>
 <1471031030.18251.18.camel@perches.com>
 <a6b96b51-a602-f22d-b853-0ee2f142fb67@users.sourceforge.net>
 <1471109478.3467.33.camel@perches.com>
 <3837d167-b920-d36f-3b75-f37d4b92031d@users.sourceforge.net>
 <1471118088.3467.55.camel@perches.com>
 <68dcf04d-ade3-b67a-144d-33bd5ebd0049@users.sourceforge.net>
 <20160813202109.GA28286@kroah.com>
In-Reply-To: <20160813202109.GA28286@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, devel@driverdev.osuosl.org, Wolfram Sang <wsa@the-dreams.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Jean Delvare <jdelvare@suse.de>

> Really now, this is basic fixes and cleanups,

I agree to this view to some degree.


> you have been asked many times in the past to move on beyond these,

It is more useful when more severe bugs or bigger software improvements can=
 be found.
Which source code clean-ups are picked better up by other contributors?


> as you often times seem to end up wasting lots of people's times
> as they attempt to help you.

It can take a bit more time occasionally to achieve the desired consensus.


> Personally, I'm long past wishing to help you out here, sorry.

Other contributors will eventually continue the clarification of remaining
open issues in the source file "ks7010_sdio.c".


> I'll take "correct" patches, but that's it.  No discussion of them, no
> arguing over theoreticals, and no telling you what I might, or might
> not, want to see done in the future, sorry.

I became aware about software development possibilities which can also
matter here.
Yesterday Julia Lawall informed me about a presentation on the topic
"Refactor strings =E2=80=93 make everyone happy" by Wolfram Sang on 2016-07=
-14.

Is such a software evolution also interesting and acceptable for you?


> And really, your patch quality stinks, I strongly suggest getting a lot
> more experience with C first before doing more kernel work please.

Can you accept any specific update steps while other software changes
will evolve after a bit of discussion as usual?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
