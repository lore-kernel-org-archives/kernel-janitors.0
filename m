From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Nov 2012 12:09:50 +0000
Subject: Re: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
Message-Id: <20121122120950.GL6186@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121117151126.GA16900@elgon.mountain>
 <1353580297.2701.29.camel@sauron.fi.intel.com>
 <20121122111411.GJ6186@mwanda>
 <1353583603.2701.45.camel@sauron.fi.intel.com>
 <1353583773.2701.46.camel@sauron.fi.intel.com>
In-Reply-To: <1353583773.2701.46.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>

On Thu, Nov 22, 2012 at 01:29:33PM +0200, Artem Bityutskiy wrote:
> On Thu, 2012-11-22 at 13:26 +0200, Artem Bityutskiy wrote:
> > Did you consider kcalloc() ? Just like malloc() / calloc() libc
> > functions? 
> 
> Ah, there is kcaoloc already, so I guess then we could just put the
> overflow check there instead?

Yep.  That's there already.

regards,
dan carpenter

