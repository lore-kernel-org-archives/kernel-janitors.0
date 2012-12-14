From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Dec 2012 15:14:57 +0000
Subject: Re: build regressions 2012-12-10
Message-Id: <20121214151457.GA5032@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50c6113e.GkkAWa8K9KrLHqo1%fengguang.wu@intel.com>
In-Reply-To: <50c6113e.GkkAWa8K9KrLHqo1%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Dec 11, 2012 at 12:43:42AM +0800, Fengguang Wu wrote:
> [smatch]
> drivers/net/virtio_net.c:1312 virtnet_alloc_queues() error: potential null dereference 'vi->rq'.  (kzalloc returns null)

I was already on the kbuild list since Dec 5, so I should have
received this email, but I didn't.  Could someone confirm what
happened here?

From my perspective, I check almost exactly the same things as you
do but not quite.  I don't want to send duplicates but at the same
time I have no idea what you are doing.  The email to
kernel-janitors is useless to me because it includes every warning
not the warnings which were sent.  The emails to kbuild are useless
because people don't email kbuild.  The old emails to kernel janitor
used to work but we had to stop because it was flooding the list
with stuff that wasn't related to janitor work.

I don't know what to do here.

regards,
dan carpenter
