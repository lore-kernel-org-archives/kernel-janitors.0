From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Wed, 18 Apr 2012 07:15:16 +0000
Subject: Re: [patch] target/iscsi: cleanup some allocation style issues
Message-Id: <1334733316.15333.5.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120417063359.GF26756@elgon.mountain>
In-Reply-To: <20120417063359.GF26756@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2012-04-17 at 09:33 +0300, Dan Carpenter wrote:
> We can use kcalloc() here instead of kzalloc().  It's better style and
> it has overflow checking built in.
> 
> Also -ENOMEM is the correct error code for allocation errors.  -1 means
> -EPERM.  None of the callers preserve the error codes so it doesn't
> matter except as a cleanup.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Also applied to lio-core.  I'll make sure to include these into the next
target-pending update.

Thanks Dan!

--nab

