From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Sep 2016 17:54:15 +0000
Subject: Re: [PATCH 1/2] Input-evdev: Use kmalloc_array() in evdev_handle_get_val()
Message-Id: <CAKdAkRSXeeGdiSERdifAMwV45SsE2r56z6NcoSjVzqcZWRphAg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <92cc52f5-c5e1-cafe-76f2-04e4ed997735@users.sourceforge.net>
 <2a1f52e8-a502-1d4b-d9c9-e806cc6f246e@users.sourceforge.net>
In-Reply-To: <2a1f52e8-a502-1d4b-d9c9-e806cc6f246e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sat, Sep 24, 2016 at 4:08 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 24 Sep 2016 12:42:45 +0200
>
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus use the corresponding function "kmalloc_array".
>
>   This issue was detected by using the Coccinelle software.
>
> * Replace the specification of a data type by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
>
> * Delete the local variable "len" which became unnecessary with
>   this refactoring.

So we have to multiply twice now, once in kmalloc_array, the second
time in memcpy(). No, thank you.

Also, please note that we do not really treat the allocated "mem" as
an array, but rather area of memory that holds all bits that we need
to transfer, and so I consider using kmalloc_array() actually wrong
here.

Please do not blindly follow checkpatch and coccinelle suggestions.
They are just that: suggestions and not hared rules.

Thanks.

-- 
Dmitry
