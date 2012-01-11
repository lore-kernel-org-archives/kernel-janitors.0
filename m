From: Szymon Janc <szymon@janc.net.pl>
Date: Wed, 11 Jan 2012 17:47:50 +0000
Subject: Re: [PATCH 12/16] Staging: quickstart: Use list.h API for buttons list
Message-Id: <201201111847.50660.szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326147815-11451-13-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326147815-11451-13-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

> > +	list_for_each_entry(b, &buttons, list) {
> > +		count += snprintf(buf + count, PAGE_SIZE - count, "%d\t%s\n",
> > +							b->id, b->name);
> > +
> > +		if (count = PAGE_SIZE)
> 
> snprintf() returns the number of bytes which would have been used if
> there were space so this test should be >= instead of =.
> 
> > +			break;
> > 
> >  	}

Yes, I'll fix that. 

Thx

-- 
Szymon K. Janc
szymon@janc.net.pl

