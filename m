From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Oct 2017 14:21:44 +0000
Subject: [bug report] irqchip/gic-v3-its: Fix the incorrect parsing of VCPU table size
Message-Id: <20171026142016.mdgagjz7e6vjjadz@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Shanker Donthineni,

The patch 32bd44dc19de: "irqchip/gic-v3-its: Fix the incorrect
parsing of VCPU table size" from Oct 7, 2017, leads to the following
static checker warning:

	drivers/irqchip/irq-gic-v3-its.c:1706 its_alloc_tables()
	warn: missing break? reassigning 'indirect'

drivers/irqchip/irq-gic-v3-its.c
  1690          for (i = 0; i < GITS_BASER_NR_REGS; i++) {
  1691                  struct its_baser *baser = its->tables + i;
  1692                  u64 val = its_read_baser(its, baser);
  1693                  u64 type = GITS_BASER_TYPE(val);
  1694                  u32 order = get_order(psz);
  1695                  bool indirect = false;
  1696  
  1697                  switch (type) {
  1698                  case GITS_BASER_TYPE_NONE:
  1699                          continue;
  1700  
  1701                  case GITS_BASER_TYPE_DEVICE:
  1702                          indirect = its_parse_indirect_baser(its, baser,
  1703                                                              psz, &order,
  1704                                                              its->device_ids);

It doesn't make sense to save "indirect" here if we're just going to
write over it.  Probably there is a missing break statement.  Please
give me a Reported-by: tag when you send a fix.

  1705                  case GITS_BASER_TYPE_VCPU:
  1706                          indirect = its_parse_indirect_baser(its, baser,
  1707                                                              psz, &order,
  1708                                                              ITS_MAX_VPEID_BITS);
  1709                          break;
  1710                  }
  1711  
  1712                  err = its_setup_baser(its, baser, cache, shr, psz, order, indirect);
  1713                  if (err < 0) {
  1714                          its_free_tables(its);
  1715                          return err;
  1716                  }

regards,
dan carpenter
