From: Joe Perches <joe@perches.com>
Date: Tue, 10 May 2011 02:11:38 +0000
Subject: Re: [PATCH] net/bonding: adjust codingstyle for bond_3ad files
Message-Id: <1304993498.19586.86.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110510000758.GA12728@x61.tchesoft.com>
	 <23511.1304992840@death>
In-Reply-To: <23511.1304992840@death>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Vosburgh <fubar@us.ibm.com>
Cc: aquini@linux.com, kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>, Andy Gospodarek <andy@greyhouse.net>, shemminger@vyatta.com, netdev@vger.kernel.org, Nicolas Kaiser <nikai@nikai.net>

On Mon, 2011-05-09 at 19:00 -0700, Jay Vosburgh wrote:
> {
> 	u32 bandwidth;
> 
> 	if (aggregator->num_of_ports) {
> 		switch (...) {
> 		case AD_LINK_SPEED_WHATEVER:
> 			bandwidth = something;
> 			break;
> 		default:
> 			pr_warn or WARN(1, ...);
> 			bandwidth = 0;
> 		}
> 		return bandwidth;
> 	}
> 	return 0;
> }

My preference is to return early and reduce indentation.

It can make things like pr_<foo> or WARN more likely to
fit on a single.

{
	int bandwidth;

	if (!aggregator->num_of_ports)
		return 0;

	switch (...) {
	case FOO:
		bandwidth = bar;
		break;
	...
	}

	return bandwidth;
}


