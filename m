From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Jul 2012 12:23:54 +0000
Subject: Re: [infiniband:for-next 13/14] drivers/infiniband/hw/qib/qib_keys.c:64:23: sparse: incompatible typ
Message-Id: <20120706122354.GB8027@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120706080229.GB28650@localhost>
In-Reply-To: <20120706080229.GB28650@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 06, 2012 at 11:58:14AM +0000, Marciniszyn, Mike wrote:
> I'm not seeing this on either of my build test systems.
> 
> Can you provide your .config file and gcc version?
> 

This isn't a GCC warning, it's a sparse warning.  It's saying that
your Sparse rcu anotations aren't correct, probably.

I've added Fengguang's other email address in case wfg isn't fixed
yet.

regards,
dan carpenter

