From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 23:38:01 +0000
Subject: Re: [PATCH] idr: Rename MAX_LEVEL to MAX_ID_LEVEL
Message-Id: <20120912233801.GA14638@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120910131426.GA12431@localhost>
 <504E1182.7080300@bfs.de>
 <20120911094823.GA29568@localhost>
 <20120912160302.ae257eb4.akpm@linux-foundation.org>
In-Reply-To: <20120912160302.ae257eb4.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: walter harms <wharms@bfs.de>, Glauber Costa <glommer@parallels.com>, kernel-janitors@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>

On Wed, Sep 12, 2012 at 04:03:02PM -0700, Andrew Morton wrote:
> On Tue, 11 Sep 2012 17:48:23 +0800
> Fengguang Wu <fengguang.wu@intel.com> wrote:
> 
> > idr: Rename MAX_LEVEL to MAX_IDR_LEVEL
> > 
> > To avoid name conflicts:
> > 
> > drivers/video/riva/fbdev.c:281:9: sparse: preprocessor token MAX_LEVEL redefined
> > 
> > While at it, also make the other names more consistent and
> > add parentheses.
> 
> That was a rather modest effort :(
> 
>  drivers/i2c/i2c-core.c        |    2 +-
>  drivers/infiniband/core/cm.c  |    2 +-
>  drivers/pps/pps.c             |    2 +-
>  drivers/thermal/thermal_sys.c |    2 +-
>  fs/super.c                    |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: idr-rename-max_level-to-max_idr_level-fix-fix-2
> 
> ho hum
> 
>  lib/idr.c |   14 +++++++-------

Embarrassing.. Sorry for not build testing it at all!

Regards,
Fengguang
