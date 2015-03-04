From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Mar 2015 15:06:49 +0000
Subject: re: x86/intel/quark: Add Isolated Memory Regions for Quark X1000
Message-Id: <20150304150648.GA26187@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Bryan O'Donoghue,

The patch 28a375df16c2: "x86/intel/quark: Add Isolated Memory Regions
for Quark X1000" from Jan 30, 2015, leads to the following static
checker warning:

	arch/x86/platform/intel-quark/imr.c:229 imr_dbgfs_state_show()
	warn: should '(imr.addr_lo) << 8' be a 64 bit type?

arch/x86/platform/intel-quark/imr.c
   205  static int imr_dbgfs_state_show(struct seq_file *s, void *unused)
   206  {
   207          phys_addr_t base;
   208          phys_addr_t end;
   209          int i;
   210          struct imr_device *idev = s->private;
   211          struct imr_regs imr;
   212          size_t size;
   213          int ret = -ENODEV;
   214  
   215          mutex_lock(&idev->lock);
   216  
   217          for (i = 0; i < idev->max_imr; i++) {
   218  
   219                  ret = imr_read(idev, i, &imr);
   220                  if (ret)
   221                          break;
   222  
   223                  /*
   224                   * Remember to add IMR_ALIGN bytes to size to indicate the
   225                   * inherent IMR_ALIGN size bytes contained in the masked away
   226                   * lower ten bits.
   227                   */
   228                  if (imr_is_enabled(&imr)) {
   229                          base = imr_to_phys(imr.addr_lo);

The imr_to_phys() macro should probably include a cast to phys_addr_t if
only to silence the static checker warnings.

   230                          end = imr_to_phys(imr.addr_hi) + IMR_MASK;
   231                  } else {
   232                          base = 0;
   233                          end = 0;
   234                  }
   235                  size = end - base;
   236                  seq_printf(s, "imr%02i: base=%pa, end=%pa, size=0x%08zx "
   237                             "rmask=0x%08x, wmask=0x%08x, %s, %s\n", i,
   238                             &base, &end, size, imr.rmask, imr.wmask,
   239                             imr_is_enabled(&imr) ? "enabled " : "disabled",
   240                             imr.addr_lo & IMR_LOCK ? "locked" : "unlocked");
   241          }
   242  
   243          mutex_unlock(&idev->lock);
   244          return ret;
   245  }


regards,
dan carpenter
