From: Samuel Ortiz <sameo@linux.intel.com>
Date: Tue, 11 Sep 2012 16:11:24 +0000
Subject: Re: [PATCH] mfd: fix the warning of __devinitdata
Message-Id: <20120911161124.GV3647@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347372595-11370-1-git-send-email-haojian.zhuang@gmail.com>
In-Reply-To: <1347372595-11370-1-git-send-email-haojian.zhuang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Haojian,

On Tue, Sep 11, 2012 at 10:09:55PM +0800, Haojian Zhuang wrote:
> WARNING: drivers/built-in.o(.data+0x1e3c8): Section mismatch in
> reference from the variable bk_devs to the variable
> .devinit.data:bk0_resources
> The variable bk_devs references
> the variable __devinitdata bk0_resources
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the
> variable:
> *driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one,
> *_console
> 
> So add __devinitdata on bk_devs, led_devs & reg_devs.
> 
> Signed-off-by: Haojian Zhuang <haojian.zhuang@gmail.com>
> ---
>  drivers/mfd/88pm860x-core.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
Thanks for the quick fix, applied now.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
