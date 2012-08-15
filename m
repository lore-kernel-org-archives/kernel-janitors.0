From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 15 Aug 2012 14:07:36 +0000
Subject: Re: [staging:staging-next 70/73] drivers/staging/comedi/drivers/amplc_dio200.c:1444:2: error: implic
Message-Id: <20120815140736.GA32426@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <502B71C7.4010005@mev.co.uk>
In-Reply-To: <502B71C7.4010005@mev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > Well it looks like my patches got applied in the wrong order (1, 3,
> > 2) on Greg's staging-next branch, but as long as all 3 patches are
> > applied it ought to compile okay.
> 
> Argh, I did?  Sorry about that.  Nothing I can do about it now :(

No problem. That reminds me to mark the staging-next branch as
non-rebaseable (which means the test system will silently ignore
intermediate errors in that branch).

Perhaps usb-next is non-rebaseable as well. Are there any more that
should be marked as non-rebaseable?

Thanks,
Fengguang
