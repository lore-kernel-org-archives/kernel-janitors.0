From: Steven Whitehouse <swhiteho@redhat.com>
Date: Mon, 02 Mar 2009 12:01:56 +0000
Subject: Re: [PATCH 2/2] GFS2: fix sparse warning: Should it be static?
Message-Id: <1235995316.9571.824.camel@quoit>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221011033.5075.95929.stgit@vmbox.hanneseder.net>
	 <20090221011157.5075.6318.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221011157.5075.6318.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Applied to the -nmw git tree. Thanks,

Steve.

On Sat, 2009-02-21 at 02:12 +0100, Hannes Eder wrote:
> Impact: Make symbol static.
> 
> Fix this sparse warning:
>   fs/gfs2/rgrp.c:188:5: warning: symbol 'gfs2_bitfit' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
>  fs/gfs2/rgrp.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index 34691d7..f03d024 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -185,7 +185,8 @@ static inline u64 gfs2_bit_search(const __le64 *ptr, u64 mask, u8 state)
>   * Return: the block number (bitmap buffer scope) that was found
>   */
>  
> -u32 gfs2_bitfit(const u8 *buf, const unsigned int len, u32 goal, u8 state)
> +static u32 gfs2_bitfit(const u8 *buf, const unsigned int len,
> +		       u32 goal, u8 state)
>  {
>  	u32 spoint = (goal << 1) & ((8*sizeof(u64)) - 1);
>  	const __le64 *ptr = ((__le64 *)buf) + (goal >> 5);
> 

