From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 05 Jun 2015 10:12:48 +0000
Subject: Re: [PATCH] mfd: 88pm80x: refine irq bit operation
Message-Id: <20150605101248.GC7058@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1431688217-6960-1-git-send-email-zhouqiao@marvell.com>
In-Reply-To: <1431688217-6960-1-git-send-email-zhouqiao@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, 05 Jun 2015, zhouqiao wrote:
> On 05/15/2015 07:10 PM, Qiao Zhou wrote:
> >Set_bit/clear_bit for wu_flag may be corrupted if irq > 5(or 6 for
> >aarch64). The maximum irq number from 88pm80x chip series is 24.
> >Here we refine the code to protect the potential memory corruption.
> >
> >Also change wu_flag to wakeup_flag for easier understanding.
> >
> >Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >Signed-off-by: Qiao Zhou <zhouqiao@marvell.com>
> >---
> >  drivers/mfd/88pm80x.c       |    4 ++--
> >  include/linux/mfd/88pm80x.h |   19 ++++++++++++++++---
> >  2 files changed, 18 insertions(+), 5 deletions(-)
> >
> >diff --git a/drivers/mfd/88pm80x.c b/drivers/mfd/88pm80x.c
> >index 5e72f65..e1d803a 100644
> >--- a/drivers/mfd/88pm80x.c
> >+++ b/drivers/mfd/88pm80x.c
> >@@ -136,7 +136,7 @@ static int pm80x_suspend(struct device *dev)
> >  	struct i2c_client *client =3D container_of(dev, struct i2c_client, de=
v);
> >  	struct pm80x_chip *chip =3D i2c_get_clientdata(client);
> >-	if (chip && chip->wu_flag)
> >+	if (chip && chip->wakeup_flag)
> >  		if (device_may_wakeup(chip->dev))
> >  			enable_irq_wake(chip->irq);
> >@@ -148,7 +148,7 @@ static int pm80x_resume(struct device *dev)
> >  	struct i2c_client *client =3D container_of(dev, struct i2c_client, de=
v);
> >  	struct pm80x_chip *chip =3D i2c_get_clientdata(client);
> >-	if (chip && chip->wu_flag)
> >+	if (chip && chip->wakeup_flag)
> >  		if (device_may_wakeup(chip->dev))
> >  			disable_irq_wake(chip->irq);
> >diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.h
> >index 97cb283..1bca7eb 100644
> >--- a/include/linux/mfd/88pm80x.h
> >+++ b/include/linux/mfd/88pm80x.h
> >@@ -276,6 +276,9 @@ enum {
> >  #define PM805_EARPHONE_SETTING			(0x29)
> >  #define PM805_AUTO_SEQ_SETTING			(0x2A)
> >+/* supported 24 sub-irq */
> >+#define PM80x_MAX_IRQ			24
> >+
> >  struct pm80x_rtc_pdata {
> >  	int		vrtc;
> >  	int		rtc_wakeup;
> >@@ -301,7 +304,7 @@ struct pm80x_chip {
> >  	int type;
> >  	int irq;
> >  	int irq_mode;
> >-	unsigned long wu_flag;
> >+	unsigned long wakeup_flag;
> >  	spinlock_t lock;
> >  };
> >@@ -348,8 +351,13 @@ static inline int pm80x_dev_suspend(struct device *=
dev)
> >  	struct pm80x_chip *chip =3D dev_get_drvdata(pdev->dev.parent);
> >  	int irq =3D platform_get_irq(pdev, 0);
> >+	if (irq < 0 || irq >=3D PM80x_MAX_IRQ) {
> >+		dev_err(dev, "Invalid irq %d\n", irq);
> >+		return 0;
> >+	}
> >+
> >  	if (device_may_wakeup(dev))
> >-		set_bit((1 << irq), &chip->wu_flag);
> >+		set_bit(irq, &chip->wakeup_flag);
> >  	return 0;
> >  }
> >@@ -360,8 +368,13 @@ static inline int pm80x_dev_resume(struct device *d=
ev)
> >  	struct pm80x_chip *chip =3D dev_get_drvdata(pdev->dev.parent);
> >  	int irq =3D platform_get_irq(pdev, 0);
> >+	if (irq < 0 || irq >=3D PM80x_MAX_IRQ) {
> >+		dev_err(dev, "Invalid irq %d\n", irq);
> >+		return 0;
> >+	}
> >+
> >  	if (device_may_wakeup(dev))
> >-		clear_bit((1 << irq), &chip->wu_flag);
> >+		clear_bit(irq, &chip->wakeup_flag);
> >  	return 0;
> >  }
> Hi Dan, Jones

Dan and Lee.

> could you help to review this patch?

Hmm... I have this in my inbox, but I missed it.

Reviewing now.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
