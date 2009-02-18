From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:39:57 +0000
Subject: Re: [PATCH 27/43] drivers/net/sfc: fix sparse warnings: Should it
Message-Id: <20090217.173957.140516246.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214214111.24377.87888.stgit@vmbox.hanneseder.net>
	<20090216003718.GN15266@solarflare.com>
	<154e089b0902160138n255616a0xb963dfd990d912b@mail.gmail.com>
In-Reply-To: <154e089b0902160138n255616a0xb963dfd990d912b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: bhutchings@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 16 Feb 2009 10:38:26 +0100

> On Mon, Feb 16, 2009 at 1:37 AM, Ben Hutchings
> <bhutchings@solarflare.com> wrote:
> > This is wrong.  The entire file is conditional on CONFIG_SFC_MTD.
> 
> Even better than. It's actually not wrong, just done twice, so we can
> omit it, thank you Ben. I'll send an update.

Ok, I'll skip over this patch.
