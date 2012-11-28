From: David Miller <davem@davemloft.net>
Date: Wed, 28 Nov 2012 16:38:54 +0000
Subject: Re: [patch] atm: forever loop loading ambassador firmware
Message-Id: <20121128.113854.810409435622014489.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121127172935.GB1059@elgon.mountain>
	<20121128104044.785f1041@thirdoffive.cmf.nrl.navy.mil>
In-Reply-To: <20121128104044.785f1041@thirdoffive.cmf.nrl.navy.mil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chas@cmf.nrl.navy.mil
Cc: dan.carpenter@oracle.com, dwmw2@infradead.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: chas williams - CONTRACTOR <chas@cmf.nrl.navy.mil>
Date: Wed, 28 Nov 2012 10:40:44 -0500

> On Tue, 27 Nov 2012 20:29:35 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
>> There was a forever loop introduced here when we converted this to
>> request_firmware() back in 2008.
>> 
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> This certainly does seem to be the case.
> 
> Acked-by: Chas Williams <chas@cmf.nrl.navy.mil>

Applied, thanks everyone.
