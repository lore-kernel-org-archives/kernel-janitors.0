From: Rafael Aquini <aquini@linux.com>
Date: Sat, 07 May 2011 21:37:16 +0000
Subject: Re: [PATCH] net/bonding: adjust codingstyle for bond_3ad files
Message-Id: <20110507213714.GA2507@x61.tchesoft.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110507012717.GA15854@x61.tchesoft.com>
 <1304733100.11874.33.camel@Joe-Laptop>
 <20110507173141.GA4204@x61.tchesoft.com>
 <1304791360.1738.6.camel@Joe-Laptop>
 <23896.1304803541@death>
In-Reply-To: <23896.1304803541@death>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Vosburgh <fubar@us.ibm.com>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>, Andy Gospodarek <andy@greyhouse.net>, shemminger@vyatta.com, netdev@vger.kernel.org, Nicolas Kaiser <nikai@nikai.net>

Howdy Jay,
On Sat, May 07, 2011 at 02:25:41PM -0700, Jay Vosburgh wrote:
> 	My preference would be to only remove the "silence compiler"
> comments if the possibility of silent misbehavior is also eliminated.
> For __ad_timer_to_ticks, that would mean either a default: case in the
> current arrangement, or something like what Joe suggests above.
> 
> 	If this is beyond the scope of what you, Rafeal, want to do,
> that's fine, but in that case leave the "silence" notes in place.

Yeah, re-factor that sort of code was beyond my intentions when I first
submit the patch. However, it is certainly feasible to be done, and as I wrote
before, I'm more than willing to help where is needed to help.
I'll review the places where "silence" notes are placed, and try to figure out a
proper way to get rid of them.

Thank you, folks, for keep hitting me with valuable feedback.

Cheers!
-- 
Rafael Aquini <aquini@linux.com>
