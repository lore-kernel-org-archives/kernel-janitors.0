From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Jan 2017 22:57:03 +0000
Subject: [bug report] net/sched: cls_flower: Set the filter Hardware device for all use-cases
Message-Id: <20170117225703.GA21380@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Hadar Hen Zion,

The patch a6e169312971: "net/sched: cls_flower: Set the filter
Hardware device for all use-cases" from Dec 4, 2016, leads to the
following static checker warning:

	net/sched/cls_flower.c:272 fl_hw_replace_filter()
	error: we previously assumed 'dev' could be null (see line 256)

net/sched/cls_flower.c
   240  static int fl_hw_replace_filter(struct tcf_proto *tp,
   241                                  struct flow_dissector *dissector,
   242                                  struct fl_flow_key *mask,
   243                                  struct cls_fl_filter *f)
   244  {
   245          struct net_device *dev = tp->q->dev_queue->dev;
   246          struct tc_cls_flower_offload offload = {0};
   247          struct tc_to_netdev *tc = &f->tc;
   248          int err;
   249  
   250          if (!tc_can_offload(dev, tp)) {
   251                  if (tcf_exts_get_dev(dev, &f->exts, &f->hw_dev) ||
   252                      (f->hw_dev && !tc_can_offload(f->hw_dev, tp))) {
                             ^^^^^^^^^
Let's say this is NULL.

   253                          f->hw_dev = dev;
   254                          return tc_skip_sw(f->flags) ? -EINVAL : 0;
   255                  }
   256                  dev = f->hw_dev;

That means "dev" is NULL.

   257                  tc->egress_dev = true;
   258          } else {
   259                  f->hw_dev = dev;
   260          }
   261  
   262          offload.command = TC_CLSFLOWER_REPLACE;
   263          offload.cookie = (unsigned long)f;
   264          offload.dissector = dissector;
   265          offload.mask = mask;
   266          offload.key = &f->mkey;
   267          offload.exts = &f->exts;
   268  
   269          tc->type = TC_SETUP_CLSFLOWER;
   270          tc->cls_flower = &offload;
   271  
   272          err = dev->netdev_ops->ndo_setup_tc(dev, tp->q->handle, tp->protocol,

So we oops here.

   273                                              tc);
   274  
   275          if (tc_skip_sw(f->flags))
   276                  return err;
   277          return 0;
   278  }

regards,
dan carpenter
