From: Chris Mason <clm@fb.com>
Date: Mon, 19 Jan 2015 19:41:14 +0000
Subject: Re: [patch -next] eventfd: type bug in eventfd_poll()
Message-Id: <1421696474.27917.3@mail.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150119193319.GA32634@mwanda>
In-Reply-To: <20150119193319.GA32634@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Mon, Jan 19, 2015 at 2:33 PM, Dan Carpenter 
<dan.carpenter@oracle.com> wrote:
> Since "count" is an unsigned int, then these conditions are never 
> true:
> 
>         if (count = ULLONG_MAX)
>                 events |= POLLERR;
>         if (ULLONG_MAX - 1 > count)
>                 events |= POLLOUT;
> 
> It should be a u64, because that's what ctx->count is.  Also GCC
> complains that "flags" is unused.

Ugh, thanks Dan, I copied the unsigned int out of eventfd_file_create 
instead of checking the struct.  I'll test v3.

-chris



