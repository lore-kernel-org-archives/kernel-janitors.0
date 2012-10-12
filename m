From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Oct 2012 21:01:08 +0000
Subject: Re: [patch] gpio-timberdale: fix a potential wrapping issue
Message-Id: <CACRpkdZ0EfjMi8i9_bFYwscQVPCPGUFiJwv_FCTMfLbWwsUKZw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121011065635.GD31607@elgon.mountain>
In-Reply-To: <20121011065635.GD31607@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Oct 11, 2012 at 8:56 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> ->last_ier is an unsigned long but the high bits can't be used int the
> original code because the shift wraps.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
Should we send this to stable? (I assume so ...)

Yours,
Linus Walleij
