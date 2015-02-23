From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Mon, 23 Feb 2015 20:38:20 +0000
Subject: Re: [PATCH] [RFC] drivers/staging/fbtft: fix sparse warnings
Message-Id: <CANZNk80NTqE_DYQxf3EMk5e34vqnyQJyF4MnDOxSm4Mqz2Qw8Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1424468049-24525-1-git-send-email-andrey.krieger.utkin@gmail.com>
	<20150221185824.GE5206@mwanda>
	<CANZNk82SkziecUNCShZu-cjqTHqKCF5UumMazJtNp2upt8qZJg@mail.gmail.com>
	<20150223183544.GB5064@mwanda>
	<54EB7F35.6040605@tronnes.org>
In-Reply-To: <54EB7F35.6040605@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-1?Q?Noralf_Tr=F8nnes?= <noralf@tronnes.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, OSUOSL Drivers <devel@driverdev.osuosl.org>, kernel-mentors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2015-02-23 21:27 GMT+02:00 Noralf Tr=F8nnes <noralf@tronnes.org>:
> Yes, it's best to leave this alone for now.
> I'm working on a proposal to provide better layering and minimal coupling
> to fbdev. This will hopefully lead to screen_base eventually being used
> only twice in the fbtft module and nowhere else.

Ok, staying away and looking for sparse warnings for other staging drivers.
Thanks to all for comments.

--=20
Andrey Utkin
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
