From: David Brownell <david-b@pacbell.net>
Date: Sat, 06 Nov 2010 19:07:57 +0000
Subject: Re: [PATCH] usb: core: fix information leak to userland
Message-Id: <305211.72066.qm@web180314.mail.gq1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1011061441150.28403-100000@netrider.rowland.org>
References: <1289054488-18233-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1289054488-18233-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Oliver Neukum <oliver@neukum.org>, Andi Kleen <ak@linux.intel.com>, Chris Frey <cdfrey@foursquare.net>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org



--- On Sat, 11/6/10, Alan Stern <stern@rowland.harvard.edu> wrote:


> >=20
>=20
> Unfortunately I don't have a copy of the C standard here to
> consult.=A0=20
> However...=A0 Although I'm perfectly willing to believe
> that the standard
> requires fields in a structure to be initialized to 0 if
> they
> aren't mentioned explicitly in the initializer, I'm
> considerably more
> doubtful that it also requires padding to be initialized!

ISTR initialization-to-zero is the standard
behavior defined for all _memory_ that gets
initialized ... not just named fields ...
whether the init is "static", "bss", or not.
>=20
> And I certainly wouldn't want to depend on compilers
> _always_ using=20
> memset to do this initialization.

Of course not; just rely on init-to-zero, and
let the compiler worry about efficiency. In
some cases memset(); in others, the result
might be as if memset were inlined, so only
a few "write a zero at this address" type
instructions would be needed.
>=20
> > There's certainly a fair amount of code I've seen
> > that uses runtime initializers like that, to zero
> > memory.=A0 I can't believe i's _all_ broken!=A0
> ;)
>=20
> Zeroing memory that belongs to a declared field is
> different from=20
> zeroing padding bytes.=A0 Maybe what you remember seeing
> is the first and=20
> not the second.

I remember seeing both, and at one point looking
at the issue to verify that padding was treated
uniformly (like other memory).  Also, writing code
that relied on zero-initted padding.

- Dave

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
