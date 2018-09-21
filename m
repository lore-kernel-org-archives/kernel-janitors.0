From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Sep 2018 08:03:51 +0000
Subject: Re: [PATCH] staging: wilc1000: Remove unnecessary pointer check
Message-Id: <20180921080351.ckw727xyznzwemuu@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180920212648.25181-1-natechancellor@gmail.com>
 <32473.1537507532@turing-police.cc.vt.edu>
In-Reply-To: <32473.1537507532@turing-police.cc.vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: valdis.kletnieks@vt.edu
Cc: Nathan Chancellor <natechancellor@gmail.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Ganesh Krishna <ganesh.krishna@microchip.com>, Aditya Shankar <aditya.shankar@microchip.com>, kernel-janitors@vger.kernel.org

On Fri, Sep 21, 2018 at 01:25:32AM -0400, valdis.kletnieks@vt.edu wrote:
> On Thu, 20 Sep 2018 14:26:49 -0700, Nathan Chancellor said:
> > Clang warns that the address of a pointer will always evaluated as true
> > in a boolean context:
> >
> > drivers/staging/wilc1000/linux_wlan.c:267:20: warning: address of
> > 'vif->ndev->dev' will always evaluate to 'true'
> > [-Wpointer-bool-conversion]
> >         if (!(&vif->ndev->dev))
> >             ~  ~~~~~~~~~~~^~~
> > 1 warning generated.
> >
> > Since this statement always evaluates to false due to the logical not,
> > remove it.
> 
> Often, "just nuke it because it's now dead code" isn't the best answer...
> 
> At one time, that was likely intended to be checking whether ->dev was a null
> pointer, to make sure we don't pass request_firmware() a null pointer and oops
> the kernel, or other things that go pear-shaped....
> 
> So the question becomes:   Is it safe to just remove it, or was it intended to
> test for something that could  legitimately be null if we've hit an error along
> the way (which means we should fix the condition to be proper and acceptable
> to both gcc and clang)?
> 

Obviously, we hope that Nathan considered that.  This driver has new
competent maintainers so they would think about that too.  I also review
staging patches and I reviewed it a few minutes after it was sent.  So
it's not like anyone was going to just merge the patch without thinking
about whether a different test was intended.

I am on the kernel-janitors and we've had one or two of these recently
where the warning indicate a bug so perhaps we do need to think about it
from a "process perspective".  The Fixes tag isn't appropiate because
it's not a bug fix, but we could just say in the comments:

    "This unused variable was added in commit 123456789012 ("blah blah")
     so far as I can see it has never been useful."

That would help reviewing because now I know that you thought about it
and I also can just look at the original commit.  For this patch I did
git log -p and the scrolled to the original commit, and the function
name had changed so I had to scroll back and forth a bit to see what
the function was called originally.  It wasn't a huge deal but having
the original commit would be nice.

regards,
dan carpenter
