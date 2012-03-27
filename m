From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Mar 2012 07:39:15 +0000
Subject: Re: [patch] mISDN: array underflow in open_bchannel()
Message-Id: <20120327073915.GA4607@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120327072048.GC19008@elgon.mountain>
In-Reply-To: <20120327072048.GC19008@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 27, 2012 at 09:31:45AM +0200, walter harms wrote:
> 
> hi dan,
> short question: is is possible to make rq->adr.channel unsigned ?
> 

It is unsigned.  It's a u8.

regards,
dan carpenter

