From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Oct 2012 06:33:22 +0000
Subject: Re: [PATCH] aoe: avoid using skb member after dev_queue_xmit
Message-Id: <20121025063322.GH20754@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1523cdc8a606d65418dc242e958ff1c@coraid.com>
 <20121024150807.82ce2677.akpm@linux-foundation.org>
In-Reply-To: <20121024150807.82ce2677.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ed Cashin <ecashin@coraid.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 24, 2012 at 03:08:07PM -0700, Andrew Morton wrote:
> On Wed, 24 Oct 2012 14:26:13 -0400
> Ed Cashin <ecashin@coraid.com> wrote:
> 
> > After calling dev_queue_xmit it is no longer safe to access the
> > members of the skb.
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> hm, that was clever.  How did Dan detect this bug?

It was a Smatch thing, but it wasn't enabled by default.  I think I
will enable it.  This is the second bug use after dev_queue_xmit()
in two years.

regards,
dan carpenter

