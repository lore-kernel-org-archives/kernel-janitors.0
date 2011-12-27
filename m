From: Adam Jiang <jiang.adam@gmail.com>
Date: Tue, 27 Dec 2011 02:48:18 +0000
Subject: Re: devm_kfree
Message-Id: <CALK_+D35jwxsABqfQ7o0CEF+aDaDcccp8-q7RDEO_t4Pm_gNWg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324661974-17281-1-git-send-email-julia@diku.dk>
	<20111226120855.GB17760@sirena.org.uk>
	<alpine.DEB.2.02.1112261440450.1873@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1112261440450.1873@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

2011/12/26 Julia Lawall <julia.lawall@lip6.fr>:
> Is it reasonable to use devm_kfree in a probe function that fails or a
> remove function that succeeds?

I cannot catch your question. If the memory is allocated by
devm_kzalloc(), it is not necessary to release with devm_kfree() at
all. It would be release once the driver was detached or destroyed.

>
> Examples from drivers/watchdog/shwdt.c:
>
> sh_wdt_probe:
>
> =A0 =A0 =A0 =A0...
> =A0out_unreg:
> =A0 =A0 =A0 =A0unregister_reboot_notifier(&sh_wdt_notifier);
> =A0out_unmap:
> - =A0 =A0 =A0 devm_iounmap(&pdev->dev, wdt->base);
> =A0out_err:
> - =A0 =A0 =A0 devm_kfree(&pdev->dev, wdt);

It is necessary?

> =A0out_release:
> - =A0 =A0 =A0 devm_release_mem_region(&pdev->dev, res->start, resource_si=
ze(res));

It is necessary?

>
> =A0 =A0 =A0 =A0return rc;
> =A0}
>
>
> sh_wdt_remove:
>
> =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0unregister_reboot_notifier(&sh_wdt_notifier);
> =A0 =A0 =A0 =A0devm_release_mem_region(&pdev->dev, res->start, resource_s=
ize(res));
> =A0 =A0 =A0 =A0devm_iounmap(&pdev->dev, wdt->base);
> =A0 =A0 =A0 =A0devm_kfree(&pdev->dev, wdt);

These lines should be deleted if the driver has detached.

>
> =A0 =A0 =A0 =A0return 0;
> }
>
>
> On the other hand, perhaps devm_kfree is needed in probe function that
> succeeds, eg in drivers/input/keyboard/samsung-keypad.c:
>
> =A0 =A0 =A0 =A0if (pdev->dev.of_node) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0devm_kfree(&pdev->dev, (void *)pdata->keym=
ap_data->keymap);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0devm_kfree(&pdev->dev, (void *)pdata->keym=
ap_data);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0devm_kfree(&pdev->dev, (void *)pdata);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0return 0;
>
> julia
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
