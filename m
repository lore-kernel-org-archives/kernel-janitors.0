From: David Miller <davem@davemloft.net>
Date: Mon, 09 May 2016 03:32:08 +0000
Subject: Re: [patch] qede: uninitialized variable in qede_start_xmit()
Message-Id: <20160508.233208.1239185600962622193.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160505132130.GE3038@mwanda>
In-Reply-To: <20160505132130.GE3038@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Yuval.Mintz@qlogic.com, Ariel.Elior@qlogic.com, everest-linux-l2@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 5 May 2016 16:21:30 +0300

> "data_split" was never set to false.  It's just uninitialized.
> 
> Fixes: 2950219d87b0 ('qede: Add basic network device support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
