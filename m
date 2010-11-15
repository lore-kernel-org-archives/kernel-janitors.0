From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 15 Nov 2010 19:12:21 +0000
Subject: Re: [PATCH v2] fs: select: fix information leak to userspace
Message-Id: <1289848341.2607.125.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421483-23907-1-git-send-email-segooon@gmail.com>
	 <20101112120834.33062900.akpm@linux-foundation.org>
	 <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca>
	 <20101114092533.GB5323@albatros>
	 <20101114180643.593d19ac.akpm@linux-foundation.org>
In-Reply-To: <20101114180643.593d19ac.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vasiliy Kulikov <segoon@openwall.com>, Andreas Dilger <adilger.kernel@dilger.ca>, kernel-janitors@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>

Le dimanche 14 novembre 2010 à 18:06 -0800, Andrew Morton a écrit : 
> On Sun, 14 Nov 2010 12:25:33 +0300 Vasiliy Kulikov <segoon@openwall.com> wrote:
> >  
> >  	if (timeval) {
> > -		rtv.tv_sec = rts.tv_sec;
> > -		rtv.tv_usec = rts.tv_nsec / NSEC_PER_USEC;
> > +		struct timeval rtv = {
> > +			.tv_sec = rts.tv_sec,
> > +			.tv_usec = rts.tv_nsec / NSEC_PER_USEC
> > +		};
> >  
> >  		if (!copy_to_user(p, &rtv, sizeof(rtv)))
> >  			return ret;
> 
> Please check the assembly code - this will still leave four bytes of
> uninitalised stack data in 'rtv', surely.

Thats a good question.

In my understanding, gcc should initialize all holes (and other not
mentioned fields) with 0, even for automatic storage [C99 only mandates
this on static storage]

I tested on x86_64 and this is the case, but could not find a definitive
answer in gcc documentation.

This kind of construct is widely used in networking tree.

Maybe we should ask to gcc experts if this behavior is guaranteed by
gcc, or if we must review our code ;(

CC Jakub

Thanks !


