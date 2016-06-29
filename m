From: David Miller <davem@davemloft.net>
Date: Wed, 29 Jun 2016 09:48:01 +0000
Subject: Re: [patch] qlcnic: use the correct ring in qlcnic_83xx_process_rcv_ring_diag()
Message-Id: <20160629.054801.713412217544385924.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160627205029.GA22095@mwanda>
In-Reply-To: <20160627205029.GA22095@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Dept-GELinuxNICDev@qlogic.com, sony.chacko@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jun 2016 23:50:29 +0300

> There is a static checker warning here "warn: mask and shift to zero"
> and the code sets "ring" to zero every time.  From looking at how
> QLCNIC_FETCH_RING_ID() is used in qlcnic_83xx_process_rcv_ring() the
> qlcnic_83xx_hndl() should be removed.
> 
> Fixes: 4be41e92f7c6 ('qlcnic: 83xx data path routines')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
