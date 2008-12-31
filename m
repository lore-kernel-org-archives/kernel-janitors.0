From: David Brownell <david-b@pacbell.net>
Date: Wed, 31 Dec 2008 01:40:26 +0000
Subject: Re: [PATCH] include/linux: Move definitions from usb.h to usb/ch9.h
Message-Id: <200812301740.26432.david-b@pacbell.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812292247300.2265@ask.diku.dk> <20081230233727.GA12819@gamba.jf.intel.com>
In-Reply-To: <20081230233727.GA12819@gamba.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Sarah Sharp <sarah.a.sharp@intel.com>
Cc: Julia Lawall <julia@diku.dk>, gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tuesday 30 December 2008, Sarah Sharp wrote:
> I thought the include/linux/usb/ch9.h was supposed to include values that=
 are
> defined in various USB specifications (starting with the protocol "chapte=
r 9"
> from the USB 1.1 bus specification).

And not getting too far from "chapter 9" ... there are
a few things from the "common class spec", and constants
defining classes, but they're needed to interpret a lot
of descriptors.


> The constants (masks) used by these=20
> functions aren't part of the standards,

They are too!  Bitfields and the values in those bitfields
are part of the endpoint descriptor definitions.

In protocol specs, data format definitions don't usually
define symbolic accessors for fields, or for individual
message structures.  Those are part of a programming
language/environment binding.

This distinction is a Good Thing ... names used in assembly
might use Hungarian Notation to make up for the complete
lack of type checking; names in C would normally leave
type checking to the compiler; names in LISP would use
embedded "-" instead of embedded "_" or embedded "$" for
separators; and so on.  No single set of names can work
everywhere; and even if it could, it would fight against
coding conventions in many organizations.


> so why move these functions to=20
> include/linux/usb/ch9.h? =A0Was it confusing to find these functions, or =
do you
> have an overall plan for these changes?

You missed earlier mail on the topic.  The basic issue is
that those symbols can (and should!) be used for peripheral
side support as well as host side support ... which means
they should never have been put into a host-only header.

- Dave

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
