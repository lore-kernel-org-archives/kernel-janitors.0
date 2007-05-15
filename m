From: "Alexey Dobriyan" <adobriyan@gmail.com>
Date: Tue, 15 May 2007 08:32:10 +0000
Subject: Re: [KJ] centralizing all of the types.h content?
Message-Id: <b6fcc0a0705150132o7d6a0aech2768599854b98bcb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705150403510.19177@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705150403510.19177@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/15/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>   is there any reason that most of the content of the various
> include/asm-*/types.h files couldn't be centralized, perhaps in
> include/linux/types.h?

Yes! Lots of ifdefs, because files aren't quite identical.

>   certainly, a lot of that content looks absolutely identical across
> all architectures.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
