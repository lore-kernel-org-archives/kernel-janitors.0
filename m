From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jul 2013 07:19:12 +0000
Subject: Re: [patch] rapidio: use after free in unregister function
Message-Id: <20130705071912.GY5714@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130705060231.GA14443@elgon.mountain>
 <51D67066.9070105@gmail.com>
In-Reply-To: <51D67066.9070105@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Mallon <rmallon@gmail.com>
Cc: Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alexandre.bounine@idt.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 05, 2013 at 05:06:14PM +1000, Ryan Mallon wrote:
> On 05/07/13 16:02, Dan Carpenter wrote:
> It looks like an mport_id can only be assigned to one scan entry (see
> rio_register_scan), so you can use list_for_each_entry and break; after
> the kfree(scan); instead.

Yeah.  You're right.  I'll resend.

regards,
dan carpenter

