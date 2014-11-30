From: Dave Chinner <david@fromorbit.com>
Date: Sun, 30 Nov 2014 23:09:04 +0000
Subject: Re: [PATCH 1/1] XFS: Deletion of unnecessary checks before two function calls
Message-Id: <20141130230904.GF16151@dastard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net>
	<alpine.DEB.2.10.1402251014170.2080@hadrien>
	<530CD2C4.4050903@users.sourceforge.net>
	<alpine.DEB.2.10.1402251840450.7035@hadrien>
	<530CF8FF.8080600@users.sourceforge.net>
	<alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	<530DD06F.4090703@users.sourceforge.net>
	<alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<5479F823.60900@users.sourceforge.net>
In-Reply-To: <5479F823.60900@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com

On Sat, Nov 29, 2014 at 05:45:23PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 29 Nov 2014 17:40:22 +0100
> 
> The functions xfs_blkdev_put() and xfs_qm_dqrele() test whether their argument
> is NULL and then return immediately.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Looks fine.

Reviewed-by: Dave Chinner <dchinner@redhat.com>


-- 
Dave Chinner
david@fromorbit.com
