From: David Miller <davem@davemloft.net>
Date: Mon, 16 Mar 2015 02:26:08 +0000
Subject: Re: [patch] isdn: icn: use strlcpy() when parsing setup options
Message-Id: <20150315.222608.153678214553500887.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150315104803.GA20691@mwanda>
In-Reply-To: <20150315104803.GA20691@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 15 Mar 2015 13:48:03 +0300

> If you pass an invalid string here then you probably deserve the memory
> corruption, but it annoys static analysis tools so lets fix it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
