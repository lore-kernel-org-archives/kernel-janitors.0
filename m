From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Apr 2020 13:56:08 +0000
Subject: [bug report] bus: mhi: core: Add support for data transfer
Message-Id: <20200407135608.GA109647@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407135559.GA109574@mwanda>
In-Reply-To: <20200407135559.GA109574@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Manivannan Sadhasivam,

The patch 189ff97cca53: "bus: mhi: core: Add support for data
transfer" from Feb 20, 2020, leads to the following static checker
warning:

	drivers/bus/mhi/core/main.c:1093 mhi_gen_tre()
	warn: bitwise AND condition is false here

drivers/bus/mhi/core/main.c
  1088  
  1089          ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
  1090          if (ret)
  1091                  return ret;
  1092  
  1093          eob = !!(flags & MHI_EOB);
                                 ^^^^^^^
This is zero.  Was BIT(0) intended?

  1094          eot = !!(flags & MHI_EOT);
  1095          chain = !!(flags & MHI_CHAIN);
  1096          bei = !!(mhi_chan->intmod);
  1097  
  1098          mhi_tre = tre_ring->wp;
  1099          mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);

regards,
dan carpenter
