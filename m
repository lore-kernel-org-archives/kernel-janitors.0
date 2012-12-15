From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 15 Dec 2012 05:36:17 +0000
Subject: Re: build regressions 2012-12-10
Message-Id: <20121215053617.GB25388@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50c6113e.GkkAWa8K9KrLHqo1%fengguang.wu@intel.com>
In-Reply-To: <50c6113e.GkkAWa8K9KrLHqo1%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan!

On Fri, Dec 14, 2012 at 06:14:57PM +0300, Dan Carpenter wrote:
> On Tue, Dec 11, 2012 at 12:43:42AM +0800, Fengguang Wu wrote:
> > [smatch]
> > drivers/net/virtio_net.c:1312 virtnet_alloc_queues() error: potential null dereference 'vi->rq'.  (kzalloc returns null)
> 
> I was already on the kbuild list since Dec 5, so I should have
> received this email, but I didn't.  Could someone confirm what
> happened here?

Quite some smatch warnings are of high confidence and the script will
auto/directly send it to the commit author, committer and optionally
related mailing lists. The above warning happens to be CCed to the
netdev list, which can be found here:

http://www.spinics.net/lists/netdev/msg219427.html

For such reports, you probably don't need/want to take any actions on
them because they are assumed to be checked/fixed by the commit author.

> >From my perspective, I check almost exactly the same things as you
> do but not quite.  I don't want to send duplicates but at the same
> time I have no idea what you are doing.  The email to
> kernel-janitors is useless to me because it includes every warning
> not the warnings which were sent.  The emails to kbuild are useless
> because people don't email kbuild.  The old emails to kernel janitor
> used to work but we had to stop because it was flooding the list
> with stuff that wasn't related to janitor work.
> 
> I don't know what to do here.

I think you can pretty much IGNORE all the errors that are NOT
reported to kbuild@01.org. They are 

1) either sent (privately) to the commit author, or
2) in rare cases, sent to myself for doing internal checks.

If I decided to send out (2) after manual check, I'll send it directly
to the commit author as in (1). If you'd like to see (2) too, I'd be
more than willing to CC them to you. :)

So the data flows will be

[high confident]   ========> first bad commit's author
[low confident]    ========> kbuild@01.org (and you)

[possibly wrong bisection] ====> internal check  ----> first bad commit's author
[misc. unusual cases] =======> internal check  ----> first bad commit's author

[interim warnings] ========> don't send out, except that the message will still show up in the daily summary

Interim warnings are bugs introduced in the middle of the branch and
fixed somewhere later, so that the problems no longer exist in the
branch HEAD.

Thanks,
Fengguang
