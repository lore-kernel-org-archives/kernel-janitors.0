From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Apr 2018 14:34:29 +0000
Subject: Re: [PATCH 03/61] auxdisplay: simplify getting .drvdata
Message-Id: <CANiq72kqcAom9QHG9fXNjDyuNC7_bh8ni6_vH0juaRdUVmf8pA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com> <20180419140641.27926-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Linus Walleij <triad@df.lth.se>

[CC'ing Linus W.]

On Thu, Apr 19, 2018 at 4:05 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Seems fine and other drivers in platform/ also call dev_get_drvdata
directly for this.

If Linus does not have anything against it, I will put it in my queue.

Thanks,
Miguel

> ---
>
> Build tested only. buildbot is happy. Please apply individually.
>
>  drivers/auxdisplay/arm-charlcd.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/auxdisplay/arm-charlcd.c b/drivers/auxdisplay/arm-charlcd.c
> index b3176ee92b90..26246ab7a066 100644
> --- a/drivers/auxdisplay/arm-charlcd.c
> +++ b/drivers/auxdisplay/arm-charlcd.c
> @@ -329,8 +329,7 @@ static int __init charlcd_probe(struct platform_device *pdev)
>
>  static int charlcd_suspend(struct device *dev)
>  {
> -       struct platform_device *pdev = to_platform_device(dev);
> -       struct charlcd *lcd = platform_get_drvdata(pdev);
> +       struct charlcd *lcd = dev_get_drvdata(dev);
>
>         /* Power the display off */
>         charlcd_4bit_command(lcd, HD_DISPCTRL);
> @@ -339,8 +338,7 @@ static int charlcd_suspend(struct device *dev)
>
>  static int charlcd_resume(struct device *dev)
>  {
> -       struct platform_device *pdev = to_platform_device(dev);
> -       struct charlcd *lcd = platform_get_drvdata(pdev);
> +       struct charlcd *lcd = dev_get_drvdata(dev);
>
>         /* Turn the display back on */
>         charlcd_4bit_command(lcd, HD_DISPCTRL | HD_DISPCTRL_ON);
> --
> 2.11.0
>
