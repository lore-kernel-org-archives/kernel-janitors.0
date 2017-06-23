From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Jun 2017 10:36:12 +0000
Subject: Re: [PATCH -net] tls: return -EFAULT if copy_to_user() fails
Message-Id: <20170623103612.ycduw43oyi6hmtp3@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623101544.c5bvwe5cd6e46bd5@mwanda>
 <1498213904.24295.10.camel@perches.com>
In-Reply-To: <1498213904.24295.10.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Dave Watson <davejwatson@fb.com>, Aviad Yehezkel <aviadye@mellanox.com>, Ilya Lesokhin <ilyal@mellanox.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 23, 2017 at 03:31:44AM -0700, Joe Perches wrote:
> On Fri, 2017-06-23 at 13:15 +0300, Dan Carpenter wrote:
> > The copy_to_user() function returns the number of bytes remaining but we
> > want to return -EFAULT here.
> 
> because?
> 

Rhetorical questions don't work over email.  Are you honestly confused
by this patch?

regards,
dan carpenter

