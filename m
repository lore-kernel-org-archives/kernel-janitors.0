From: David Miller <davem@davemloft.net>
Date: Tue, 09 Oct 2012 17:55:50 +0000
Subject: Re: [patch] farsync: fix support for over 30 cards
Message-Id: <20121009.135550.1463309187925495248.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121009072047.GB19159@elgon.mountain>
In-Reply-To: <20121009072047.GB19159@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: kevin.curtis@farsite.co.uk, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 9 Oct 2012 10:20:48 +0300

> We're trying to fill a 64 bit bitmap but only the lower 30 shifts work
> because the shift wraps around.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
