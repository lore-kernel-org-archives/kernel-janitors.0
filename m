From: David Miller <davem@davemloft.net>
Date: Wed, 18 Jul 2012 16:42:16 +0000
Subject: Re: [patch] qlge: fix an "&&" vs "||" bug
Message-Id: <20120718.094216.1831661279784870636.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120712144702.GB24202@elgon.mountain>
	<5E4F49720D0BAD499EE1F01232234BA8774378FA29@AVEXMB1.qlogic.org>
In-Reply-To: <5E4F49720D0BAD499EE1F01232234BA8774378FA29@AVEXMB1.qlogic.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jitendra.kalsaria@qlogic.com
Cc: dan.carpenter@oracle.com, anirban.chakraborty@qlogic.com, ron.mercer@qlogic.com, Linux-Driver@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Jitendra Kalsaria <jitendra.kalsaria@qlogic.com>
Date: Thu, 12 Jul 2012 11:15:56 -0700

> -----Original Message-----
>>From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
>>Sent: Thursday, July 12, 2012 7:47 AM
>>To: Anirban Chakraborty
>>Cc: Jitendra Kalsaria; Ron Mercer; Dept-Eng Linux Driver; netdev; kernel-janitors@vger.kernel.org
>>Subject: [patch] qlge: fix an "&&" vs "||" bug
>>
>>The condition is always true so WOL will never work.
>>
>>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
...
> Acked-by: Jitendra Kalsaria <jitendra.kalsaria@qlogic.com>

Applied.
