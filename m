From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 18:16:16 +0000
Subject: Re: Input-evdev: Use kmalloc_array() in evdev_handle_get_val()
Message-Id: <56e70dc1-e36c-3492-d481-cef1e8262393@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <92cc52f5-c5e1-cafe-76f2-04e4ed997735@users.sourceforge.net>
 <2a1f52e8-a502-1d4b-d9c9-e806cc6f246e@users.sourceforge.net>
 <CAKdAkRSXeeGdiSERdifAMwV45SsE2r56z6NcoSjVzqcZWRphAg@mail.gmail.com>
In-Reply-To: <CAKdAkRSXeeGdiSERdifAMwV45SsE2r56z6NcoSjVzqcZWRphAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> So we have to multiply twice now, once in kmalloc_array, the second
> time in memcpy().

It looks so in the source code after the suggested refactoring.


> No, thank you.

Would you like to check any further if a specific compiler implementation
will still optimise common subexpressions as you desired it?


> Also, please note that we do not really treat the allocated "mem" as an array,
> but rather area of memory that holds all bits that we need to transfer,
> and so I consider using kmalloc_array() actually wrong here.

Thanks for your explanation.


> Please do not blindly follow checkpatch and coccinelle suggestions.
> They are just that: suggestions and not hared rules.

I am curious on how to clarify corresponding deviations further.


Would you like to suggest any other details so that the evolving scripts
can become better and safer for static source code analysis?

Do you know any special properties which should be additionally checked
at call sites which are similar to the discussed place?

Regards,
Markus
