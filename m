From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Wed, 01 Nov 2006 22:32:10 +0000
Subject: Re: [KJ] atomic variables and "volatility"
Message-Id: <9a8748490611011432y54eeb026q2311015950e71792@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0611011355080.5454@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0611011355080.5454@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 01/11/06, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   since i'm getting the impression that the LKML is not the right
> place for discussions like this, i'm going to move it to the KJ list.
>
>   i'm curious about possible redundancy or confusing code in the
> numerous atomic.h header files that define atomic variables for each
> architecture.  the first issue is that there are two different
> typedefs for an "atomic_t" depending on the architecture -- one of:
>
>         typedef struct { int counter; } atomic_t;
>         typedef struct { volatile int counter; } atomic_t;
>                          ^^^^^^^^
>

There was a long thread recently on LKML about volatile - it's
interresting, I suggest you read it. Especially this post by Linus is
worth reading : http://lkml.org/lkml/2006/7/6/159

Reading the entire thread should give you a clearer picture.  :-)

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
