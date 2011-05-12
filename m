From: Rafael Aquini <aquini@linux.com>
Date: Thu, 12 May 2011 00:18:59 +0000
Subject: Re: [PATCH net-next-2.6] net/bonding: adjust codingstyle for bond_3ad
Message-Id: <20110512001858.GA2435@x61.tchesoft.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110511225208.GA18851@x61.tchesoft.com>
 <20110512015237.32d6d92b@absol.kitzblitz>
In-Reply-To: <20110512015237.32d6d92b@absol.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Kaiser <nikai@nikai.net>
Cc: Jay Vosburgh <fubar@us.ibm.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>, Andy Gospodarek <andy@greyhouse.net>, shemminger@vyatta.com, netdev@vger.kernel.org

Howdy Nicolas,

On Thu, May 12, 2011 at 01:52:37AM +0200, Nicolas Kaiser wrote:
> > -// ========= AD Exported functions to the main bonding code =========
> > -void bond_3ad_initialize(struct bonding *bond, u16 tick_resolution, int lacp_fast);
> > +// ======= AD Exported functions to the main bonding code ====== */
>    ^^
>    /*

My bad, sorry. I'll be re-posting soon.

Thanks!
-- 
Rafael Aquini <aquini@linux.com>
