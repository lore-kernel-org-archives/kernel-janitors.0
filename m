From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jun 2013 15:08:17 +0000
Subject: Re: [PATCH] staging: tidspbridge: Fix potential NULL pointer dereference
Message-Id: <20130612150817.GA12624@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1371047595-11702-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1371047595-11702-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: omar.ramirez@copitl.com, gregkh@linuxfoundation.org, justinmattock@gmail.com, andriy.shevchenko@linux.intel.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

1) This patch doesn't do anything.  "dcd_key" points to freed memory
but it's not a NULL pointer.
2) The original pointer doesn't dereference "dcd_key" it just takes
the address of one of the elements.  I don't know the context and
can't say for sure that it's a wrong thing to do.

The code does look very suspect.  Why is it checking permisions
after we already removed the element and freed it?

But it's not a dereferencing freed memory bug.

regards,
dan carpenter

