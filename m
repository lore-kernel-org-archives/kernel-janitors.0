From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jan 2017 09:27:44 +0000
Subject: Re: [PATCH 18/18] mtd-cfi_cmdset_0020: Add some spaces for better code readability
Message-Id: <20170112092744.GB15314@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
 <0e5ee358-fb62-5d0b-81cf-d73a1a47f6d4@users.sourceforge.net>
In-Reply-To: <0e5ee358-fb62-5d0b-81cf-d73a1a47f6d4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jan 11, 2017 at 09:55:20PM +0100, SF Markus Elfring wrote:
> -	timeo = jiffies + (HZ*2);
> +	timeo = jiffies + HZ * 2;

You've done this a couple times already, but these parenthesis are there
to make the code more readable don't delete them.

regards,
dan carpenter

