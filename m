From: Joe Perches <joe@perches.com>
Date: Thu, 01 Aug 2013 16:32:42 +0000
Subject: Re: pktcdvd: add struct pktcdvd_device * to pkt_dbg
Message-Id: <1375374762.2034.53.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130801154452.GB5198@elgon.mountain>
In-Reply-To: <20130801154452.GB5198@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 2013-08-01 at 18:44 +0300, Dan Carpenter wrote:
> drivers/block/pktcdvd.c:2844 pkt_remove_dev()
> 	 error: we previously assumed 'pd' could be null (see line 2840)

Thanks Dan, I'll fix.

