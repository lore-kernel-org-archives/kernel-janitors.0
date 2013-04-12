From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Apr 2013 05:59:32 +0000
Subject: Re: [patch 1/2 -next] dma-buf: double unlock in debugfs code
Message-Id: <20130412055931.GI6692@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130411062339.GA7603@elgon.mountain>
 <CAO_48GHvAUmVmmZyHiEXzN3nWtTjC9iz-hEo-z3GrR2T-LZ-0w@mail.gmail.com>
In-Reply-To: <CAO_48GHvAUmVmmZyHiEXzN3nWtTjC9iz-hEo-z3GrR2T-LZ-0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kbuild@01.org, Linaro MM SIG <linaro-mm-sig@lists.linaro.org>, kernel-janitors@vger.kernel.org, Dave Airlie <airlied@redhat.com>, LKML <linux-kernel@vger.kernel.org>

On Fri, Apr 12, 2013 at 08:43:05AM +0530, Sumit Semwal wrote:
> Hi Dan,
> 
> On Apr 11, 2013 11:54 AM, "Dan Carpenter" <dan.carpenter@oracle.com> wrote:
> >
> > We unlock here when we failed to take the lock.
> Thanks for catching this; I will add it to the for-next queue.
> 
> Could I merge this change with the main patch while submitting to mainline?
> With an attribution to you, of course.

Yeah.  Just merge it.  Don't stress about attribution.

regards,
dan carpenter

