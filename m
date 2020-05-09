From: Joe Perches <joe@perches.com>
Date: Sat, 09 May 2020 02:31:48 +0000
Subject: Re: [PATCH] net: tg3: tidy up loop, remove need to compute off with a multiply
Message-Id: <fbd61323358554b00460c97ec303572189f99544.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508225301.484094-1-colin.king@canonical.com>
         <1890306fc8c9306abe11186d419d84f784ee6144.camel@perches.com>
         <160ce1ee-3bb5-3357-64f3-e5dea8c0538d@canonical.com>
         <20200508184814.45e10c12@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200508184814.45e10c12@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>, Colin Ian King <colin.king@canonical.com>
Cc: Siva Reddy Kallam <siva.kallam@broadcom.com>, Prashant Sreedharan <prashant@broadcom.com>, Michael Chan <mchan@broadcom.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2020-05-08 at 18:48 -0700, Jakub Kicinski wrote:
> On Sat, 9 May 2020 00:31:03 +0100 Colin Ian King wrote:
> > > My preference would be for
> > > 
> > > {
> > > 	int i;
> > > 	u32 off = 0;
> > > 
> > > 	for (i = 0; i < TG3_SD_NUM_RECS; i++) {
> > > 		tg3_ape_scratchpad_read(tp, (u32 *)ocir, off, TC3_OCIR_LEN);
> > > 
> > > 		if (ocir->signature != TG3_OCIR_SIG_MAGIC ||
> > > 		    !(ocir->version_flags & TG3_OCIR_FLAG_ACTIVE))
> > > 			memset(ocir, 0, TG3_OCIR_LEN);
> > > 
> > > 		off += TG3_OCIR_LEN;
> > > 		ocir++;
> > > 	}
> > >   
> > OK, I'll send a V3 tomorrow.
> 
> I already reviewed and applied v2, just waiting for builds to finish,
> let's leave it.


I think clarity should be preferred.
Are you a maintainer of this file?

$ ./scripts/get_maintainer.pl -f drivers/net/ethernet/broadcom/tg3.c
Siva Reddy Kallam <siva.kallam@broadcom.com> (supporter:BROADCOM TG3 GIGABIT ETHERNET DRIVER)
Prashant Sreedharan <prashant@broadcom.com> (supporter:BROADCOM TG3 GIGABIT ETHERNET DRIVER)
Michael Chan <mchan@broadcom.com> (supporter:BROADCOM TG3 GIGABIT ETHERNET DRIVER)
"David S. Miller" <davem@davemloft.net> (odd fixer:NETWORKING DRIVERS)
netdev@vger.kernel.org (open list:BROADCOM TG3 GIGABIT ETHERNET DRIVER)
linux-kernel@vger.kernel.org (open list)
