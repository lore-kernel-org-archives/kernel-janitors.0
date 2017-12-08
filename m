From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Fri, 08 Dec 2017 19:52:36 +0000
Subject: Re: [PATCH] serial: max310x: Delete an error message for a failed =?iso-8859-1?Q?memory_allocation_i
Message-Id: <c5d3a5ff-5024-46fd-993c-05f18bada08b@cesnet.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4153838e-4796-537c-7b7f-98404d4f3481@users.sourceforge.net>
In-Reply-To: <4153838e-4796-537c-7b7f-98404d4f3481@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-serial@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On pátek 8. prosince 2017 20:00:34 CET, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 8 Dec 2017 19:53:10 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/tty/serial/max310x.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
> index ecb6513a6505..2aad36f402fd 100644
> --- a/drivers/tty/serial/max310x.c
> +++ b/drivers/tty/serial/max310x.c
> @@ -1102,10 +1102,8 @@ static int max310x_probe(struct device 
> *dev, struct max310x_devtype *devtype,
>  	/* Alloc port structure */
>  	s = devm_kzalloc(dev, sizeof(*s) +
>  			 sizeof(struct max310x_one) * devtype->nr, GFP_KERNEL);
> -	if (!s) {
> -		dev_err(dev, "Error allocating port structure\n");
> +	if (!s)
>  		return -ENOMEM;
> -	}
>  
>  	clk_osc = devm_clk_get(dev, "osc");
>  	clk_xtal = devm_clk_get(dev, "xtal");

I'm looking at this patch because I'm also making some modifications to 
this driver. This patch makes sense; other drivers also simply return 
ENOMEM. Tested on ARM, Armada 388; the "good" code path still obviously 
works :).

Reviewed-by: Jan Kundrát <jan.kundrat@cesnet.cz>
