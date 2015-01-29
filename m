From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Jan 2015 17:14:48 +0000
Subject: re: csiostor:T5 Firmware fix and cleanup.
Message-Id: <20150129171448.GA30639@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Praveen Madhavan,

The patch 216ce69c7ff5: "csiostor:T5 Firmware fix and cleanup." from
Jan 27, 2015, leads to the following static checker warning:

	drivers/scsi/csiostor/csio_hw.c:1780 csio_hw_use_fwconfig()
	warn: missing error code here? 'csio_hw_validate_caps()' failed.

drivers/scsi/csiostor/csio_hw.c
  1776          }
  1777  
  1778          /* Validate device capabilities */
  1779          if (csio_hw_validate_caps(hw, mbp))

We should probably preserve the error code here instead of returning
success.

  1780                  goto bye;
  1781          /*

regards,
dan carpenter
