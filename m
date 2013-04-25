From: David Miller <davem@davemloft.net>
Date: Thu, 25 Apr 2013 05:49:11 +0000
Subject: Re: [patch] NFC: llcp: two bugs in ->getname()
Message-Id: <20130425.014911.738013858577867185.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130423062452.GD15893@elgon.mountain>
In-Reply-To: <20130423062452.GD15893@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: lauro.venancio@openbossa.org, aloisio.almeida@openbossa.org, sameo@linux.intel.com, linville@tuxdriver.com, thierry.escande@linux.intel.com, levinsasha928@gmail.com, linux-wireless@vger.kernel.org, linux-nfc@ml01.01.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Apr 2013 09:24:52 +0300

> The sockaddr_nfc_llcp struct has as hole between ->sa_family and
> ->dev_idx so I've added a memset() to clear it and prevent an
> information leak.
> 
> Also the ->nfc_protocol element wasn't set so I've added that.
> 
> "uaddr->sa_family" and "llcp_addr->sa_family" are the same thing but
> it's less confusing to use llcp_addr consistently throughout.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
