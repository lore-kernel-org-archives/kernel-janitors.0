From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 30 Apr 2010 04:59:44 +0000
Subject: Re: [PATCH] drivers/staging/comedi: dev_node removal
Message-Id: <h2v390803461004292159zf89f4f37k41ea71644ac39445@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1272258528.29373.7.camel@lenovo>
In-Reply-To: <1272258528.29373.7.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>
> This should go through the pcmcia tree, please do it that way.
>

Sure, do you want me to generate the patch against
git://git.kernel.org/pub/scm/linux/kernel/git/brodo/pcmcia-2.6.git?

I was looking and that tree doesn't seem to have a newer version of
the comedi driver. As a matter of fact it looks that a few style
issues have been resolved in the linux-next tree and are not in the
pcmcia tree.

For example:

./scripts/checkpatch.pl -f
pcmcia-2.6/drivers/staging/comedi/drivers/cb_das16_cs.c
total: 1 errors, 12 warnings, 894 lines checked

./scripts/checkpatch.pl -f
linux-next/drivers/staging/comedi/drivers/cb_das16_cs.c
total: 1 errors, 9 warnings, 894 lines checked

Thanks a lot

-----------------------------------
Javier Martinez Canillas
