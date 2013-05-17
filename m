From: Matthew Wilcox <willy@linux.intel.com>
Date: Fri, 17 May 2013 14:45:26 +0000
Subject: Re: [PATCH] NVMe: Fix incompatible pointer type warnings
Message-Id: <20130517144526.GV6057@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1368799780-2871-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1368799780-2871-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 17, 2013 at 04:09:40PM +0200, Emil Goode wrote:
> Commit 6a4d55146334 ("block: prep work for batch completion")
> added a struct batch_complete * as a third argument to bi_end_io.
> This patch adds the missing third argument to the nvme_bio_pair_endio
> function.

That patch isn't in Linus' tree yet, so we can't apply this patch.  It needs
to go to linux-next.
