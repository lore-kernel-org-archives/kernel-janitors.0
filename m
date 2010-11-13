From: Andreas Dilger <adilger.kernel@dilger.ca>
Date: Sat, 13 Nov 2010 21:38:19 +0000
Subject: Re: [PATCH] fs: select: fix information leak to userspace
Message-Id: <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421483-23907-1-git-send-email-segooon@gmail.com> <20101112120834.33062900.akpm@linux-foundation.org>
In-Reply-To: <20101112120834.33062900.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

On 2010-11-12, at 13:08, Andrew Morton wrote:
> On Wed, 10 Nov 2010 23:38:02 +0300
> Vasiliy Kulikov <segooon@gmail.com> wrote:
>> On some architectures __kernel_suseconds_t is int.
> 
> On sparc and parisc.  On all other architectures this patch is a waste
> of cycles.
> 
> --- a/fs/select.c~fs-select-fix-information-leak-to-userspace-fix
> +++ a/fs/select.c
> @@ -306,7 +306,8 @@ static int poll_select_copy_remaining(st
> 		rts.tv_sec = rts.tv_nsec = 0;
> 
> 	if (timeval) {
> -		memset(&rtv, 0, sizeof(rtv));
> +		if (sizeof(rtv) > sizeof(rtv.tv_sec) + sizeof(rtv.tv_usec))
> +			memset(&rtv, 0, sizeof(rtv));
> 		rtv.tv_sec = rts.tv_sec;
> 		rtv.tv_usec = rts.tv_nsec / NSEC_PER_USEC;
> 
> _
> 
> 
> The `if' gets eliminated at compile time.  With this approach we add
> four bytes of text to the sparc64 build and zero bytes of text to the
> x86_64 build.

It's nice to have comments (or at least a good commit message) for unusual code like this, so that in the future it is clear when this kind of workaround can be removed (e.g. if the time_t is changed to always be a 64-bit value for Y2038 issues, even on 32-bit arches). 

Cheers, Andreas





