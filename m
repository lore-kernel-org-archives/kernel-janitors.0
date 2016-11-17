From: Alan Tull <atull@opensource.altera.com>
Date: Thu, 17 Nov 2016 01:54:39 +0000
Subject: [PATCH 0/1] One bug fix for FPGA
Message-Id: <20161117015440.3113-1-atull@opensource.altera.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, delicious.quinoa@gmail.com, Alan Tull <atull@opensource.altera.com>

Hi Greg,

Can you take this patch?

Thanks,
Alan

Dan Carpenter (1):
  ARM: socfpga: checking the wrong variable

 drivers/fpga/altera-fpga2sdram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4

