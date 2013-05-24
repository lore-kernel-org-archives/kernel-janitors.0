From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 May 2013 11:23:41 +0000
Subject: Re: [patch] f2fs: dereferencing an ERR_PTR
Message-Id: <20130524112340.GA23932@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130523100213.GA19107@elgon.mountain>
	<20130523101240.GG30128@mwanda> <1369367168.10521.13.camel@kjgkr>
In-Reply-To: <1369367168.10521.13.camel@kjgkr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

On Fri, May 24, 2013 at 12:46:08PM +0900, Jaegeuk Kim wrote:
> From ded3c78fcb6dd8c39a8664471544942e51ff9faf Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk.kim@samsung.com>
> Date: Fri, 24 May 2013 12:41:04 +0900
> Subject: [PATCH] f2fs: align data types between on-disk and in-memory
> block
>  addresses
> Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
> linux-f2fs-devel@lists.sourceforge.net
> 
> The on-disk block address is defined as __le32, but in-memory block
> address,
> block_t, does as u64.
> 
> Let's synchronize them to 32 bits.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk.kim@samsung.com>

What you say sounds good to me.  Could you give me the reported-by
tag instead of the Signed-off-by?  The Signed-off-by means it went
through my hands and it's intended as sort of a legal thing like
signing a document.

regards,
dan carpenter
