From: David Miller <davem@davemloft.net>
Date: Tue, 25 Nov 2014 22:25:05 +0000
Subject: Re: [PATCH v2] net: Hyper-V: Deletion of an unnecessary check before the function call "vfree"
Message-Id: <20141125.172505.1865008364622013273.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <546DF9D7.6080801@users.sourceforge.net>
	<20141121.151503.1986113223309494197.davem@davemloft.net>
	<5474FAD6.4060704@users.sourceforge.net>
In-Reply-To: <5474FAD6.4060704@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: devel@linuxdriverproject.org, netdev@vger.kernel.org, haiyangz@microsoft.com, kys@microsoft.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Nov 2014 22:55:34 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 25 Nov 2014 22:33:45 +0100
> 
> The vfree() function performs also input parameter validation.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Signed-off-by: Haiyang Zhang <haiyangz@microsoft.com>

Applied, thanks.
