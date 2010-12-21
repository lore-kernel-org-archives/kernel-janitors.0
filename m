From: David Miller <davem@davemloft.net>
Date: Tue, 21 Dec 2010 18:51:48 +0000
Subject: Re: [patch -next] bnx2x: remove bogus check
Message-Id: <20101221.105148.71131041.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101221070401.GF1936@bicker>
	<1292939316.21210.7084.camel@lb-tlvb-eilong.il.broadcom.com>
In-Reply-To: <1292939316.21210.7084.camel@lb-tlvb-eilong.il.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eilong@broadcom.com
Cc: error27@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: "Eilon Greenstein" <eilong@broadcom.com>
Date: Tue, 21 Dec 2010 15:48:36 +0200

> On Mon, 2010-12-20 at 23:04 -0800, Dan Carpenter wrote:
>> We dereferenced params on the line before so it's too late to check if
>> params is NULL.  In fact, params can never be NULL and strict_cos is
>> either 0 or 1 so that part of the check is bogus too.  Let's remove it.
>> 
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Thanks Dan!
> 
> Acked-by: Eilon Greenstein <eilong@broadcom.com>

Applied, thanks everyone.
