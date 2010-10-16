From: David Miller <davem@davemloft.net>
Date: Sat, 16 Oct 2010 18:55:31 +0000
Subject: Re: [patch -next] pch_gbe: fix if condition in set_settings()
Message-Id: <20101016.115531.183030637.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101013093619.GC6060@bicker>
In-Reply-To: <20101013093619.GC6060@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, masa-korg@dsn.okisemi.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 13 Oct 2010 11:36:19 +0200

> There were no curly braces in this if condition so it always enabled full
> duplex.
> 
> And ecmd->speed is an unsigned short so it is never equal to -1.  The
> effect is that mii_ethtool_sset() fails with -EINVAL and an error is
> printed to dmesg.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
