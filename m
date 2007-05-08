From: "Satyam Sharma" <satyam.sharma@gmail.com>
Date: Tue, 08 May 2007 17:13:52 +0000
Subject: [KJ] Re: [KJ PATCH] Replacing memset(<addr>, 0,
Message-Id: <a781481a0705081013q7b54906dsdf28d922e198a463@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178621444.3598.15.camel@shani-win>
	 <46405AB6.6040901@msgid.tls.msk.ru>
	 <84144f020705080521k6d75d9f8m33e25585735e4f7e@mail.gmail.com>
In-Reply-To: <84144f020705080521k6d75d9f8m33e25585735e4f7e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Shani Moideen <shani.moideen@wipro.com>, ebiederm@xmission.com, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On 5/8/07, Pekka Enberg <penberg@cs.helsinki.fi> wrote:
> Shani Moideen wrote:
> > >                 ptr = kmap(page);
> > > -               memset(ptr, 0, PAGE_SIZE);
> > > +               clear_page(ptr);
>
> On 5/8/07, Michael Tokarev <mjt@tls.msk.ru> wrote:
> > I wonder if it's worth to invent kzmap() or something like that... ;)
>
> I am counting 59 kmap + memset pairs in the kernel, so perhaps it is
> worth it to reduce kernel text size.

Stuff of the sort already exists. Look for clear_highpage(),
clear_user_highpage() and memclear_highpage_flush (recently renamed to
zero_user_page, see -mm). But they all use kmap_atomic() -- kmap()
variants would have to be added. Also, they're all inlines, so I'm not
sure you'd be able to cut down text size, but still getting rid of
open-coding is always good.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
