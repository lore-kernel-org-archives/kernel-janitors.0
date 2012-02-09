From: Kyungmin Park <kyungmin.park@samsung.com>
Date: Thu, 09 Feb 2012 17:36:16 +0000
Subject: Re: [PATCH] drivers/media/video/s5p-tv/*_drv.c: use devm_ functions
Message-Id: <CAH9JG2Ws0OjO9yToUmTkpYXY9J9nuaThV1OGrxGAMJrfjRVmXQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328784311-27272-1-git-send-email-Julia.Lawall@lip6.fr>
 <1328784311-27272-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1328784311-27272-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

To Marek,
Please include this patch at next git pull request.

On Thu, Feb 9, 2012 at 7:45 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> The various devm_ functions allocate memory that is released when a driver
> detaches. =A0This patch uses these functions for data that is allocated in
> the probe function of a platform device and is only freed in the remove
> function.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
> =A0drivers/media/video/s5p-tv/hdmi_drv.c | =A0 30 ++++++++++-------------=
-------
> =A0drivers/media/video/s5p-tv/sdo_drv.c =A0| =A0 26 +++++++++------------=
-----
> =A02 files changed, 19 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/media/video/s5p-tv/hdmi_drv.c b/drivers/media/video/=
s5p-tv/hdmi_drv.c
> index 3e0dd09..6c21dc6 100644
> --- a/drivers/media/video/s5p-tv/hdmi_drv.c
> +++ b/drivers/media/video/s5p-tv/hdmi_drv.c
> @@ -875,7 +875,7 @@ static int __devinit hdmi_probe(struct platform_devic=
e *pdev)
>
> =A0 =A0 =A0 =A0dev_dbg(dev, "probe start\n");
>
> - =A0 =A0 =A0 hdmi_dev =3D kzalloc(sizeof(*hdmi_dev), GFP_KERNEL);
> + =A0 =A0 =A0 hdmi_dev =3D devm_kzalloc(&pdev->dev, sizeof(*hdmi_dev), GF=
P_KERNEL);
> =A0 =A0 =A0 =A0if (!hdmi_dev) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "out of memory\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENOMEM;
> @@ -886,7 +886,7 @@ static int __devinit hdmi_probe(struct platform_devic=
e *pdev)
>
> =A0 =A0 =A0 =A0ret =3D hdmi_resources_init(hdmi_dev);
> =A0 =A0 =A0 =A0if (ret)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_hdev;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
>
> =A0 =A0 =A0 =A0/* mapping HDMI registers */
> =A0 =A0 =A0 =A0res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -896,24 +896,26 @@ static int __devinit hdmi_probe(struct platform_dev=
ice *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail_init;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 hdmi_dev->regs =3D ioremap(res->start, resource_size(res));
> + =A0 =A0 =A0 hdmi_dev->regs =3D devm_ioremap(&pdev->dev, res->start,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 resource_size(res));
> =A0 =A0 =A0 =A0if (hdmi_dev->regs =3D NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "register mapping failed.\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENXIO;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_hdev;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> =A0 =A0 =A0 =A0if (res =3D NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "get interrupt resource faile=
d.\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENXIO;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_regs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_init;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 ret =3D request_irq(res->start, hdmi_irq_handler, 0, "hdmi"=
, hdmi_dev);
> + =A0 =A0 =A0 ret =3D devm_request_irq(&pdev->dev, res->start, hdmi_irq_h=
andler, 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"hdmi", hdmi=
_dev);
> =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "request interrupt failed.\n"=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_regs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_init;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0hdmi_dev->irq =3D res->start;
>
> @@ -924,7 +926,7 @@ static int __devinit hdmi_probe(struct platform_devic=
e *pdev)
> =A0 =A0 =A0 =A0ret =3D v4l2_device_register(NULL, &hdmi_dev->v4l2_dev);
> =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "could not register v4l2 devi=
ce.\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_irq;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_init;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0drv_data =3D (struct hdmi_driver_data *)
> @@ -969,18 +971,9 @@ static int __devinit hdmi_probe(struct platform_devi=
ce *pdev)
> =A0fail_vdev:
> =A0 =A0 =A0 =A0v4l2_device_unregister(&hdmi_dev->v4l2_dev);
>
> -fail_irq:
> - =A0 =A0 =A0 free_irq(hdmi_dev->irq, hdmi_dev);
> -
> -fail_regs:
> - =A0 =A0 =A0 iounmap(hdmi_dev->regs);
> -
> =A0fail_init:
> =A0 =A0 =A0 =A0hdmi_resources_cleanup(hdmi_dev);
>
> -fail_hdev:
> - =A0 =A0 =A0 kfree(hdmi_dev);
> -
> =A0fail:
> =A0 =A0 =A0 =A0dev_err(dev, "probe failed\n");
> =A0 =A0 =A0 =A0return ret;
> @@ -996,10 +989,7 @@ static int __devexit hdmi_remove(struct platform_dev=
ice *pdev)
> =A0 =A0 =A0 =A0clk_disable(hdmi_dev->res.hdmi);
> =A0 =A0 =A0 =A0v4l2_device_unregister(&hdmi_dev->v4l2_dev);
> =A0 =A0 =A0 =A0disable_irq(hdmi_dev->irq);
> - =A0 =A0 =A0 free_irq(hdmi_dev->irq, hdmi_dev);
> - =A0 =A0 =A0 iounmap(hdmi_dev->regs);
> =A0 =A0 =A0 =A0hdmi_resources_cleanup(hdmi_dev);
> - =A0 =A0 =A0 kfree(hdmi_dev);
> =A0 =A0 =A0 =A0dev_info(dev, "remove successful\n");
>
> =A0 =A0 =A0 =A0return 0;
> diff --git a/drivers/media/video/s5p-tv/sdo_drv.c b/drivers/media/video/s=
5p-tv/sdo_drv.c
> index 059e774..f6bca2c 100644
> --- a/drivers/media/video/s5p-tv/sdo_drv.c
> +++ b/drivers/media/video/s5p-tv/sdo_drv.c
> @@ -301,7 +301,7 @@ static int __devinit sdo_probe(struct platform_device=
 *pdev)
> =A0 =A0 =A0 =A0struct clk *sclk_vpll;
>
> =A0 =A0 =A0 =A0dev_info(dev, "probe start\n");
> - =A0 =A0 =A0 sdev =3D kzalloc(sizeof *sdev, GFP_KERNEL);
> + =A0 =A0 =A0 sdev =3D devm_kzalloc(&pdev->dev, sizeof *sdev, GFP_KERNEL);
> =A0 =A0 =A0 =A0if (!sdev) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "not enough memory.\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENOMEM;
> @@ -314,14 +314,14 @@ static int __devinit sdo_probe(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0if (res =3D NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "get memory resource failed.\=
n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENXIO;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_sdev;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 sdev->regs =3D ioremap(res->start, resource_size(res));
> + =A0 =A0 =A0 sdev->regs =3D devm_ioremap(&pdev->dev, res->start, resourc=
e_size(res));
> =A0 =A0 =A0 =A0if (sdev->regs =3D NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "register mapping failed.\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENXIO;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_sdev;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* acquiring interrupt */
> @@ -329,12 +329,13 @@ static int __devinit sdo_probe(struct platform_devi=
ce *pdev)
> =A0 =A0 =A0 =A0if (res =3D NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "get interrupt resource faile=
d.\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENXIO;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_regs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 ret =3D request_irq(res->start, sdo_irq_handler, 0, "s5p-sd=
o", sdev);
> + =A0 =A0 =A0 ret =3D devm_request_irq(&pdev->dev, res->start, sdo_irq_ha=
ndler, 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"s5p-sdo", s=
dev);
> =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "request interrupt failed.\n"=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_regs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0sdev->irq =3D res->start;
>
> @@ -343,7 +344,7 @@ static int __devinit sdo_probe(struct platform_device=
 *pdev)
> =A0 =A0 =A0 =A0if (IS_ERR_OR_NULL(sdev->sclk_dac)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "failed to get clock 'sclk_da=
c'\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENXIO;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail_irq;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fail;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0sdev->dac =3D clk_get(dev, "dac");
> =A0 =A0 =A0 =A0if (IS_ERR_OR_NULL(sdev->dac)) {
> @@ -415,12 +416,6 @@ fail_dac:
> =A0 =A0 =A0 =A0clk_put(sdev->dac);
> =A0fail_sclk_dac:
> =A0 =A0 =A0 =A0clk_put(sdev->sclk_dac);
> -fail_irq:
> - =A0 =A0 =A0 free_irq(sdev->irq, sdev);
> -fail_regs:
> - =A0 =A0 =A0 iounmap(sdev->regs);
> -fail_sdev:
> - =A0 =A0 =A0 kfree(sdev);
> =A0fail:
> =A0 =A0 =A0 =A0dev_info(dev, "probe failed\n");
> =A0 =A0 =A0 =A0return ret;
> @@ -439,9 +434,6 @@ static int __devexit sdo_remove(struct platform_devic=
e *pdev)
> =A0 =A0 =A0 =A0clk_put(sdev->dacphy);
> =A0 =A0 =A0 =A0clk_put(sdev->dac);
> =A0 =A0 =A0 =A0clk_put(sdev->sclk_dac);
> - =A0 =A0 =A0 free_irq(sdev->irq, sdev);
> - =A0 =A0 =A0 iounmap(sdev->regs);
> - =A0 =A0 =A0 kfree(sdev);
>
> =A0 =A0 =A0 =A0dev_info(&pdev->dev, "remove successful\n");
> =A0 =A0 =A0 =A0return 0;
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
