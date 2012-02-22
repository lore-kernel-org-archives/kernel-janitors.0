From: David Miller <davem@davemloft.net>
Date: Wed, 22 Feb 2012 20:32:17 +0000
Subject: Re: [patch] hso: memsetting wrong data in hso_get_count()
Message-Id: <20120222.153217.1998630403338615530.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120222073024.GA7389@elgon.mountain>
In-Reply-To: <20120222073024.GA7389@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: j.dumon@option.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Feb 2012 10:30:25 +0300

> The intent was to clear out the icount struct here, but we accidentally
> clear stack memory instead.  It probably will lead to a NULL dereference
> right away.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks a lot Dan.
