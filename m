From: David Miller <davem@davemloft.net>
Date: Fri, 15 Jun 2012 22:31:40 +0000
Subject: Re: [patch] qlcnic: off by one in qlcnic_init_pci_info()
Message-Id: <20120615.153140.145606090941949521.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120614183424.GC6383@elgon.mountain>
	<CC000197.32F56%anirban.chakraborty@qlogic.com>
In-Reply-To: <CC000197.32F56%anirban.chakraborty@qlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: anirban.chakraborty@qlogic.com
Cc: dan.carpenter@oracle.com, sony.chacko@qlogic.com, Linux-Driver@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Anirban Chakraborty <anirban.chakraborty@qlogic.com>
Date: Thu, 14 Jun 2012 21:03:14 -0700

> 
> 
> On 6/14/12 11:34 AM, "Dan Carpenter" <dan.carpenter@oracle.com> wrote:
> 
>>The adapter->npars[] array has QLCNIC_MAX_PCI_FUNC elements.  We
>>allocate it that way a few lines earlier in the function.  So this test
>>is off by one.
>>
>>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
 ...
> Acked-by: Anirban Chakraborty <anirban.chakraborty@qlogic.com>

Applied.
