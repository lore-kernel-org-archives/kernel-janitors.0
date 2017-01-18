From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Jan 2017 14:50:00 +0000
Subject: Re: [bug report] net/sched: cls_flower: Set the filter Hardware device for all use-cases
Message-Id: <20170118145000.GA4398@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170117225703.GA21380@mwanda>
In-Reply-To: <20170117225703.GA21380@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 18, 2017 at 04:01:05PM +0200, Hadar Hen Zion wrote:
> 
> 
> On 1/18/2017 12:57 AM, Dan Carpenter wrote:
> >Hello Hadar Hen Zion,
> >
> >The patch a6e169312971: "net/sched: cls_flower: Set the filter
> >Hardware device for all use-cases" from Dec 4, 2016, leads to the
> >following static checker warning:
> >
> >	net/sched/cls_flower.c:272 fl_hw_replace_filter()
> >	error: we previously assumed 'dev' could be null (see line 256)
> >
> >net/sched/cls_flower.c
> >    240  static int fl_hw_replace_filter(struct tcf_proto *tp,
> >    241                                  struct flow_dissector *dissector,
> >    242                                  struct fl_flow_key *mask,
> >    243                                  struct cls_fl_filter *f)
> >    244  {
> >    245          struct net_device *dev = tp->q->dev_queue->dev;
> >    246          struct tc_cls_flower_offload offload = {0};
> >    247          struct tc_to_netdev *tc = &f->tc;
> >    248          int err;
> >    249
> >    250          if (!tc_can_offload(dev, tp)) {
> >    251                  if (tcf_exts_get_dev(dev, &f->exts, &f->hw_dev) ||
> >    252                      (f->hw_dev && !tc_can_offload(f->hw_dev, tp))) {
> >                              ^^^^^^^^^
> >Let's say this is NULL.
> >
> >    253                          f->hw_dev = dev;
> >    254                          return tc_skip_sw(f->flags) ? -EINVAL : 0;
> >    255                  }
> >    256                  dev = f->hw_dev;
> >
> >That means "dev" is NULL.
> 
> After re-checking the code, it's a not a real bug.
> If  'f->hw_dev' is NULL we would never get here.
> tcf_exts_get_dev() function above returns an error in case
> 'f->hw_dev' is NULL, so we'll go into the 'if' and return from the
> function.
> 
> The above 'f->hw_dev' check you marked above is redundant, that's
> why we got the static checker warning.
> I'll send a patch that remove it.

Yeah.  Removing the check is the right thing.

Oddly enough, this Smatch test is supposed to ignore NULL checks when we
can tell that they non-NULL.  The only reason this warning was printed
was because I had a bug where it said that f->exts.nr_actions was always
zero here.  That's fixed today apparently so it no longer generates the
warning.

Two steps forward, one step back.

regards,
dan carpenter

