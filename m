From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Apr 2017 19:49:46 +0000
Subject: [bug report] net: stmmac: adding multiple buffers for rx
Message-Id: <20170412194946.GA28352@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Joao Pinto,

The patch 54139cf3bb33: "net: stmmac: adding multiple buffers for rx"
from Apr 6, 2017, leads to the following static checker warning:

	drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1274 init_dma_rx_desc_rings()
	warn: always true condition '(queue >= 0) => (0-u32max >= 0)'

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
  1270  
  1271          return 0;
  1272  
  1273  err_init_rx_buffers:
  1274          while (queue >= 0) {
                       ^^^^^^^^^^
This is harmless because of the break statement later, but slightly
annoying because of the static checker warning.

  1275                  while (--i >= 0)
  1276                          stmmac_free_rx_buffer(priv, queue, i);
  1277  
  1278                  if (queue = 0)
  1279                          break;
  1280  
  1281                  i = DMA_RX_SIZE;
  1282                  queue--;
  1283          }
  1284  
  1285          return ret;
  1286  }

regards,
dan carpenter
