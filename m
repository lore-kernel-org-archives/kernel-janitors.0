From: Dave Chinner <david@fromorbit.com>
Date: Thu, 03 Apr 2014 19:36:38 +0000
Subject: Re: [patch] xfs: extra semi-colon breaks a condition
Message-Id: <20140403193638.GO16336@dastard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140328080313.GA25192@mwanda>
In-Reply-To: <20140328080313.GA25192@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

On Fri, Mar 28, 2014 at 11:03:13AM +0300, Dan Carpenter wrote:
> There were some extra semi-colons here which mean that we return true
> unintentionally.
> 
> Fixes: a49935f200e2 ('xfs: xfs_check_page_type buffer checks need help')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Dan, $BEVVIE_OF_CHOICE is on me next time we are in the same place.
And bring a handful brown paper bags as well because there's a few
people here that need to wear them for a while. :/

Reviewed-by: Dave Chinner <dchinner@redhat.com>
-- 
Dave Chinner
david@fromorbit.com
