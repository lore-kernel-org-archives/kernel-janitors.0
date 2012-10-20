From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 20 Oct 2012 03:46:39 +0000
Subject: Re: [patch] gpio-timberdale: fix a potential wrapping issue
Message-Id: <20121020034639.GU5685@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121011065635.GD31607@elgon.mountain>
 <CACRpkdZ0EfjMi8i9_bFYwscQVPCPGUFiJwv_FCTMfLbWwsUKZw@mail.gmail.com>
In-Reply-To: <CACRpkdZ0EfjMi8i9_bFYwscQVPCPGUFiJwv_FCTMfLbWwsUKZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 12, 2012 at 11:01:08PM +0200, Linus Walleij wrote:
> On Thu, Oct 11, 2012 at 8:56 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > ->last_ier is an unsigned long but the high bits can't be used int the
> > original code because the shift wraps.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Applied, thanks!
> Should we send this to stable? (I assume so ...)

This was a static checker fix.  I guess the answer would depend on
if there are over 30 IRQs.

regards,
dan carpenter

