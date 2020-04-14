From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Apr 2020 09:23:59 +0000
Subject: Re: [PATCH] drm/i915/gt: remove redundant assignment to variable x
Message-Id: <20200414092359.GC1163@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200410192252.76908-1-colin.king@canonical.com>
References: <20200222134755.134209-1-colin.king@canonical.com>
In-Reply-To: <20200222134755.134209-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kbuild@lists.01.org, Colin King <colin.king@canonical.com>
Cc: kbuild-all@lists.01.org, lkp@intel.com, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

Hi Colin,

url:    https://github.com/0day-ci/linux/commits/Colin-King/drm-i915-gt-remove-redundant-assignment-to-variable-x/20200411-032731
base:   git://anongit.freedesktop.org/drm-intel for-linux-next

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/gt/intel_engine_cs.c:1210 print_request() error: uninitialized symbol 'x'.

# https://github.com/0day-ci/linux/commit/6ee08d455bba0066e8f5f276dcd43d9e3e594dc5
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 6ee08d455bba0066e8f5f276dcd43d9e3e594dc5
vim +/x +1210 drivers/gpu/drm/i915/gt/intel_engine_cs.c

f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2017-10-09  1202  static void print_request(struct drm_printer *m,
e61e0f51ba7974 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-02-21  1203  			  struct i915_request *rq,
f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2017-10-09  1204  			  const char *prefix)
f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2017-10-09  1205  {
ab2681512b4c10 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-03-14  1206  	const char *name = rq->fence.ops->get_timeline_name(&rq->fence);
96d4f03c20d04c drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-05-17  1207  	char buf[80] = "";
6ee08d455bba00 drivers/gpu/drm/i915/gt/intel_engine_cs.c Colin Ian King 2020-04-10  1208  	int x;
                                                                                                ^^^^^

247870ac8ea729 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-04-24  1209  
247870ac8ea729 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-04-24 @1210  	x = print_sched_attr(rq->i915, &rq->sched.attr, buf, x, sizeof(buf));
                                                                                                                                                     ^
Uninitialized variable

ab2681512b4c10 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-03-14  1211  
b300fde8965fdd drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-02-26  1212  	drm_printf(m, "%s %llx:%llx%s%s %s @ %dms: %s\n",
b7268c5eed0ab4 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-04-18  1213  		   prefix,
b300fde8965fdd drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-02-26  1214  		   rq->fence.context, rq->fence.seqno,
8547444137ec61 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-01-29  1215  		   i915_request_completed(rq) ? "!" :
8547444137ec61 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-01-29  1216  		   i915_request_started(rq) ? "*" :
8547444137ec61 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-01-29  1217  		   "",
8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   2019-05-01  1218  		   test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   2019-05-01  1219  			    &rq->fence.flags) ? "+" :
52c0fdb25c7c91 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2019-01-29  1220  		   test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   2019-05-01  1221  			    &rq->fence.flags) ? "-" :
8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   2019-05-01  1222  		   "",
247870ac8ea729 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-04-24  1223  		   buf,
f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2017-10-09  1224  		   jiffies_to_msecs(jiffies - rq->emitted_jiffies),
ab2681512b4c10 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2018-03-14  1225  		   name);
f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   2017-10-09  1226  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
