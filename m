From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 Jan 2016 15:04:50 +0000
Subject: re: add driver for enc28j60 ethernet chip
Message-Id: <20160129150449.GA20319@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Claudio Lanconelli,

The patch 3ec9c11da033: "add driver for enc28j60 ethernet chip" from
Jan 14, 2008, leads to the following static checker warning:

	drivers/net/ethernet/microchip/enc28j60.c:107 spi_read_buf()
	error: __memcpy() '&rx_buf[1]' too small (1517 vs 1518)

drivers/net/ethernet/microchip/enc28j60.c
    87  static int
    88  spi_read_buf(struct enc28j60_net *priv, int len, u8 *data)
    89  {
    90          u8 *rx_buf = priv->spi_transfer_buf + 4;
    91          u8 *tx_buf = priv->spi_transfer_buf;
    92          struct spi_transfer t = {
    93                  .tx_buf = tx_buf,
    94                  .rx_buf = rx_buf,
    95                  .len = SPI_OPLEN + len,
    96          };
    97          struct spi_message msg;
    98          int ret;
    99  
   100          tx_buf[0] = ENC28J60_READ_BUF_MEM;
   101          tx_buf[1] = tx_buf[2] = tx_buf[3] = 0;  /* don't care */
   102  
   103          spi_message_init(&msg);
   104          spi_message_add_tail(&t, &msg);
   105          ret = spi_sync(priv->spi, &msg);
   106          if (ret = 0) {
   107                  memcpy(data, &rx_buf[SPI_OPLEN], len);

The problem here is that len is sizeof(data) and sizeof(rx_buf), but we
are copying from the SPI_OPLEN (1) byte offset so we're copying beyond
the end of the array.

It's not clear what the correct thing to do is.

   108                  ret = msg.status;
   109          }
   110          if (ret && netif_msg_drv(priv))
   111                  printk(KERN_DEBUG DRV_NAME ": %s() failed: ret = %d\n",
   112                          __func__, ret);
   113  
   114          return ret;
   115  }

regards,
dan carpenter
