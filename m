From: Anton Vorontsov <anton@enomsg.org>
Date: Sun, 06 Jan 2013 05:09:53 +0000
Subject: Re: [PATCH] drivers/power/88pm860x_battery.c: use devm_request_threaded_irq
Message-Id: <20130106050953.GH6919@lizard.sbx05280.losalca.wayport.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354986995-2324-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1354986995-2324-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

On Sat, Dec 08, 2012 at 06:16:35PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> devm_request_threaded_irq requests and irq that is freed when a driver
> detaches.  This patch uses devm_request_threaded_irq for irqs that are
> requested in the probe function of a platform device and are only freed in
> the remove function.
> 
> Additionally, the original code used devm_kzalloc, but kfree.  This would
> lead to a double free.  The problem was found using the following semantic
> match (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@
> expression x,e;
> @@
> x = devm_kzalloc(...)
> ... when != x = e
> ?-kfree(x,...);
> // </smpl>
> 
> The error handling code in the probe function is also simplified in the
> cases where there is now nothing to do other than return.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
[....]
> @@ -994,9 +989,6 @@ static int pm860x_battery_remove(struct platform_device *pdev)
>  	struct pm860x_battery_info *info = platform_get_drvdata(pdev);
>  
>  	power_supply_unregister(&info->battery);
> -	free_irq(info->irq_batt, info);
> -	free_irq(info->irq_cc, info);
> -	kfree(info);

It is not safe to access battery ('struct power_supply') object after
_unregister() (and irq handlers will surely do). Instead of removing
free_irq(), the right fix would be to place the two calls before
_unregister().

Thanks,
Anton

>  	platform_set_drvdata(pdev, NULL);
>  	return 0;
>  }
> 
> 
