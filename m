From: David Miller <davem@davemloft.net>
Date: Wed, 25 Jan 2012 21:59:03 +0000
Subject: Re: [patch -next] bnx2x: unlock before returning an error
Message-Id: <20120125.165903.1769846144915753254.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120125075931.GA20199@elgon.mountain>
	<1327479294.11041.3.camel@lb-tlvb-dmitry>
In-Reply-To: <1327479294.11041.3.camel@lb-tlvb-dmitry>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitry@broadcom.com
Cc: dan.carpenter@oracle.com, eilong@broadcom.com, yuvalmin@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: "Dmitry Kravkov" <dmitry@broadcom.com>
Date: Wed, 25 Jan 2012 10:14:54 +0200

> On Wed, 2012-01-25 at 10:59 +0300, Dan Carpenter wrote:
>> We introduced a new return here but forgot to drop the lock.
>> 
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
 ...
> Acked-by: Dmitry Kravkov <dmitry@broadcom.com>

Applied, thanks.
