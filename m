From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jan 2016 22:20:24 +0000
Subject: Re: phy: micrel: Add ethtool statistics counters
Message-Id: <20160104222024.GT5177@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160104211545.GA9452@mwanda>
In-Reply-To: <20160104211545.GA9452@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Also:

drivers/net/phy/marvell.c:1037 marvell_get_stat() warn: unsigned 'val' is never less than zero.

regards,
dan carpenter
