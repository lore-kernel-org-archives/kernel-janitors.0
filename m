From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Sep 2010 21:12:57 +0000
Subject: Re: [patch] vxge: potential NULL dereference
Message-Id: <20100910211257.GI5959@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100910115423.GC5959@bicker> <20100910.133255.137830993.davem@davemloft.net>
In-Reply-To: <20100910.133255.137830993.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: ramkrishna.vepa@exar.com, sivakumar.subramani@exar.com, sreenivasa.honnur@exar.com, jon.mason@exar.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Sep 10, 2010 at 01:32:55PM -0700, David Miller wrote:
> So we can simply remove the first NULL check as this can never actually
> be NULL.

Ok.  Thanks, Dave.  I should have looked more into this myself.  I'll
send a patch to remove the check tomorrow.

regards,
dan carpenter

