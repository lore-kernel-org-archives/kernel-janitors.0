From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 26 Sep 2012 17:01:04 +0000
Subject: drivers/media/rc/iguanair.c:276 iguanair_receiver() error: doing dma on the stack ((null))
Message-Id: <20120926170104.GC25467@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Sean,

FYI, there are new smatch warnings show up in

tree:   git://git.infradead.org/users/kmpark/linux-samsung commit-list
commit: 26ff63137c45886169ed102bddd6e90d6c27f00d [media] Add support for the IguanaWorks USB IR Transceiver

  drivers/media/rc/iguanair.c:211 iguanair_get_features() error: doing dma on the stack ((null))
  drivers/media/rc/iguanair.c:230 iguanair_get_features() error: doing dma on the stack ((null))
  drivers/media/rc/iguanair.c:249 iguanair_get_features() error: doing dma on the stack ((null))
+ drivers/media/rc/iguanair.c:276 iguanair_receiver() error: doing dma on the stack ((null))

vim +276 drivers/media/rc/iguanair.c
   260	
   261		if (len > 5 && ir->version[0] >= 4)
   262			ir->cycle_overhead = response.data[1];
   263	
   264	out:
   265		return rc;
   266	}
   267	
   268	static int iguanair_receiver(struct iguanair *ir, bool enable)
   269	{
   270		struct packet packet = { 0, DIR_OUT, enable ?
   271					CMD_RECEIVER_ON : CMD_RECEIVER_OFF };
   272		int rc;
   273	
   274		INIT_COMPLETION(ir->completion);
   275	
 > 276		rc = iguanair_send(ir, &packet, sizeof(packet), NULL, NULL);
   277		if (rc)
   278			return rc;
   279	
   280		wait_for_completion_timeout(&ir->completion, TIMEOUT);
   281	
   282		return 0;
   283	}
   284	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
