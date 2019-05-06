From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 06 May 2019 12:23:29 +0000
Subject: Re: [PATCH] platform/x86: alienware-wmi: printing the wrong error code
Message-Id: <CAHp75Vcww6YbHcimpiYWV==9-CQzXjwsbVF+EOA3rKmdU4Wm9A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190424094417.GA15818@mwanda>
In-Reply-To: <20190424094417.GA15818@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Apr 24, 2019 at 3:43 PM <Mario.Limonciello@dell.com> wrote:
>
> >Fixes: bc2ef884320b ("alienware-wmi: For WMAX HDMI method, introduce a way to query HDMI cable status")
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to my review and testing queue, thanks!


> >---
> > drivers/platform/x86/alienware-wmi.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
> >index c0d1555735cd..83fd7677af24 100644
> >--- a/drivers/platform/x86/alienware-wmi.c
> >+++ b/drivers/platform/x86/alienware-wmi.c
> >@@ -587,7 +587,7 @@ static ssize_t show_hdmi_source(struct device *dev,
> >                        return scnprintf(buf, PAGE_SIZE,
> >                                         "input [gpu] unknown\n");
> >        }
> >-       pr_err("alienware-wmi: unknown HDMI source status: %d\n", out_data);
> >+       pr_err("alienware-wmi: unknown HDMI source status: %u\n", status);
> >        return scnprintf(buf, PAGE_SIZE, "input gpu [unknown]\n");
> > }
> >
> >--
> >2.18.0
>
> Yes, thanks.
> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
>


-- 
With Best Regards,
Andy Shevchenko
