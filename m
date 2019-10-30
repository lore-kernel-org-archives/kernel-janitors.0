From: John Stultz <john.stultz@linaro.org>
Date: Wed, 30 Oct 2019 16:21:41 +0000
Subject: Re: [PATCH][next] dma-buf: heaps: remove redundant assignment to variable ret
Message-Id: <CALAqxLVvkd73zQria9C+QcyF1P2cZ7=pOpVQO+AyWzqJQ_q3Yw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191030150253.10596-1-colin.king@canonical.com> <673b3e8f-9211-2fa2-c408-4560b03b4700@ti.com>
In-Reply-To: <673b3e8f-9211-2fa2-c408-4560b03b4700@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>
Cc: Colin King <colin.king@canonical.com>, Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, Brian Starkey <brian.starkey@arm.com>, linux-media@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, kernel-janitors@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Wed, Oct 30, 2019 at 8:45 AM Andrew F. Davis <afd@ti.com> wrote:
>
> On 10/30/19 11:02 AM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The variable ret is being assigned with a value that is never
> > read, it is being re-assigned the same value on the err0 exit
> > path. The assignment is redundant and hence can be removed.
> >
> > Addresses-Coverity: ("Unused value")
> > Fixes: 47a32f9c1226 ("dma-buf: heaps: Add system heap to dmabuf heaps")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
>
>
> The root of the issue is that ret is not used in the error path, it
> should be, I suggest this fix:
>
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -98,7 +98,7 @@ static int system_heap_allocate(struct dma_heap *heap,
> >  err0:
> >         kfree(helper_buffer);
> >
> > -       return -ENOMEM;
> > +       return ret;
> >  }

Sounds good! If its ok I'll generate a commit crediting Colin for
reporting the issue and Andrew for the fix and submit it to Sumit.

Many thanks to you both!
-john
