From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 19:04:40 +0000
Subject: Re: Input-evdev: Use kmalloc_array() in evdev_handle_get_val()
Message-Id: <616d6d8d-a5ac-a6ec-d61b-e14224f60ed1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <92cc52f5-c5e1-cafe-76f2-04e4ed997735@users.sourceforge.net>
 <2a1f52e8-a502-1d4b-d9c9-e806cc6f246e@users.sourceforge.net>
 <CAKdAkRSXeeGdiSERdifAMwV45SsE2r56z6NcoSjVzqcZWRphAg@mail.gmail.com>
 <56e70dc1-e36c-3492-d481-cef1e8262393@users.sourceforge.net>
 <20160924183455.GD40187@dtor-ws>
In-Reply-To: <20160924183455.GD40187@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> Again, what is the purpose of the changes?

I came also along a few source code places where their maintainers
requested the usage of a function like "kmalloc_array".

How do you think about to clarify the consistent use of programming
interfaces for Linux a bit more?


> Are you working on the code

I am trying to improve various free software (including Linux).


> and the fact that the driver is older-style hinders your progress?

Not for me directly.


> Or there are runtime improvements from your changes?

It depends on some factors.

Can an array memory allocator organise the desired data in a safer
and more efficient way than a "default approach"?


> Correctness issues?

This can be.

Do you care for source code annotations?


> I do not very much appreciate changes just to satisfy checkpatch rule
> du jour.

Do these rules contain knowledge which you give a significant value?

Regards,
Markus
