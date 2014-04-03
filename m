From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Apr 2014 09:13:16 +0000
Subject: Re: [patch] i40e: remove an unneeded check
Message-Id: <20140403091316.GF6991@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140328082919.GM25192@mwanda>
In-Reply-To: <20140328082919.GM25192@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 28, 2014 at 12:17:16PM -0700, Jeff Kirsher wrote:
> On Fri, 2014-03-28 at 11:29 +0300, Dan Carpenter wrote:
> > We know "ret" is zero here.  No need to check again.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Dan with the latest bunch of patches I just pushed and that Dave
> accepted, the code changes which directly affect your patch to leaves
> your patch only changing the return statement from:
> 
> return ret;
> 
> to 
> 
> return 0;
> 
> but with the recent change in the code, the ret value can be something
> other than 0 so your patch does not appear to be needed any longer.

Sure, yep.  It's not needed anymore.

regards,
dan carpenter

