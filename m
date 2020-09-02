From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 02 Sep 2020 11:04:27 +0000
Subject: Re: [PATCH] rpmsg: Avoid double-free in mtk_rpmsg_register_device()
Message-Id: <CANMq1KBJTpnYG59B1V=y_emqD3dtMZQAPY9bWJOC8FW2fNRgsA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9f4fb922-4aa3-0b63-6d81-c83daefd13b9@web.de>
In-Reply-To: <9f4fb922-4aa3-0b63-6d81-c83daefd13b9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kernel-janitors@vger.kernel.org, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>

On Wed, Sep 2, 2020 at 5:33 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > If rpmsg_register_device fails, it will call
> > mtk_rpmsg_release_device which already frees mdev.
>
> Can another imperative wording become helpful for the change description?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=9c7d619be5a002ea29c172df5e3c1227c22cbb41#n151

Looking at your posting history, I'll leave it up to the maintainer.

> …
> > +++ b/drivers/rpmsg/mtk_rpmsg.c
> > @@ -220,10 +220,8 @@  static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
> >       rpdev->dev.release = mtk_rpmsg_release_device;
> >
> >       ret = rpmsg_register_device(rpdev);
> > -     if (ret) {
> > -             kfree(mdev);
> > +     if (ret)
> >               return ret;
> > -     }
> >
> >       return 0;
> >  }
>
>
> * How do you think about to use the following code variant instead?
>
>         return rpmsg_register_device(rpdev);
>
> * Would you like to omit the variable “ret” for this function implementation?

That's a good suggestion, I'll update and send a v2.

>
> Regards,
> Markus
