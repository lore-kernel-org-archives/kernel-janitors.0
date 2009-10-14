From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Wed, 14 Oct 2009 16:10:32 +0000
Subject: Re: [PATCH] leds-ss4200: Check pci_enable_device return
Message-Id: <390803460910140910i17a3bd96ufbdf4e3257ba2bf9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1255493810.28264.6.camel@laptop>
In-Reply-To: <1255493810.28264.6.camel@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

>
> Thanks for the patch.  By the way, what tree is this against, or did you
> just see my patch on a mailing list?
>

It is against yesterday linux-next tree.

>
> Unfortunately, this patch has some issues.  It's a bit nasty to do real
> work inside of if() conditions, especially when you already have a nice,
> local variable to store the condition for you.
>
> Your patch is also buggy because the out: label tries to disable the
> device and clean up the 'struct device'.  Neither of those things has
> been done if the pci_enable_device() fails in the first place.  It will
> probably oops.
>

I see.

> I'll cc you on what I think is the correct patch.
>
> -- Dave
>
>

Thank you very much and sorry for the noise
