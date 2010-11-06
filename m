From: David Brownell <david-b@pacbell.net>
Date: Sat, 06 Nov 2010 18:30:40 +0000
Subject: Re: [PATCH] usb: core: fix information leak to userland
Message-Id: <502882.59497.qm@web180306.mail.gq1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1011061419490.28403-100000@netrider.rowland.org>
References: <1289054488-18233-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1289054488-18233-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Vasiliy Kulikov <segooon@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Oliver Neukum <oliver@neukum.org>, Andi Kleen <ak@linux.intel.com>, Chris Frey <cdfrey@foursquare.net>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org



--- On Sat, 11/6/10, Alan Stern <stern@rowland.harvard.edu> wrote:

> Are you sure that adding an initializer
> like this will zero out the=20
> padding bytes?=A0 It might be safer just to call
> memset.

ISTR the C standard says things get initted to
zero in this case too ... and that compilers will
as a rule use memset to do it.  One could look
at the generated code to make sure of that.

There's certainly a fair amount of code I've seen
that uses runtime initializers like that, to zero
memory.  I can't believe i's _all_ broken!  ;)

- Dave


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
