From: David Miller <davem@davemloft.net>
Date: Mon, 23 May 2016 22:11:41 +0000
Subject: Re: [patch] qed: signedness bug in qed_dcbx_process_tlv()
Message-Id: <20160523.151141.2041940312643695129.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160523101935.GA10712@mwanda>
In-Reply-To: <20160523101935.GA10712@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Yuval.Mintz@qlogic.com, sudarsana.kalluru@qlogic.com, Ariel.Elior@qlogic.com, everest-linux-l2@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 May 2016 13:19:35 +0300

> "priority" needs to be signed for the error handling to work.
> 
> Fixes: 39651abd2814 ('qed: add support for dcbx.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
