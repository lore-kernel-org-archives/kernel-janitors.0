From: David Miller <davem@davemloft.net>
Date: Wed, 27 Jun 2012 22:26:39 +0000
Subject: Re: [patch -resend] 9p: fix min_t() casting in p9pdu_vwritef()
Message-Id: <20120627.152639.2113059689824053563.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda>
	<20120627090141.GF31212@elgon.mountain>
In-Reply-To: <20120627090141.GF31212@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ericvh@gmail.com, aneesh.kumar@linux.vnet.ibm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 12:01:41 +0300

> I don't think we're actually likely to hit this limit but if we do
> then the comparison should be done as size_t.  The original code
> is equivalent to:
>         len = strlen(sptr) % USHRT_MAX;
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
