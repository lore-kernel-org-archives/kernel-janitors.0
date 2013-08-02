From: Shaun Laing <Shaun@XResource.ca>
Date: Fri, 02 Aug 2013 13:11:17 +0000
Subject: Re: [patch] staging: comedi: gsc_hpdi plx9080: Resolve sparse "different base types" warnings.
Message-Id: <CAH1-EsZxGEv72QAoQUpDGX+Sq-Xm_sVMjmp_a6BRUNWKGy-=Tw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201308011744.r71HiFtV077932@rivendell.pollux.laing>
In-Reply-To: <201308011744.r71HiFtV077932@rivendell.pollux.laing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thank you, Dan.

> It feels like the ->dma_desc buffer is supposed to go to be used
> by the hardware but I don't see where that happens.  This driver
> looks like complete garbage.  We should re-write it completely.
> It's better to leave the static checker warnings there to mark that
> the driver needs to be re-written instead of silencing the warnings
> but not fixing the code.  Fixing the code proably means re-writing
> it to be CPU endian.

Ok -- I'll ditch this patch.

>> * Removes some spaces to elimite "checkpatch" warnings.
>
> I don't see any checkpatch warnings.  I assume you are talking about
> the indent changes here.
>
> The indenting was correct in the original and the patch is wrong.

So that I know for the future:  if I remove the indentation changes
'checkpatch' returns these warnings.  Should I ignore these in the
future?

WARNING: line over 80 characters
#15: FILE: drivers/staging/comedi/drivers/gsc_hpdi.c:444:
+                           (unsigned
long)le32_to_cpu(devpriv->dma_desc[i].next));

WARNING: line over 80 characters
#33: FILE: drivers/staging/comedi/drivers/gsc_hpdi.c:798:
+
le32_to_cpu(devpriv->dma_desc[devpriv->dma_desc_index].
