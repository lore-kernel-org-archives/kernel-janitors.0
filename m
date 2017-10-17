From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Oct 2017 08:49:19 +0000
Subject: Re: [PATCH 4/4] char/snsc: Delete unnecessary braces in five functions
Message-Id: <20171017084919.oa462je5y45otrw7@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbedda27-97e7-7b11-b888-39e09f7deaa1@users.sourceforge.net>
 <f9000a51-3629-bb5e-efd2-048200543793@users.sourceforge.net>
In-Reply-To: <f9000a51-3629-bb5e-efd2-048200543793@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Oct 16, 2017 at 05:07:29PM +0200, SF Markus Elfring wrote:
>  		/* ...or if we want to block, then do so here */
> -		if (down_interruptible(&sd->sd_wbs)) {
> +		if (down_interruptible(&sd->sd_wbs))
>  			/* something went wrong with wait */
>  			return -ERESTARTSYS;
> -		}
>  	}

Multi-line indents get parenthesis.

regards,
dan carpenter

