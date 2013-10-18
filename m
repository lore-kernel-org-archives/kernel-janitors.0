From: David Miller <davem@davemloft.net>
Date: Fri, 18 Oct 2013 17:56:33 +0000
Subject: Re: [patch] ax25: cleanup a range test
Message-Id: <20131018.135633.1312926688041182414.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131018090656.GA23528@longonot.mountain>
In-Reply-To: <20131018090656.GA23528@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jreuter@yaina.de, ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Oct 2013 12:06:56 +0300

> The current test works fine in practice.  The "amount" variable is
> actually used as a boolean so negative values or any non-zero values
> count as "true".  However since we don't allow numbers greater than one,
> let's not allow negative numbers either.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks Dan.
