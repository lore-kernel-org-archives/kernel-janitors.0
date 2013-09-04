From: David Miller <davem@davemloft.net>
Date: Wed, 04 Sep 2013 04:54:19 +0000
Subject: Re: [patch] x25: add a sanity check parsing X.25 facilities
Message-Id: <20130904.005419.700065648971320112.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130903090340.GB4351@elgon.mountain>
In-Reply-To: <20130903090340.GB4351@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andrew.hendry@gmail.com, linux-x25@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 3 Sep 2013 12:03:40 +0300

> This was found with a manual audit and I don't have a reproducer.  We
> limit ->calling_len and ->called_len when we get them from
> copy_from_user() in x25_ioctl() so when they come from skb->data then
> we should cap them there as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
