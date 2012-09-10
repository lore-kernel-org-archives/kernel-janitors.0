From: Glauber Costa <glommer@parallels.com>
Date: Mon, 10 Sep 2012 12:58:02 +0000
Subject: Re: [glommer-memcg:kmemcg-slab 57/62] drivers/video/riva/fbdev.c:281:9: sparse: preprocessor token M
Message-Id: <504DE3DA.7000802@parallels.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120910111638.GC9660@localhost> <20120910125759.GA11808@localhost>
In-Reply-To: <20120910125759.GA11808@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>

On 09/10/2012 04:57 PM, Fengguang Wu wrote:
> Glauber,
> 
> The patch entitled
> 
>  sl[au]b: Allocate objects from memcg cache
> 
> changes
> 
>  include/linux/slub_def.h |   15 ++++++++++-----
> 
> which triggers this warning:
> 
> drivers/video/riva/fbdev.c:281:9: sparse: preprocessor token MAX_LEVEL redefined
> 
> It's the MAX_LEVEL that is defined in include/linux/idr.h.
> 
> MAX_LEVEL is obviously too generic. Better adding some prefix to it?
> 

I don't see any MAX_LEVEL definition in this patch. You say it is
defined in include/linux/idr.h, and as the diffstat shows, I am not
touching this file.

I think this needs patching independently.


