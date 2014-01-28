From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Jan 2014 21:04:28 +0000
Subject: re: qlcnic: Enhance logic to calculate msix vectors.
Message-Id: <20140128210428.GA20032@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Himanshu Madhani,

The patch cb9327d567be: "qlcnic: Enhance logic to calculate msix
vectors." from Jan 23, 2014, leads to the following
static checker warning:

	drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:678
	qlcnic_setup_tss_rss_intr() info: ignoring unreachable code."

drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
   669                  if (qlcnic_83xx_check(adapter))
   670                          num_msix += 1;
   671  
   672                  netdev_info(adapter->netdev,
   673                              "Restoring %d Tx, %d SDS rings for total %d vectors.\n",
   674                              adapter->drv_tx_rings, adapter->drv_sds_rings,
   675                              num_msix);
   676                  goto restore;
   677  
   678                  err = -EIO;
                        ^^^^^^^^^^
Should this be in front of the goto?

   679          }
   680  
   681          return err;
   682  }


regards,
dan carpenter

