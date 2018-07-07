From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 07 Jul 2018 16:45:43 +0000
Subject: Re: [PATCH] iio: dac: remove redundant variable 'shift'
Message-Id: <20180707174543.1f67e22d@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702102435.16724-1-colin.king@canonical.com>
        <62141c55-575a-d068-360a-e0ea53df6f17@prevas.dk>
In-Reply-To: <62141c55-575a-d068-360a-e0ea53df6f17@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: Colin King <colin.king@canonical.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2 Jul 2018 12:43:20 +0200
Sean Nyekjær <sean.nyekjaer@prevas.dk> wrote:

> On 2018-07-02 12:24, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Variable shift is being assigned but is never used hence it is
> > redundant and can be removed.
> > 
> > Cleans up two clang warnings:
> > warning: variable ‘shift’ set but not used [-Wunused-but-set-variable]
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>  
> Reviewed-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
> 
> Good catch :-)
> 
> BR
> /Sean
Hi Colin,

As ever, thanks for the patch!

If you wouldn't mind putting the name of the driver in question in patches
like these that would be great.    There are enough drivers, that I doubt
anyone (other than me) looks at all patches for DACs.  They only look at
the particular parts they actually have on boards ;)

Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to play with it.

Thanks,

Jonathan


