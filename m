From: "Berg, Johannes" <johannes.berg@intel.com>
Date: Fri, 07 Sep 2012 07:51:40 +0000
Subject: RE: [mac80211-next:wip 56/57] net/mac80211/mlme.c:903:43: warning: 'chan_pwr' may be used uninitiali
Message-Id: <1DC40B07CD6EC041A66726C271A73AE6195AD438@IRSMSX102.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1DC40B07CD6EC041A66726C271A73AE6195AD1CC@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <1DC40B07CD6EC041A66726C271A73AE6195AD1CC@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > Also, newer gccs (like my 4.7.1) don't warn here.
> 
> I'm also running gcc 4.7.1 and it's behavior is a bit interesting:
> make allmodconfig is fine while this particular config will trigger the false
> warning ;)

Heh, that's interesting! I wonder what that is? I'm mostly building modules only out-of-tree... Odd!

johannes
Intel GmbH
Dornacher Strasse 1
85622 Feldkirchen/Muenchen, Deutschland
Sitz der Gesellschaft: Feldkirchen bei Muenchen
Geschaeftsfuehrer: Peter Gleissner, Christian Lamprechter, Hannes Schwaderer, Douglas Lusk
Registergericht: Muenchen HRB 47456
Ust.-IdNr./VAT Registration No.: DE129385895
Citibank Frankfurt a.M. (BLZ 502 109 00) 600119052

