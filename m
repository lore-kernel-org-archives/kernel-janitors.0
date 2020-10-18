From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 18 Oct 2020 10:53:08 +0000
Subject: Re: [PATCH] hw_random : platform_get_irq() already prints an error
Message-Id: <alpine.DEB.2.22.394.2010181249280.2759@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201018054912.GA76941@fedora-thirty-three>
In-Reply-To: <20201018054912.GA76941@fedora-thirty-three>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This should also go to the maintainers of the file, which you can find
using the script scripts/get_maintainer.pl.

hw_random is not the right way to start the subject line for this file.
Use git log --oneline to see what others have done.

On Sun, 18 Oct 2020, Nigel Christian wrote:

> coccicheck
> drivers/char//hw_random/imx-rngc.c:256:2-9: line 256 is redundant because platform_get_irq() already prints an error

The log message should be limited to at most 75 columns, because when it
ends up in git it will be slightly indented.

The log message should explain what you are doing and why, not just repeat
the output of a tool.  In particular, the file and line number should not
be included in the log message, because that information is already
available in the changes below.

julia

> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/char/hw_random/imx-rngc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index 61c844baf26e..69f13ff1bbec 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -253,7 +253,6 @@ static int imx_rngc_probe(struct platform_device *pdev)
>
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq <= 0) {
> -		dev_err(&pdev->dev, "Couldn't get irq %d\n", irq);
>  		return irq;
>  	}
>
> --
> 2.28.0
>
>
