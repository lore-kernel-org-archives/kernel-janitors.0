From: Hariprasad S <hariprasad@chelsio.com>
Date: Wed, 12 Nov 2014 08:43:21 +0000
Subject: RE: cxgb4: Cleanup macros so they follow the same style and look consistent, part 2
Message-Id: <26E3F92EC670BD429DB5CB319D773C13C0C806@nice.asicdesigners.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141111130601.GC19962@mwanda>
In-Reply-To: <20141111130601.GC19962@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thanks Dan... I will send a patch ASAP which fixes it.
________________________________________
From: Dan Carpenter [dan.carpenter@oracle.com]
Sent: Tuesday, November 11, 2014 6:36 PM
To: Hariprasad S
Cc: kernel-janitors@vger.kernel.org
Subject: re: cxgb4: Cleanup macros so they follow the same style and look consistent, part 2

Hello Hariprasad Shenai,

The patch e2ac9628959c: "cxgb4: Cleanup macros so they follow the
same style and look consistent, part 2" from Nov 7, 2014, leads to
the following static checker warning:

        drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:5756 adap_init0()
        info: ignoring unreachable code.

drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
  5739                          if (ret < 0)
  5740                                  ret = adap_init0_no_config(adap, reset);
  5741                          else {
  5742                                  /*
  5743                                   * The firmware provides us with a memory
  5744                                   * buffer where we can load a Configuration
  5745                                   * File from the host if we want to override
  5746                                   * the Configuration File in flash.
  5747                                   */
  5748
  5749                                  ret = adap_init0_config(adap, reset);
  5750                                  if (ret = -ENOENT) {
  5751                                          dev_info(adap->pdev_dev,
  5752                                              "No Configuration File present "
  5753                                              "on adapter. Using hard-wired "
  5754                                              "configuration parameters.\n");
  5755                                          goto bye;
                                                ^^^^^^^^

This looks like it was added to the commit accidentally.  It creates
a new static checker warning.

  5756                                          ret = adap_init0_no_config(adap, reset);
  5757                                  }
  5758                          }

regards,
dan carpenter

