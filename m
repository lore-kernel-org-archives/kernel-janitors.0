From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Oct 2014 17:01:07 +0000
Subject: re: defxx: DEFEA's ESIC port I/O decoding cleanup
Message-Id: <20141001170107.GA11786@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Maciej W. Rozycki,

The patch b98dfaf2b0a3: "defxx: DEFEA's ESIC port I/O decoding
cleanup" from Sep 25, 2014, leads to the following static checker
warning:

	drivers/net/fddi/defxx.c:741 dfx_bus_init()
	warn: odd binop '0x3 & 0xfffffffffffffffc'

drivers/net/fddi/defxx.c
   729                  val = PI_IO_CMP_M_SLOT;
   730                  outb(val, base_addr + PI_ESIC_K_IO_ADD_MASK_0_1);
   731                  val = (PI_ESIC_K_CSR_IO_LEN - 1) & ~3;
   732                  outb(val, base_addr + PI_ESIC_K_IO_ADD_MASK_0_0);
   733  
   734                  val = 0;
   735                  outb(val, base_addr + PI_ESIC_K_IO_ADD_CMP_1_1);
   736                  val = PI_DEFEA_K_BURST_HOLDOFF;
   737                  outb(val, base_addr + PI_ESIC_K_IO_ADD_CMP_1_0);
   738  
   739                  val = PI_IO_CMP_M_SLOT;
   740                  outb(val, base_addr + PI_ESIC_K_IO_ADD_MASK_1_1);
   741                  val = (PI_ESIC_K_BURST_HOLDOFF_LEN - 1) & ~3;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is just saying "val = 0" in a complicated way.  It's not clear what
was intended...

   742                  outb(val, base_addr + PI_ESIC_K_IO_ADD_MASK_1_0);
   743  

regards,
dan carpenter
