From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 21 Nov 2009 21:21:12 +0000
Subject: Re: [PATCH 7/8] drivers/dma: introduce missing kfree
Message-Id: <e9c3a7c20911211321x4f87f616ya6bf7561ff5748f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911211252180.23681@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911211252180.23681@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: maciej.sosnowski@intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>

On Sat, Nov 21, 2009 at 4:52 AM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Error handling code following a kzalloc should free the allocated data.
>

Yes, but there is another buglet here:

> =A0 =A0 =A0 =A0/* get platform data */
> =A0 =A0 =A0 =A0if (!pdev->dev.platform_data)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto shdev_err;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto platform_err;

"err" is still zero at this point so the probe does not fail.

How about the following instead?

diff --git a/drivers/dma/shdma.c b/drivers/dma/shdma.c
index b3b065c..034ecf0 100644
--- a/drivers/dma/shdma.c
+++ b/drivers/dma/shdma.c
@@ -640,17 +640,16 @@ static int __init sh_dmae_probe(struct
platform_device *pdev)
 #endif
        struct sh_dmae_device *shdev;

+       /* get platform data */
+       if (!pdev->dev.platform_data)
+               return -ENODEV;
+
        shdev =3D kzalloc(sizeof(struct sh_dmae_device), GFP_KERNEL);
        if (!shdev) {
                dev_err(&pdev->dev, "No enough memory\n");
-               err =3D -ENOMEM;
-               goto shdev_err;
+               return -ENOMEM;
        }

-       /* get platform data */
-       if (!pdev->dev.platform_data)
-               goto shdev_err;
-
        /* platform data */
        memcpy(&shdev->pdata, pdev->dev.platform_data,
                        sizeof(struct sh_dmae_pdata));
@@ -722,7 +721,6 @@ eirq_err:
 rst_err:
        kfree(shdev);

-shdev_err:
        return err;
 }
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
