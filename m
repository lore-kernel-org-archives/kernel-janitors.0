From: David Miller <davem@davemloft.net>
Date: Wed, 09 Sep 2009 10:40:57 +0000
Subject: Re: [PATCH resend] s2io: Remove unnecessary casts
Message-Id: <20090909.034057.58038960.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1252384015.6396.11.camel@dbueso-pc>
In-Reply-To: <1252384015.6396.11.camel@dbueso-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dave@gnu.org
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Davidlohr Bueso <dave@gnu.org>
Date: Tue, 08 Sep 2009 00:26:55 -0400

> Hi David,
> 
> Don't know why my email client corrupted the patch, anyways, here it is without white spaces.
> 
> No need to cast kmalloc.
> 
> Thanks,
> Davidlohr
> 
> 
> Signed-off-by: Davidlohr Bueso <dave@gnu.org>

Since you last submitted this patch a large series of cleanup
patches were added to this driver in the net-next-2.6 tree
and as a result your patch no longer applies properly.

You'll need to respin these changes and make sure they
apply cleanly to net-next-2.6

Thanks.
