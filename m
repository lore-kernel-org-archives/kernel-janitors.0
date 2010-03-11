From: Dan Carpenter <error27@gmail.com>
Date: Thu, 11 Mar 2010 10:33:29 +0000
Subject: ixgbevf: bug in error handling
Message-Id: <20100311103329.GO6321@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Rose <gregory.v.rose@intel.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Greg,

drivers/net/ixgbevf/ixgbevf_main.c +3013 ixgbevf_tx_map(96) warn: unsigned 'i' is never less than zero.
  3010          while (count >= 0) {
  3011                  count--;
  3012                  i--;
  3013                  if (i < 0)
  3014                          i += tx_ring->count;

	There is a problem here because i is unsigned and just wraps 
	around instead of being less than 0.

  3015                  tx_buffer_info = &tx_ring->tx_buffer_info[i];
  3016                  ixgbevf_unmap_and_free_tx_resource(adapter, tx_buffer_info);
  3017          }

regards,
dan carpenter
