From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Dec 2015 20:15:11 +0000
Subject: Re: [PATCH] ti-st: Use a signed return type for st_ll_sleep_state()
Message-Id: <20151219201511.GQ5284@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56758462.1020902@users.sourceforge.net>
In-Reply-To: <56758462.1020902@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

It returns zero or negative error codes.  The return value is never
checked.  Make it an int.

regards,
dan carpenter

