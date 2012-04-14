From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Sat, 14 Apr 2012 19:06:02 +0000
Subject: Re: [patch] w1: w1_ds28e04: unlock on error path in w1_f1C_write_pio()
Message-Id: <20120414190602.GB6482@ioremap.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120413133906.GB26645@elgon.mountain>
In-Reply-To: <20120413133906.GB26645@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Markus Franke <franm@hrz.tu-chemnitz.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 13, 2012 at 04:39:06PM +0300, Dan Carpenter (dan.carpenter@oracle.com) wrote:
> We should unlock here before returning.

Looks good, thank you, Dan

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Greg, please pull it into your tree
Acked-by: Evgeniy Polyakov <zbr@ioremap.net>

-- 
	Evgeniy Polyakov
