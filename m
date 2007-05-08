From: "Pekka Enberg" <penberg@cs.helsinki.fi>
Date: Tue, 08 May 2007 12:21:55 +0000
Subject: [KJ] Re: [KJ PATCH] Replacing memset(<addr>, 0,
Message-Id: <84144f020705080521k6d75d9f8m33e25585735e4f7e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178621444.3598.15.camel@shani-win>
	 <46405AB6.6040901@msgid.tls.msk.ru>
In-Reply-To: <46405AB6.6040901@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Shani Moideen <shani.moideen@wipro.com>, ebiederm@xmission.com, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Shani Moideen wrote:
> >                 ptr = kmap(page);
> > -               memset(ptr, 0, PAGE_SIZE);
> > +               clear_page(ptr);

On 5/8/07, Michael Tokarev <mjt@tls.msk.ru> wrote:
> I wonder if it's worth to invent kzmap() or something like that... ;)

I am counting 59 kmap + memset pairs in the kernel, so perhaps it is
worth it to reduce kernel text size.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
