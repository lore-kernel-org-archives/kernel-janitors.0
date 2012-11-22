From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Nov 2012 16:41:54 +0000
Subject: Re: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
Message-Id: <20121122164154.GN6186@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121117151126.GA16900@elgon.mountain>
 <1353580297.2701.29.camel@sauron.fi.intel.com>
 <20121122111411.GJ6186@mwanda>
 <1353583450.2701.44.camel@sauron.fi.intel.com>
 <20121122123300.GM6186@mwanda>
 <1353595689.2701.62.camel@sauron.fi.intel.com>
In-Reply-To: <1353595689.2701.62.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>

On Thu, Nov 22, 2012 at 04:48:09PM +0200, Artem Bityutskiy wrote:
> On Thu, 2012-11-22 at 15:33 +0300, Dan Carpenter wrote:
> > It's actually dn->size that we care about here.  That's not checked
> > in ubifs_check_node().  :(  It may be checked somewhere else, I'm
> > still looking.
> 
> Wow, despite us trying to be very careful about validating what we read
> from flash, it seems we indeed never validate 'size'... Let me invent a
> fix for this, which should also be sent to -stable.
> 

Thanks.  Could you give me the Reported-by tag?

regards,
dan carpenter

