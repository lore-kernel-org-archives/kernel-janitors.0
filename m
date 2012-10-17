From: Sam Leffler <sleffler@chromium.org>
Date: Wed, 17 Oct 2012 15:55:05 +0000
Subject: Re: [mac80211-next:wip 19/37] include/uapi/linux/nl80211.h:3101:1: error: expected identifier before
Message-Id: <CA+yqC4aF3Tp4cMUJPRoF0y0+GuYnhEVMdP5VDs_pSr2gCO4EAg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <507ebd61.LoCS32J+GZFlvQsJ%fengguang.wu@intel.com>
In-Reply-To: <507ebd61.LoCS32J+GZFlvQsJ%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

+bing

On Wed, Oct 17, 2012 at 7:14 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Sam,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git wip
> head:   1e503ffb2c3ee288fd15a25cab14c9c074850e04
> commit: 1fe89458a90b7de19ab1a4bbf96c5c298d31a30a [19/37] {nl,cfg}80211: add a flags word to scan requests
> config: x86_64-randconfig-s093 (attached as .config)
> :::::: branch date: 2 hours ago
> :::::: commit date: 5 hours ago
>
> All error/warnings:
>
> In file included from include/net/cfg80211.h:19:0,
>                  from include/net/mac80211.h:21,
>                  from net/mac80211/main.c:11:
> include/uapi/linux/nl80211.h:3101:1: error: expected identifier before '}' token
>
> vim +3101 include/uapi/linux/nl80211.h
>
> 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3095   *
> 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3096   * Scan request control flags are used to control the handling
> 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3097   * of NL80211_CMD_TRIGGER_SCAN and NL80211_CMD_START_SCHED_SCAN
> 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3098   * requests.
> 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3099   */
> 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3100  enum nl80211_scan_flags {
> 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11 @3101  };
> 1fe89458 include/uapi/linux/nl80211.h Sam Leffler   2012-10-11  3102
> 704232c2 include/linux/nl80211.h      Johannes Berg 2007-04-23  3103  #endif /* __LINUX_NL80211_H */
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
