From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Oct 2015 19:57:10 +0000
Subject: Re: [patch] igbvf: integer overflow in igbvf_change_mtu()
Message-Id: <20151022195710.GY7289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151022091013.GC9202@mwanda>
In-Reply-To: <20151022091013.GC9202@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Yeah, there is an integer overflow before we check but so far as I can
see it is harmless.  The kernel is full of harmless integer overflows.
I sort of feel like this is the simplest way to write it and the other
ways feel over engineered and unweildy.

Care to propose a patch, though?

regards,
dan carpenter

