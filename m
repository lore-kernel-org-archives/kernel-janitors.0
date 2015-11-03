From: David Miller <davem@davemloft.net>
Date: Tue, 03 Nov 2015 18:31:07 +0000
Subject: Re: [PATCH] irda: Delete an unnecessary check before the function call "irlmp_unregister_service"
Message-Id: <20151103.133107.8373482880165720.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<5638EF52.7030300@users.sourceforge.net>
In-Reply-To: <5638EF52.7030300@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: samuel@sortiz.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Nov 2015 18:30:58 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 3 Nov 2015 18:18:37 +0100
> 
> The irlmp_unregister_service() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
