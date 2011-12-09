From: David Miller <davem@davemloft.net>
Date: Fri, 09 Dec 2011 00:54:30 +0000
Subject: Re: [patch] sock_diag: off by one checks
Message-Id: <20111208.195430.857245382290814411.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111208064938.GB16735@elgon.mountain>
	<4EE07E6B.5050608@parallels.com>
In-Reply-To: <4EE07E6B.5050608@parallels.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xemul@parallels.com
Cc: dan.carpenter@oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Pavel Emelyanov <xemul@parallels.com>
Date: Thu, 08 Dec 2011 13:07:55 +0400

> On 12/08/2011 10:49 AM, Dan Carpenter wrote:
>> These tests are off by one because sock_diag_handlers[] only has AF_MAX
>> elements.
> 
> Oops :(
> 
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Pavel Emelyanov <xemul@parallels.com>

Applied.
