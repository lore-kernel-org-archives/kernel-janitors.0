From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 02 Feb 2020 16:25:02 +0000
Subject: Re: [PATCH][next] iio: st_sensors: handle memory allocation failure to fix null pointer dereference
Message-Id: <20200202162502.0ab50117@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200121161757.1498082-1-colin.king@canonical.com>
        <CACRpkdYzd13xu9ETj_a4eWrm4FMrVnF1NQ5G+=d_Ch=6SzRoxA@mail.gmail.com>
In-Reply-To: <CACRpkdYzd13xu9ETj_a4eWrm4FMrVnF1NQ5G+=d_Ch=6SzRoxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Colin King <colin.king@canonical.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio <linux-iio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, 23 Jan 2020 16:28:28 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Tue, Jan 21, 2020 at 5:18 PM Colin King <colin.king@canonical.com> wrote:
> 
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > A null pointer deference on pdata can occur if the allocation of
> > pdata fails.  Fix this by adding a null pointer check and handle
> > the -ENOMEM failure in the caller.
> >
> > Addresses-Coverity: ("Dereference null return value")  
> 
> That's a weirdo tag, but I suppose you have aligned with the maintainers
> about this.
> 
> > Fixes: 3ce85cc4fbb7 ("iio: st_sensors: get platform data from device tree")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>  
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

> 
> Yours,
> Linus Walleij
