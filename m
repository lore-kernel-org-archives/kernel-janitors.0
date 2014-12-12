From: David Miller <davem@davemloft.net>
Date: Fri, 12 Dec 2014 20:31:21 +0000
Subject: Re: [PATCH 1/1] IDE: Deletion of an unnecessary check before the function call "module_put"
Message-Id: <20141212.153121.2126874023661472965.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<546F91E5.60104@users.sourceforge.net>
In-Reply-To: <546F91E5.60104@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Nov 2014 20:26:29 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 21 Nov 2014 20:22:32 +0100
> 
> The module_put() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
