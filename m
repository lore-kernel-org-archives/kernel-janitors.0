From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Oct 2016 07:46:46 +0000
Subject: Re: [PATCH 15/15] md-cluster: Delete unnecessary braces in unlock_all_bitmaps()
Message-Id: <20161007074646.GA6039@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3a03df66-92ce-20fb-17f3-fb79b9d43c8e@users.sourceforge.net>
 <ba60b210-40c6-b021-780c-33ecea7bee9e@users.sourceforge.net>
In-Reply-To: <ba60b210-40c6-b021-780c-33ecea7bee9e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-raid@vger.kernel.org, Guoqing Jiang <gqjiang@suse.com>, Shaohua Li <shli@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sat, Oct 01, 2016 at 05:00:07PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 1 Oct 2016 16:15:55 +0200
> 
> Do not use curly brackets at one source code place
> where a single statement should be sufficient.
> 

The original style was correct and this is wrong.  I have explained this
before.

regards,
dan carpenter

