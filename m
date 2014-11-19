From: David Miller <davem@davemloft.net>
Date: Wed, 19 Nov 2014 20:28:01 +0000
Subject: Re: [PATCH 1/1] netlink: Deletion of an unnecessary check before the function call "__module_get"
Message-Id: <20141119.152801.1458359057740370487.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<546BA747.6000703@users.sourceforge.net>
In-Reply-To: <546BA747.6000703@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Nov 2014 21:08:39 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 18 Nov 2014 21:03:13 +0100
> 
> The __module_get() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.
