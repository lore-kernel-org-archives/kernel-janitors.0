From: Greg KH <greg@kroah.com>
Date: Sun, 03 May 2015 19:44:03 +0000
Subject: Re: [PATCH] staging/lustre: Always try kmalloc first for OBD_ALLOC_LARGE
Message-Id: <20150503194403.GA24491@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430625501-1069-1-git-send-email-green@linuxhacker.ru>
In-Reply-To: <1430625501-1069-1-git-send-email-green@linuxhacker.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, May 03, 2015 at 03:14:58PM -0400, Oleg Drokin wrote:
> Hello!
> 
> On May 3, 2015, at 2:31 PM, Greg KH wrote:
> 
> >> -/* Allocations above this size are considered too big and could not be done
> >> - * atomically.
> >> - *
> >> - * Be very careful when changing this value, especially when decreasing it,
> >> - * since vmalloc in Linux doesn't perform well on multi-cores system, calling
> >> - * vmalloc in critical path would hurt performance badly. See LU-66.
> >> - */
> >> -#define OBD_ALLOC_BIG (4 * PAGE_CACHE_SIZE)
> >> -
> >> #define OBD_ALLOC_LARGE(ptr, size)					    \
> >> do {									  \
> >> -	if (size > OBD_ALLOC_BIG)					     \
> >> -		OBD_VMALLOC(ptr, size);				       \
> >> -	else								  \
> >> -		OBD_ALLOC(ptr, size);					 \
> >> +	ptr = libcfs_kvzalloc(size, GFP_NOFS);				  \
> >> } while (0)
> > 
> > Just fix up all callers of these functions, if there are any anymore.
> 
> This is what Julia is doing. I am providing the stub for her wonderful scripts to unwrap per her request.
> 
> >> + */
> >> +/*
> >> + * Copyright (c) 2015, Oleg Drokin <green@linuxhacker.ru>
> > 
> > I think your employer would like a different line here...
> 
> Only on stuff that I do at work when I am getting paid.
> 
> Stuff that I do on my own uncompensated, I own all the rights to, I hope.

I wouldn't be so sure about this, please read your employment contract,
almost no companies allow this, it is very rare.

thanks,

greg k-h
