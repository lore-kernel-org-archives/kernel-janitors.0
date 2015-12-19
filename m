From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Dec 2015 20:19:55 +0000
Subject: Re: [PATCH] staging-slicoss: Use a signed return type for slic_card_locate()
Message-Id: <20151219201955.GS5284@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5675B207.2010706@users.sourceforge.net>
In-Reply-To: <5675B207.2010706@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Christopher Harrer <charrer@alacritech.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lior Dotan <liodot@gmail.com>, devel@driverdev.osuosl.org, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

It returns zero or negative error codes.  The callers expect int.  It is
harmless.  It should just be int.

regards,
dan carpenter

