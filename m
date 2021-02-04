From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Feb 2021 10:58:37 +0000
Subject: Re: [PATCH RESEND] mfd: wm831x-auxadc: Prevent use after free in wm831x_auxadc_read_irq()
Message-Id: <20210204105837.GI20820@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210129143724.GX20820@kadam>
 <20210204103724.GC2789116@dell>
In-Reply-To: <20210204103724.GC2789116@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 04, 2021 at 10:37:24AM +0000, Lee Jones wrote:
> On Fri, 29 Jan 2021, Dan Carpenter wrote:
> 
> > The "req" struct is always added to the "wm831x->auxadc_pending" list,
> > but it's only removed from the list on the success path.  If a failure
> > occurs then the "req" struct is freed but it's still on the list,
> > leading to a use after free.
> > 
> > Fixes: 78bb3688ea18 ("mfd: Support multiple active WM831x AUXADC conversions")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  drivers/mfd/wm831x-auxadc.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Patchwork still can't find this.
> 
> I've applied it manually, thanks.

Ah...  You know what it is?  I normally use Mutt instead of
git-send-email.  Some of the patchworks have been hacked a bit to only
accept patches from git-send-email as a spam filtering method.  What I
do is my patch scripts add a header:

	X-Mailer: git-send-email haha only kidding

But because this was a resend, I didn't use my normal patch scripts and
just resent it from Mutt so it didn't have the header.  Something for me
to remember for next time I guess.

regards,
dan carpenter
