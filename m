From: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Date: Wed, 14 Aug 2013 07:18:47 +0000
Subject: Re: Configure DMA atributes?
Message-Id: <CAB=NE6UrZL21f8s_6g6eqLdRCGUXkHKbcu9ofjXUwiJWFQuSaQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+MoWDo8nhoomstYJx6Q5Krj-m=_swmpMu2iE5aHRH-gDf-QEQ@mail.gmail.com>
In-Reply-To: <CA+MoWDo8nhoomstYJx6Q5Krj-m=_swmpMu2iE5aHRH-gDf-QEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Mon, Aug 12, 2013 at 10:55 AM, Peter Senna Tschudin
<peter.senna@gmail.com> wrote:
> DMA_BIT_MASK(64)

That's the key here. From Documentation/DMA-API-HOWTO.txt :

------------------------------------------------------------------------------------------------
The standard 32-bit addressing device would do something like this:

        if (dma_set_mask(dev, DMA_BIT_MASK(32))) {
                printk(KERN_WARNING
                       "mydev: No suitable DMA available.\n");
                goto ignore_this_device;
        }

Another common scenario is a 64-bit capable device.  The approach here
is to try for 64-bit addressing, but back down to a 32-bit mask that
should not fail.  The kernel may fail the 64-bit mask not because the
platform is not capable of 64-bit addressing.  Rather, it may fail in
this case simply because 32-bit addressing is done more efficiently
than 64-bit addressing.  For example, Sparc64 PCI SAC addressing is
more efficient than DAC addressing.
------------------------------------------------------------------------------------------------

Hope that helps.

  Luis
