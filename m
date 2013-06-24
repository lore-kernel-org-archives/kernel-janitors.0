From: David Miller <davem@davemloft.net>
Date: Mon, 24 Jun 2013 07:26:07 +0000
Subject: Re: [patch] xen-netback: double free on unload
Message-Id: <20130624.002607.1816906327683052502.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130621062008.GA10873@elgon.mountain>
In-Reply-To: <20130621062008.GA10873@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ian.campbell@citrix.com, xen-devel@lists.xensource.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Jun 2013 09:20:08 +0300

> There is a typo here, "i" vs "j", so we would crash on module_exit().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Please always explicitly state the tree for which a patch is
applicable.

Here I figured it out by trial an error, trying to apply it
to 'net' (where it failed) and then 'net-next' (where it
applied cleanly).

I should never have to play patch monkey games like that, you
need to tell me where a patch is targetted.

Thanks.
