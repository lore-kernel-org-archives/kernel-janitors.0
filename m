From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 07 Sep 2012 01:41:25 +0000
Subject: Re: [mac80211-next:wip 56/57] net/mac80211/mlme.c:903:43: warning: 'chan_pwr' may be used uninitiali
Message-Id: <20120907014125.GA9047@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1DC40B07CD6EC041A66726C271A73AE6195AD1CC@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <1DC40B07CD6EC041A66726C271A73AE6195AD1CC@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 06, 2012 at 11:00:01PM +0800, Berg, Johannes wrote:
> Hi,
> 
> Thanks.
> 
> > net/mac80211/mlme.c: In function 'ieee80211_rx_mgmt_beacon':
> > net/mac80211/mlme.c:903:43: warning: 'chan_pwr' may be used uninitialized
> > in this function [-Wmaybe-uninitialized]
> > net/mac80211/mlme.c:871:6: note: 'chan_pwr' was declared here
> 
> I think this is a false positive? It's only used if have_chan_pwr is true, and that's set only if chan_pwr is set.

Yes..many of the compiler warnings are false ones. They are sent out
anyway because I believe it's good practice to just quiet *all* gcc
warnings.

Would you apply the followed fix?

Thanks,
Fengguang
