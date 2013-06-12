From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 12 Jun 2013 15:33:42 +0000
Subject: Re: [PATCH] staging: tidspbridge: Fix potential NULL pointer dereference
Message-Id: <20130612153342.GA13788@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1371047595-11702-1-git-send-email-emilgoode@gmail.com>
 <20130612150817.GA12624@mwanda>
In-Reply-To: <20130612150817.GA12624@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: omar.ramirez@copitl.com, gregkh@linuxfoundation.org, justinmattock@gmail.com, andriy.shevchenko@linux.intel.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Thank you Dan! That's right, It's of course not NULL after freed.
Yes the code looks strange here, I'm not sure what was intended.

Best regards,

Emil

On Wed, Jun 12, 2013 at 08:08:17AM -0700, Dan Carpenter wrote:
> 1) This patch doesn't do anything.  "dcd_key" points to freed memory
> but it's not a NULL pointer.
> 2) The original pointer doesn't dereference "dcd_key" it just takes
> the address of one of the elements.  I don't know the context and
> can't say for sure that it's a wrong thing to do.
> 
> The code does look very suspect.  Why is it checking permisions
> after we already removed the element and freed it?
> 
> But it's not a dereferencing freed memory bug.
> 
> regards,
> dan carpenter
> 
