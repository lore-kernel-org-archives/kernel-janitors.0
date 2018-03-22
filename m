From: David Miller <davem@davemloft.net>
Date: Thu, 22 Mar 2018 18:31:04 +0000
Subject: Re: [PATCH] macsec: missing dev_put() on error in macsec_newlink()
Message-Id: <20180322.143104.2174553329772161672.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180321080900.GA9826@mwanda>
In-Reply-To: <20180321080900.GA9826@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sd@queasysnail.net, dsahern@gmail.com, dwindsor@gmail.com, elena.reshetova@intel.com, Jason@zx2c4.com, mschiffer@universe-factory.net, johannes.berg@intel.com, felix.walter@cloudandheat.com, girish.moodalbail@oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Mar 2018 11:09:01 +0300

> We moved the dev_hold(real_dev); call earlier in the function but forgot
> to update the error paths.
> 
> Fixes: 0759e552bce7 ("macsec: fix negative refcnt on parent link")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied and queued up for -stable, thanks Dan.
