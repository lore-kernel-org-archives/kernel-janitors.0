From: Eric Sandeen <sandeen@sandeen.net>
Date: Wed, 02 Jun 2010 03:34:29 +0000
Subject: Re: [xfs-masters] [PATCH 11/17] fs/xfs/quota: Add missing mutex_unlock
Message-Id: <4C05D145.6080602@sandeen.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261757050.23743@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005261757050.23743@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: xfs-masters@oss.sgi.com, xfs@oss.sgi.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <aelder@sgi.com>

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Add a mutex_unlock missing on the error path.  The use of this lock is
> balanced elsewhere in the file.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression E1;
> @@
> 
> * mutex_lock(E1,...);
>   <+... when != E1
>   if (...) {
>     ... when != E1
> *   return ...;
>   }
>   ...+>
> * mutex_unlock(E1,...);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
> The use of ENOMEM rather than -ENOMEM is also a bit odd.

All the xfs core code uses positive errors, it's an irix holdover.

As things bubble up to the vfs interface, signs get switched.

Yeah, it's a bit odd, but nobody dares change it ;)

Maybe semantic patching could fix it ;)

-Eric

