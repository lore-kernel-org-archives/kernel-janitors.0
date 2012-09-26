From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 26 Sep 2012 00:45:15 +0000
Subject: Re: [slave-dma:topic/dmaengine_dt 17/20] drivers/dma/dmaengine.c:65:26: fatal error: linux/of_dma.h:
Message-Id: <20120926004515.GA5528@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120925113703.GA5157@localhost>
In-Reply-To: <20120925113703.GA5157@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 25, 2012 at 09:55:13PM +0530, Vinod Koul wrote:
> On Tue, 2012-09-25 at 19:37 +0800, Fengguang Wu wrote:
> > Hi Vinod,
> > 
> > I noticed that kernel build failed on this commit and get fixed by
> > the next next commit. Do you want me to do commit-by-commit tests on
> > your tree, or test branch head first which will ignore such interim errors?
> test branch head should be fine. 

OK!

> But yes for kernel each patch needs to build on its own, this should not
> have happened in the first place.

Yeah, for that purpose ktest or aiaiai are good tools that's designed
to run such checks before pushing new commits. :-)

Thanks,
Fengguang
