From: David Miller <davem@davemloft.net>
Date: Wed, 04 Sep 2013 04:54:13 +0000
Subject: Re: [patch] caif: add a sanity check to the tty name
Message-Id: <20130904.005413.1385684551140148010.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130903090232.GA4351@elgon.mountain>
In-Reply-To: <20130903090232.GA4351@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: dmitry.tarnyagin@lockless.no, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 3 Sep 2013 12:02:32 +0300

> "tty->name" and "name" are a 64 character buffers.  My static checker
> complains because we add the "cf" on the front so it look like we are
> copying a 66 character string into a 64 character buffer.
> 
> Also if the name is larger than IFNAMSIZ (16) it triggers a BUG_ON()
> inside the call to alloc_netdev().
> 
> This is all under CAP_SYS_ADMIN so it's not a security fix, it just adds
> a little robustness.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
