From: "Milind Choudhary" <milindchoudhary@gmail.com>
Date: Fri, 09 Feb 2007 17:45:58 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <3b44d3fb0702090933n3f4600eeo73cea780772379b4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/8/07, walter harms <wharms@bfs.de> wrote:
>
>
> > There are different variants of BIT using (long|unsigned
> > long|unsigned|unsigned char) etc.
> > Do we need to create different macros for each type
> > Or a single one which takes type as input?
>
> bit operations make only sense on integer, so why not stay with long
> and cast it down if needed ? so you have only one function doing so.

Michael Veeck  had submitted a patch for the same before
http://lists.osdl.org/pipermail/kernel-janitors/2005-August/004737.html

there was some discussion on the list,which did not reach any
conclusion I guess.
so we have
#define BIT(x) (1UL << (x) )
#define BIT(x) (1UL << ((x) % BITS_PER_LONG))
#define BIT(x) (1ULL << (__builtin_constant_p(x) ? (x) : (x) % 64)

 can any one please throw some light on ...
Milind A Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
