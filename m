From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:18:47 +0000
Subject: [bug report] mwifiex: add PCIe function level reset support
Message-Id: <20161012061847.GQ12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Amitkumar Karwar,

This is a semi-automatic email about new static checker warnings.

The patch 4c5dae59d2e9: "mwifiex: add PCIe function level reset 
support" from Jul 26, 2016, leads to the following Smatch complaint:

drivers/net/wireless/marvell/mwifiex/pcie.c:3098 mwifiex_pcie_down_dev()
	 warn: variable dereferenced before check 'card' (see line 3090)

drivers/net/wireless/marvell/mwifiex/pcie.c
  3089		struct pcie_service_card *card = adapter->card;
  3090		const struct mwifiex_pcie_card_reg *reg = card->pcie.reg;
                                                          ^^^^^^^^^^^^^^
New dereference.

  3091	
  3092		if (mwifiex_write_reg(adapter, reg->drv_rdy, 0x00000000))
  3093			mwifiex_dbg(adapter, ERROR, "Failed to write driver not-ready signature\n");
  3094	
  3095		adapter->seq_num = 0;
  3096		adapter->tx_buf_size = MWIFIEX_TX_DATA_BUF_SIZE_4K;
  3097	
  3098		if (card) {
                    ^^^^
New check is too late.

  3099			if (reg->sleep_cookie)
  3100				mwifiex_pcie_delete_sleep_cookie_buf(adapter);

regards,
dan carpenter
