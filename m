From: "Berg, Johannes" <johannes.berg@intel.com>
Date: Thu, 06 Sep 2012 15:00:01 +0000
Subject: RE: [mac80211-next:wip 56/57] net/mac80211/mlme.c:903:43: warning: 'chan_pwr' may be used uninitiali
Message-Id: <1DC40B07CD6EC041A66726C271A73AE6195AD1CC@IRSMSX102.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Thanks.

> net/mac80211/mlme.c: In function 'ieee80211_rx_mgmt_beacon':
> net/mac80211/mlme.c:903:43: warning: 'chan_pwr' may be used uninitialized
> in this function [-Wmaybe-uninitialized]
> net/mac80211/mlme.c:871:6: note: 'chan_pwr' was declared here

I think this is a false positive? It's only used if have_chan_pwr is true, and that's set only if chan_pwr is set.

johannes
Intel GmbH
Dornacher Strasse 1
85622 Feldkirchen/Muenchen, Deutschland
Sitz der Gesellschaft: Feldkirchen bei Muenchen
Geschaeftsfuehrer: Peter Gleissner, Christian Lamprechter, Hannes Schwaderer, Douglas Lusk
Registergericht: Muenchen HRB 47456
Ust.-IdNr./VAT Registration No.: DE129385895
Citibank Frankfurt a.M. (BLZ 502 109 00) 600119052

