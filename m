From: "Bounine, Alexandre" <Alexandre.Bounine@idt.com>
Date: Fri, 05 Jul 2013 19:04:02 +0000
Subject: RE: [patch] rapidio: use after free in unregister function
Message-Id: <8D983423E7EDF846BB3056827B8CC5D14BC3AA91@corpmail1.na.ads.idt.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130705060231.GA14443@elgon.mountain>
 <51D67066.9070105@gmail.com> <20130705071912.GY5714@mwanda>
In-Reply-To: <20130705071912.GY5714@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ryan Mallon <rmallon@gmail.com>
Cc: Matt Porter <mporter@kernel.crashing.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Friday, July 05, 2013 3:19 AM
> To: Ryan Mallon
> Cc: Matt Porter; Bounine, Alexandre; linux-kernel@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: Re: [patch] rapidio: use after free in unregister function
> 
> On Fri, Jul 05, 2013 at 05:06:14PM +1000, Ryan Mallon wrote:
> > On 05/07/13 16:02, Dan Carpenter wrote:
> > It looks like an mport_id can only be assigned to one scan entry (see
> > rio_register_scan), so you can use list_for_each_entry and break;
> after
> > the kfree(scan); instead.
> 
> Yeah.  You're right.  I'll resend.
> 
> regards,
> dan carpenter

Thank you for catching it. Missed it because we have only one enumerator so far.

Alex.
