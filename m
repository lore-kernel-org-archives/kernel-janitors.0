From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Oct 2012 07:35:46 +0000
Subject: Re: [patch] gpiolib: unlock on error in gpio_export()
Message-Id: <CACRpkdZPDZ_b=md7CXAc+tEkbdX1inw7eyQ4pZ2UdrW=S78vDQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121026065942.GB9284@elgon.mountain>
In-Reply-To: <20121026065942.GB9284@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Ryan Mallon <rmallon@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 26, 2012 at 8:59 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We need to unlock here before returning.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Only needed in linux-next.

Thanks Dan, applied to my devel branch.

Yours,
Linus Walleij
