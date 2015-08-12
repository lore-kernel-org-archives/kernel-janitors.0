From: David Miller <davem@davemloft.net>
Date: Wed, 12 Aug 2015 23:53:36 +0000
Subject: Re: [patch] cosa: missing error code on failure in probe()
Message-Id: <20150812.165336.2268773856388173453.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150812210800.GB8068@mwanda>
In-Reply-To: <20150812210800.GB8068@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: kas@fi.muni.cz, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Aug 2015 00:08:01 +0300

> If register_hdlc_device() fails, the current code returns 0 but we
> should return an error code instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
