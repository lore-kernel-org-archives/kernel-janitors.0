From: Anton Vorontsov <anton@enomsg.org>
Date: Sun, 03 Feb 2013 03:34:45 +0000
Subject: Re: [patch] lp8727_charger: small cleanup in naming
Message-Id: <20130203033445.GD25016@lizard.sbx00618.mountca.wayport.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130125154350.GA5908@elgon.mountain>
In-Reply-To: <20130125154350.GA5908@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 28, 2013 at 01:56:13PM +0000, Kim, Milo wrote:
> > "pdata" and "pchg->pdata" are the same.  Changing the function call to
> > pdata->get_batt_present() makes it match the check and it's a little
> > cleaner.
> 
> Thanks!
> 
> Acked-by: Milo Kim <milo.kim@ti.com>

Applied, thanks!
