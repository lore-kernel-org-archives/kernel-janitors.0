From: zhangfei <zhangfei.gao@linaro.org>
Date: Thu, 15 Aug 2013 01:29:18 +0000
Subject: Re: dmaengine: add interface of dma_get_slave_channel
Message-Id: <520C2EEE.7020406@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130814195120.GA16390@elgon.mountain>
In-Reply-To: <20130814195120.GA16390@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 13-08-15 03:51 AM, Dan Carpenter wrote:
> Hello Zhangfei Gao,
>
> The patch 7bb587f4eef8: "dmaengine: add interface of
> dma_get_slave_channel" from Jun 28, 2013, leads to the following
> warning: "drivers/dma/dmaengine.c:531 dma_get_slave_channel()
> 	 	error: potential NULL dereference 'chan'."
>
> drivers/dma/dmaengine.c
>     516  struct dma_chan *dma_get_slave_channel(struct dma_chan *chan)
>     517  {
>     518          int err = -EBUSY;
>     519
>     520          /* lock against __dma_request_channel */
>     521          mutex_lock(&dma_list_mutex);
>     522
>     523          if (chan->client_count = 0)
>     524                  err = dma_chan_get(chan);
>     525          else
>     526                  chan = NULL;
>                          ^^^^^^^^^^^
>     527
>     528          mutex_unlock(&dma_list_mutex);
>     529
>     530          if (err)
>     531                  pr_debug("%s: failed to get %s: (%d)\n",
>     532                          __func__, dma_chan_name(chan), err);
>                                                          ^^^^
>
> Dereferenced here.
>
>     533
>     534          return chan;
>
> regards,
> dan carpenter
>

Thanks Dan for point out.

I am sorry, make does not report such error here, is it config related.

Dear Vinod

Could I update this patch and resend to you?
Change to:
struct dma_chan *dma_get_slave_channel(struct dma_chan *chan)
{
         int err = -EBUSY;

         /* lock against __dma_request_channel */
         mutex_lock(&dma_list_mutex);

         if (chan->client_count = 0) {
                 err = dma_chan_get(chan);
                 if (err)
                         pr_debug("%s: failed to get %s: (%d)\n",
                                 __func__, dma_chan_name(chan), err);
         } else
                 chan = NULL;

         mutex_unlock(&dma_list_mutex);

         return chan;
}

Sorry for inconvenience.

Thanks


