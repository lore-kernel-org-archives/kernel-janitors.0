From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 17 Oct 2012 23:35:20 +0000
Subject: Re: [mac80211-next:wip 19/37] include/uapi/linux/nl80211.h:3101:1: error: expected identifier before
Message-Id: <20121017233520.GA16929@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <507ebd61.LoCS32J+GZFlvQsJ%fengguang.wu@intel.com>
In-Reply-To: <507ebd61.LoCS32J+GZFlvQsJ%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Bing,

On Wed, Oct 17, 2012 at 10:30:49AM -0700, Bing Zhao wrote:
> Hi Fengguang,
> 
> > > FYI, kernel build failed on
> > >
> > > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git wip
> > > head:   1e503ffb2c3ee288fd15a25cab14c9c074850e04
> 
> It compiled fine against this HEAD.

Yes.

> > > commit: 1fe89458a90b7de19ab1a4bbf96c5c298d31a30a [19/37] {nl,cfg}80211: add a flags word to scan
> > requests
> 
> This commit is the first patch (1/5) of "add scan flags support" series.
> It adds a placeholder for nl80211_scan_flags. 3/5 and 4/5 add actual flags to it.

But that placeholder is not a valid C construct and breaks kernel build ..

> So, you have to get the whole patchset to compile.

When preparing/organizing patches, every step of the patchset should
be able to build and boot fine. That will make it friendly to bisect.

Thanks,
Fengguang
