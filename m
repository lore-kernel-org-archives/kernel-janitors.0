From: David Miller <davem@davemloft.net>
Date: Fri, 25 Nov 2011 06:42:36 +0000
Subject: Re: [patch] net/netlabel: copy and paste bug in
Message-Id: <20111125.014236.1962174838825919249.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111124071820.GB14122@elgon.mountain>
In-Reply-To: <20111124071820.GB14122@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: paul@paul-moore.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 10:18:20 +0300

> This was copy and pasted from the IPv4 code.  We're calling the
> ip4 version of that function and map4 is NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
