From: Bing Zhao <bzhao@marvell.com>
Date: Wed, 17 Oct 2012 17:30:49 +0000
Subject: RE: [mac80211-next:wip 19/37] include/uapi/linux/nl80211.h:3101:1: error: expected identifier before
Message-Id: <477F20668A386D41ADCC57781B1F7043083B80E25C@SC-VEXCH1.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <507ebd61.LoCS32J+GZFlvQsJ%fengguang.wu@intel.com>
In-Reply-To: <507ebd61.LoCS32J+GZFlvQsJ%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

> > FYI, kernel build failed on
> >
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git wip
> > head:   1e503ffb2c3ee288fd15a25cab14c9c074850e04

It compiled fine against this HEAD.

> > commit: 1fe89458a90b7de19ab1a4bbf96c5c298d31a30a [19/37] {nl,cfg}80211: add a flags word to scan
> requests

This commit is the first patch (1/5) of "add scan flags support" series.
It adds a placeholder for nl80211_scan_flags. 3/5 and 4/5 add actual flags to it.

So, you have to get the whole patchset to compile.

Thanks,
Bing

> > config: x86_64-randconfig-s093 (attached as .config)
> > :::::: branch date: 2 hours ago
> > :::::: commit date: 5 hours ago
> >
> > All error/warnings:
> >
> > In file included from include/net/cfg80211.h:19:0,
> >                  from include/net/mac80211.h:21,
> >                  from net/mac80211/main.c:11:
> > include/uapi/linux/nl80211.h:3101:1: error: expected identifier before '}' token
> >
> > vim +3101 include/uapi/linux/nl80211.h
> >
> > 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3095   *
> > 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3096   * Scan request control flags
> are used to control the handling
> > 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3097   * of
> NL80211_CMD_TRIGGER_SCAN and NL80211_CMD_START_SCHED_SCAN
> > 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3098   * requests.
> > 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3099   */
> > 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3100  enum nl80211_scan_flags {
> > 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11 @3101  };
> > 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3102
> > 704232c2 include/linux/nl80211.h      Johannes Berg 2007-04-23  3103  #endif /* __LINUX_NL80211_H
> */
> >
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Center
> > Fengguang Wu, Yuanhan Liu                              Intel Corporation
