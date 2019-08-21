From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2019 07:26:31 +0000
Subject: [bug report] misc: xilinx_sdfec: Add ability to configure turbo
Message-Id: <20190821072631.GK26957@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Dragan Cvetic,

The patch 6f86ed820178: "misc: xilinx_sdfec: Add ability to configure
turbo" from Jul 27, 2019, leads to the following static checker
warning:

	drivers/misc/xilinx_sdfec.c:428 xsdfec_set_turbo()
	warn: 0xfff is larger than 8 bits

drivers/misc/xilinx_sdfec.c
   417
   418          if (turbo.alg >= XSDFEC_TURBO_ALG_MAX)
   419                  return -EINVAL;
   420
   421          if (turbo.scale > XSDFEC_TURBO_SCALE_MAX)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Here we ensure that turbo scale is a u8 which is <= 0xf.

   422                  return -EINVAL;
   423
   424          /* Check to see what device tree says about the FEC codes */
   425          if (xsdfec->config.code = XSDFEC_LDPC_CODE)
   426                  return -EIO;
   427
   428          turbo_write = ((turbo.scale & XSDFEC_TURBO_SCALE_MASK)
                                              ^^^^^^^^^^^^^^^^^^^^^^^
So this 0xfff is not required and sort of confusing.

   429                         << XSDFEC_TURBO_SCALE_BIT_POS) |
                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^
We shift it 8 bits.

   430                        turbo.alg;
   431          xsdfec_regwrite(xsdfec, XSDFEC_TURBO_ADDR, turbo_write);
   432          return err;
   433  }
   434
   435  static int xsdfec_get_turbo(struct xsdfec_dev *xsdfec, void __user *arg)
   436  {
   437          u32 reg_value;
   438          struct xsdfec_turbo turbo_params;
   439          int err;
   440
   441          if (xsdfec->config.code = XSDFEC_LDPC_CODE)
   442                  return -EIO;
   443
   444          memset(&turbo_params, 0, sizeof(turbo_params));
   445          reg_value = xsdfec_regread(xsdfec, XSDFEC_TURBO_ADDR);
   446
   447          turbo_params.scale = (reg_value & XSDFEC_TURBO_SCALE_MASK) >>
   448                               XSDFEC_TURBO_SCALE_BIT_POS;

Then, when we're reading it, we do (reg & 0xfff >> 8) so people would
think the result can be 0xff instead of just 0xf.

   449          turbo_params.alg = reg_value & 0x1;
   450
   451          err = copy_to_user(arg, &turbo_params, sizeof(turbo_params));
   452          if (err)
   453                  err = -EFAULT;
   454
   455          return err;
   456  }

regards,
dan carpenter
