From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Fri, 02 Jan 2009 02:01:48 +0000
Subject: Re: [PATCH] include/linux: Move definitions from usb.h to usb/ch9.h
Message-Id: <20090102020121.GA9411@gamba.jf.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812292247300.2265@ask.diku.dk> <20081230233727.GA12819@gamba.jf.intel.com> <200812301740.26432.david-b@pacbell.net>
In-Reply-To: <200812301740.26432.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: David Brownell <david-b@pacbell.net>
Cc: Julia Lawall <julia@diku.dk>, gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 30, 2008 at 05:40:26PM -0800, David Brownell wrote:
> On Tuesday 30 December 2008, Sarah Sharp wrote:
> > so why move these functions to=20
> > include/linux/usb/ch9.h? =A0Was it confusing to find these functions, o=
r do you
> > have an overall plan for these changes?
>=20
> You missed earlier mail on the topic.  The basic issue is
> that those symbols can (and should!) be used for peripheral
> side support as well as host side support ... which means
> they should never have been put into a host-only header.

Ah, I see.  Thanks for the explanation. :)

Sarah
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
