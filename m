From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Nov 2015 06:07:51 +0000
Subject: Re: [patch] bus: sunxi-rsb: unlock on error in sunxi_rsb_read()
Message-Id: <20151105060751.GL7289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151103220244.GA19280@mwanda>
In-Reply-To: <20151103220244.GA19280@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 04, 2015 at 10:22:35PM +0100, walter harms wrote:
> NTL one comment, if you looked it as success handling it may be uncommon
> but i you see it as "proctector" it is more obvious like
> if (f) free(f);

You shouldn't normally have those kinds of if statements because you
should handle the case of if "f" is NULL immediately.  It shouldn't be a
question of "I'm half way through the function and I don't know what has
been allocated and what is free."

If you have an if condition like that it probably means you are doing
One Err style error handling and we all know my feelings about that.  ;)

regards,
dan carpenter

