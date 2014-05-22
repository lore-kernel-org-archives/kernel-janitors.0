From: David Miller <davem@davemloft.net>
Date: Thu, 22 May 2014 19:55:08 +0000
Subject: Re: [patch] ieee802154: missing put_dev() on error
Message-Id: <20140522.155508.1457164417698079548.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140522075306.GB4346@mwanda>
In-Reply-To: <20140522075306.GB4346@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: alex.bluesman.smirnov@gmail.com, dbaryshkov@gmail.com, linux-zigbee-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 May 2014 10:53:06 +0300

> We should call put_dev() on the error path here.
> 
> Fixes: 3e9c156e2c21 ('ieee802154: add netlink interfaces for llsec')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
