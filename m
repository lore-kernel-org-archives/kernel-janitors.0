From: David Miller <davem@davemloft.net>
Date: Thu, 05 Nov 2015 03:06:30 +0000
Subject: Re: [patch -next] qlogic/qed: remove bogus NULL check
Message-Id: <20151104.220630.829229766192345475.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104132716.GD20966@mwanda>
In-Reply-To: <20151104132716.GD20966@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Yuval.Mintz@qlogic.com, Ariel.Elior@qlogic.com, everest-linux-l2@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 4 Nov 2015 16:27:16 +0300

> We check if "p_hwfn" is NULL and then dereference it in the error
> handling code.  I read the code and it isn't NULL so let's remove the
> check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
