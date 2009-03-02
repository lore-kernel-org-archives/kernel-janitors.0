From: Steven Whitehouse <swhiteho@redhat.com>
Date: Mon, 02 Mar 2009 12:01:22 +0000
Subject: Re: [PATCH 1/2] GFS2: fix sparse warnings: constant is so big it
Message-Id: <1235995282.9571.822.camel@quoit>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221011033.5075.95929.stgit@vmbox.hanneseder.net>
	 <20090221011125.5075.23703.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221011125.5075.23703.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Sorry for the delay - I'm back from holiday now and I've applied this
patch to the -nmw git tree. Thanks,

Steve.

On Sat, 2009-02-21 at 02:11 +0100, Hannes Eder wrote:
> Fix this sparse warnings:
>   fs/gfs2/rgrp.c:156:23: warning: constant 0xffffffffffffffff is so big it is unsigned long long
>   fs/gfs2/rgrp.c:157:23: warning: constant 0xaaaaaaaaaaaaaaaa is so big it is unsigned long long
>   fs/gfs2/rgrp.c:158:23: warning: constant 0x5555555555555555 is so big it is long long
>   fs/gfs2/rgrp.c:194:20: warning: constant 0x5555555555555555 is so big it is long long
>   fs/gfs2/rgrp.c:204:44: warning: constant 0x5555555555555555 is so big it is long long
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
>  fs/gfs2/rgrp.c |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index c0abe69..34691d7 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -153,10 +153,10 @@ static inline u64 gfs2_bit_search(const __le64 *ptr, u64 mask, u8 state)
>  {
>  	u64 tmp;
>  	static const u64 search[] = {
> -		[0] = 0xffffffffffffffff,
> -		[1] = 0xaaaaaaaaaaaaaaaa,
> -		[2] = 0x5555555555555555,
> -		[3] = 0x0000000000000000,
> +		[0] = 0xffffffffffffffffULL,
> +		[1] = 0xaaaaaaaaaaaaaaaaULL,
> +		[2] = 0x5555555555555555ULL,
> +		[3] = 0x0000000000000000ULL,
>  	};
>  	tmp = le64_to_cpu(*ptr) ^ search[state];
>  	tmp &= (tmp >> 1);
> @@ -191,7 +191,7 @@ u32 gfs2_bitfit(const u8 *buf, const unsigned int len, u32 goal, u8 state)
>  	const __le64 *ptr = ((__le64 *)buf) + (goal >> 5);
>  	const __le64 *end = (__le64 *)(buf + ALIGN(len, sizeof(u64)));
>  	u64 tmp;
> -	u64 mask = 0x5555555555555555;
> +	u64 mask = 0x5555555555555555ULL;
>  	u32 bit;
>  
>  	BUG_ON(state > 3);
> @@ -201,7 +201,7 @@ u32 gfs2_bitfit(const u8 *buf, const unsigned int len, u32 goal, u8 state)
>  	tmp = gfs2_bit_search(ptr, mask, state);
>  	ptr++;
>  	while(tmp = 0 && ptr < end) {
> -		tmp = gfs2_bit_search(ptr, 0x5555555555555555, state);
> +		tmp = gfs2_bit_search(ptr, 0x5555555555555555ULL, state);
>  		ptr++;
>  	}
>  	/* Mask off any bits which are more than len bytes from the start */
> 

