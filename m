From: Joe Perches <joe@perches.com>
Date: Mon, 18 May 2020 17:11:16 +0000
Subject: Re: [PATCH][next] i2c: mediatek: fix integer overflow on an integer multiplication
Message-Id: <06434e4d5980b17a1cacee80369087cbd7a8cbe0.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200518165529.57821-1-colin.king@canonical.com>
 <20200518165928.GA5109@ninjato>
In-Reply-To: <20200518165928.GA5109@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@kernel.org>, Colin King <colin.king@canonical.com>, qii.wang@mediatek.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org

On Mon, 2020-05-18 at 18:59 +0200, Wolfram Sang wrote:
> On Mon, May 18, 2020 at 05:55:29PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the calculation of sample_ns is using a 32 bit integer
> > multiplication and can potentially overflow. Fix this by making the
> > constant a long long to use a 64 bit multiply and hence
> > avoid an overflow.
> > 
> > Addresses-Coverity: ("Unintentional integer overflow")
> > Fixes: 5f1ae73d538a ("i2c: mediatek: Add i2c ac-timing adjust support")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> CCing the patch author.
> 
> > ---
> >  drivers/i2c/busses/i2c-mt65xx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index 702061805925..c93492b997ce 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -551,7 +551,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
> >  	const struct i2c_spec_values *spec;
> >  	unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
> >  	unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
> > -	long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;
> > +	long long sample_ns = (1000000000LL * (sample_cnt + 1)) / clk_src;

unsigned long long?
