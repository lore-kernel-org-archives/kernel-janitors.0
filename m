From: David Miller <davem@davemloft.net>
Date: Sat, 28 Feb 2015 17:59:40 +0000
Subject: Re: [patch -mainline] niu: fix error handling in niu_class_to_ethflow()
Message-Id: <20150228.125940.2141368511096709635.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150226165656.GB6820@mwanda>
In-Reply-To: <20150226165656.GB6820@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: benoit.taine@lip6.fr, fabf@skynet.be, bhelgaas@google.com, edumazet@google.com, alexander.h.duyck@redhat.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Feb 2015 19:56:56 +0300

> There is a discrepancy here because the niu_class_to_ethflow() returns
> zero on failure and one on success but the caller expected zero on
> success and negative on failure.
> 
> The problem means that we allow the user to pass classes and flow_types
> which we don't want.  I've looked at it a bit and I don't see it as a
> very serious bug.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
