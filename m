From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 25 Jul 2012 14:32:38 +0000
Subject: Re: [mac80211-next:wip 31/37] net/mac80211/chan.c:210:26: warning: unused variable 'local'
Message-Id: <20120725143238.GA1122@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120725121421.GA28963@localhost>
In-Reply-To: <20120725121421.GA28963@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Yeah, I'd really like to catch up with the exciting and bleeding edge works :)

On Wed, Jul 25, 2012 at 08:16:26PM +0800, Berg, Johannes wrote:
> You're so quick with this ... yes, I'm still working on the patches :)
> 
> johannes
> 
> > -----Original Message-----
> > From: Wu, Fengguang
> > Sent: Wednesday, July 25, 2012 2:14 PM
> > To: Michal Kazior
> > Cc: kernel-janitors@vger.kernel.org; Berg, Johannes
> > Subject: [mac80211-next:wip 31/37] net/mac80211/chan.c:210:26: warning:
> > unused variable 'local'
> > 
> > Hi Michal,
> > 
> > There are new compile warnings show up in
> > 
> > tree:   mac80211-next/wip wip
> > head:   508c78c0703016c1c83f9d4633befa28f78f9fb9
> > commit: b324ecb5a1a68353cebb258860c2a2e8dd33452c [31/37] mac80211:
> > introduce channel context skeleton code
> > config: x86_64-randconfig-s004 (attached as .config)
> > 
> > All warnings:
> > 
> > net/mac80211/chan.c: In function 'ieee80211_assign_vif_chanctx':
> > net/mac80211/chan.c:210:26: warning: unused variable 'local' [-Wunused-
> > variable]
> > net/mac80211/chan.c: In function 'ieee80211_unassign_vif_chanctx':
> > net/mac80211/chan.c:221:26: warning: unused variable 'local' [-Wunused-
> > variable]
> > 
> > vim +210 net/mac80211/chan.c
> >    207	static void ieee80211_assign_vif_chanctx(struct
> > ieee80211_sub_if_data *sdata,
> >    208						 struct ieee80211_chanctx
> > *ctx)
> >    209	{
> >  > 210		struct ieee80211_local *local = sdata->local;
> >    211
> >    212		lockdep_assert_held(&local->chanctx_mtx);
> >    213
> > 
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Centre
> > Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
