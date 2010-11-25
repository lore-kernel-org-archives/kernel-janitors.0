From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Thu, 25 Nov 2010 09:34:03 +0000
Subject: Re: [PATCH] virt: kvm: coding style cleanups
Message-Id: <AANLkTi=gQw7+tVnEgYmn0r6XdbEEr0jsYEvmYcxYikSQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290644937.6078.9.camel@javier-laptop>
In-Reply-To: <1290644937.6078.9.camel@javier-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

>> +                     kzalloc(sizeof(struct msix_entry) *entry_nr->entry_nr,
>
> The original code was right and the new code is wrong.
>

Sorry for not looking at the code closely.

>
> You're wasting people's time here and we like newbies but it makes
> everyone annoyed.
>
> regards,
> dan carpenter
>

The Linux kernel learning curve is getting bigger and bigger, the only
way we (newbies) can enter the development process is trough trivial
patches. So yes we are annoying although necessary.

Sorry for the noise it won't happen again.

Thanks a lot.

-- 
Best regards,

-----------------------------------------
Javier Martínez Canillas
(+34) 682 39 81 69
