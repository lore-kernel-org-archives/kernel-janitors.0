From: Alan Stern <stern@rowland.harvard.edu>
Date: Sat, 06 Nov 2010 18:47:02 +0000
Subject: Re: [PATCH] usb: core: fix information leak to userland
Message-Id: <Pine.LNX.4.44L0.1011061441150.28403-100000@netrider.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <502882.59497.qm@web180306.mail.gq1.yahoo.com>
References: <1289054488-18233-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1289054488-18233-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: David Brownell <david-b@pacbell.net>
Cc: Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Oliver Neukum <oliver@neukum.org>, Andi Kleen <ak@linux.intel.com>, Chris Frey <cdfrey@foursquare.net>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 6 Nov 2010, David Brownell wrote:

> --- On Sat, 11/6/10, Alan Stern <stern@rowland.harvard.edu> wrote:
>=20
> > Are you sure that adding an initializer
> > like this will zero out the=20
> > padding bytes?=A0 It might be safer just to call
> > memset.
>=20
> ISTR the C standard says things get initted to
> zero in this case too ... and that compilers will
> as a rule use memset to do it.  One could look
> at the generated code to make sure of that.

Unfortunately I don't have a copy of the C standard here to consult. =20
However...  Although I'm perfectly willing to believe that the standard
requires fields in a structure to be initialized to 0 if they
aren't mentioned explicitly in the initializer, I'm considerably more
doubtful that it also requires padding to be initialized!

And I certainly wouldn't want to depend on compilers _always_ using=20
memset to do this initialization.

> There's certainly a fair amount of code I've seen
> that uses runtime initializers like that, to zero
> memory.  I can't believe i's _all_ broken!  ;)

Zeroing memory that belongs to a declared field is different from=20
zeroing padding bytes.  Maybe what you remember seeing is the first and=20
not the second.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
