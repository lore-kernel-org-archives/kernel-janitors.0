From: Christoph Hellwig <hch@lst.de>
Date: Thu, 05 Mar 2009 13:39:17 +0000
Subject: Re: [PATCH 3/3] xfs: include header files for prototypes
Message-Id: <20090305133917.GC14854@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090304183136.525.13769.stgit@f10box.hanneseder.net> <20090304183418.525.22262.stgit@f10box.hanneseder.net>
In-Reply-To: <20090304183418.525.22262.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Felix Blyakher <felixb@sgi.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

looks good, except for a tiny nit-pick:

> +++ b/fs/xfs/support/debug.c
> @@ -19,6 +19,7 @@
>  #include "debug.h"
>  
>  /* xfs_mount.h drags a lot of crap in, sorry.. */
> +#include "xfs_error.h"
>  #include "xfs_sb.h"
>  #include "xfs_inum.h"
>  #include "xfs_ag.h"

as xfs_mount.h doesn't require xfs_error.h it should be included 
above that comment.
