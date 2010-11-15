From: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 15 Nov 2010 02:05:05 +0000
Subject: Re: [PATCH] fs: select: fix information leak to userspace
Message-Id: <20101114180505.674c7da0.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421483-23907-1-git-send-email-segooon@gmail.com>
	<20101112120834.33062900.akpm@linux-foundation.org>
	<8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca>
In-Reply-To: <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger.kernel@dilger.ca>
Cc: Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 13 Nov 2010 14:38:19 -0700 Andreas Dilger <adilger.kernel@dilger.ca> wrote:

> On 2010-11-12, at 13:08, Andrew Morton wrote:
> > On Wed, 10 Nov 2010 23:38:02 +0300
> > Vasiliy Kulikov <segooon@gmail.com> wrote:
> >> On some architectures __kernel_suseconds_t is int.
> > 
> > On sparc and parisc.  On all other architectures this patch is a waste
> > of cycles.
> > 
> > --- a/fs/select.c~fs-select-fix-information-leak-to-userspace-fix
> > +++ a/fs/select.c
> > @@ -306,7 +306,8 @@ static int poll_select_copy_remaining(st
> > 		rts.tv_sec = rts.tv_nsec = 0;
> > 
> > 	if (timeval) {
> > -		memset(&rtv, 0, sizeof(rtv));
> > +		if (sizeof(rtv) > sizeof(rtv.tv_sec) + sizeof(rtv.tv_usec))
> > +			memset(&rtv, 0, sizeof(rtv));
> > 		rtv.tv_sec = rts.tv_sec;
> > 		rtv.tv_usec = rts.tv_nsec / NSEC_PER_USEC;
> > 
> > _
> > 
> > 
> > The `if' gets eliminated at compile time.  With this approach we add
> > four bytes of text to the sparc64 build and zero bytes of text to the
> > x86_64 build.
> 
> It's nice to have comments (or at least a good commit message) for unusual code like this, so that in the future it is clear when this kind of workaround can be removed (e.g. if the time_t is changed to always be a 64-bit value for Y2038 issues, even on 32-bit arches). 
> 

Well, I'm the resident comment fanatic, but I thought this was all
sufficiently obvious to not need one.  But I'll add one ;)
