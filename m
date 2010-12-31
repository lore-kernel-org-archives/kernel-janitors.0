From: David Miller <davem@davemloft.net>
Date: Fri, 31 Dec 2010 19:11:47 +0000
Subject: Re: [patch] USB: cdc_ether: remove unneeded check
Message-Id: <20101231.111147.260086991.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101225222341.GS1936@bicker>
In-Reply-To: <20101225222341.GS1936@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: oliver@neukum.name, gregkh@suse.de, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sun, 26 Dec 2010 01:23:42 +0300

> We already verified that "dev->udev->actconfig->extralen" was non-zero
> so "len" is non-zero here as well.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks.
