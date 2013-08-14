From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Aug 2013 19:51:20 +0000
Subject: re: dmaengine: add interface of dma_get_slave_channel
Message-Id: <20130814195120.GA16390@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Zhangfei Gao,

The patch 7bb587f4eef8: "dmaengine: add interface of 
dma_get_slave_channel" from Jun 28, 2013, leads to the following 
warning: "drivers/dma/dmaengine.c:531 dma_get_slave_channel()
	 	error: potential NULL dereference 'chan'."

drivers/dma/dmaengine.c
   516  struct dma_chan *dma_get_slave_channel(struct dma_chan *chan)
   517  {
   518          int err = -EBUSY;
   519  
   520          /* lock against __dma_request_channel */
   521          mutex_lock(&dma_list_mutex);
   522  
   523          if (chan->client_count = 0)
   524                  err = dma_chan_get(chan);
   525          else
   526                  chan = NULL;
                        ^^^^^^^^^^^
   527  
   528          mutex_unlock(&dma_list_mutex);
   529  
   530          if (err)
   531                  pr_debug("%s: failed to get %s: (%d)\n",
   532                          __func__, dma_chan_name(chan), err);
                                                        ^^^^

Dereferenced here.

   533  
   534          return chan;

regards,
dan carpenter

