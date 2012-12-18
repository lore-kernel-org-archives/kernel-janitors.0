From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Dec 2012 18:42:56 +0000
Subject: Re: [PATCH RESEND 0/6] Remove incorrect usage of IS_ERR_OR_NULL on clk_get
Message-Id: <20121218184256.GI5032@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
In-Reply-To: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Dec 19, 2012 at 06:34:02AM +1300, Tony Prisk wrote:
> Resend to include mailing lists.
> 
> As per the kernel docs, clk_get() cannot return NULL.
> 

It returns NULL if CONFIG_HAVE_CLK is disabled.

regards,
dan carpenter

