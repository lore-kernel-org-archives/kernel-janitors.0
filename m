From: Joe Perches <joe@perches.com>
Date: Sat, 02 Feb 2013 19:43:31 +0000
Subject: Re: Question about printking
Message-Id: <1359834211.2831.5.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+XX27u4rmpe8RHiy5DsbHvoYP9DWQts+rTRfEvPQG4s8Q@mail.gmail.com>
	 <CALF0-+V-8m1TwnM0MUbNCncnECF_r_FVcyu_Duu0tqcsPoFR5A@mail.gmail.com>
In-Reply-To: <CALF0-+V-8m1TwnM0MUbNCncnECF_r_FVcyu_Duu0tqcsPoFR5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ezequiel Garcia <elezegarcia@gmail.com>
Cc: gregkh <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, kernelnewbies <kernelnewbies@kernelnewbies.org>, kernel-janitors@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, devel@driverdev.osuosl.org

On Sat, 2013-02-02 at 16:30 -0300, Ezequiel Garcia wrote:
> ptr = kmalloc(sizeof(foo));
> if (!ptr) {
>         pr_err("Cannot allocate memory for foo\n");
>         return -ENOMEM;
> }
> His argue against it was that kmalloc already takes care of reporting/printking
> a good deal of interesting information when this happens.

> Can someone expand a bit on this whole idea? (of abuse of printing,
> or futility of printing).

k.alloc() takes a GFP_ flag as an arg.

One of those GFP flags is __GFP_NOWARN.

For all failed allocs without GFP_NOWARN
a message is emitted and a dump_stack is
done.

(see: mm/page_alloc.c warn_alloc_failed())

So, most all of these printks after
k.alloc()'s are not necessary.


