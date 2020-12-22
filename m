From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 22 Dec 2020 13:34:11 +0000
Subject: Re: [PATCH] freevxfs: fix spelling mistake in Kconfig "endianess" -> "endianness"
Message-Id: <20201222133411.GB5099@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201216111605.10787-1-colin.king@canonical.com>
In-Reply-To: <20201216111605.10787-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Christoph Hellwig <hch@infradead.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org

Andrew,

can you pick this up through -mm?  I have no active git tree for freevxfs
anymore.

On Wed, Dec 16, 2020 at 11:16:05AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the Kconfig help text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/freevxfs/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/freevxfs/Kconfig b/fs/freevxfs/Kconfig
> index c05c71d57291..0e2fc08f7de4 100644
> --- a/fs/freevxfs/Kconfig
> +++ b/fs/freevxfs/Kconfig
> @@ -8,7 +8,7 @@ config VXFS_FS
>  	  of SCO UnixWare (and possibly others) and optionally available
>  	  for Sunsoft Solaris, HP-UX and many other operating systems. However
>  	  these particular OS implementations of vxfs may differ in on-disk
> -	  data endianess and/or superblock offset. The vxfs module has been
> +	  data endianness and/or superblock offset. The vxfs module has been
>  	  tested with SCO UnixWare and HP-UX B.10.20 (pa-risc 1.1 arch.)
>  	  Currently only readonly access is supported and VxFX versions
>  	  2, 3 and 4. Tests were performed with HP-UX VxFS version 3.
> -- 
> 2.29.2
> 
---end quoted text---
