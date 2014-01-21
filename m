From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jan 2014 08:43:17 +0000
Subject: Re: [patch] ARM: mvebu: checking for IS_ERR() instead of NULL
Message-Id: <20140121084317.GI4815@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140121065216.GA31535@elgon.mountain>
 <52DE2EB0.9010206@free-electrons.com>
In-Reply-To: <52DE2EB0.9010206@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Tue, Jan 21, 2014 at 09:24:16AM +0100, Gregory CLEMENT wrote:
> On 21/01/2014 07:52, Dan Carpenter wrote:
> > of_iomap() returns NULL on error, it doesn't return error pointers.
> >
> 
> Hi Dan,
> 
> Thanks for your patch but I already sent this fix yesterday and Jason have
> applied. See: http://thread.gmane.org/gmane.linux.ports.arm.kernel/295642
> 

Cool.  Congrats to Ezequiel on his new corporate email address.  :)

regards,
dan carpenter



