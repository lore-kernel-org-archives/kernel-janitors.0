From: David Miller <davem@davemloft.net>
Date: Sat, 06 Dec 2014 05:14:52 +0000
Subject: Re: [PATCH 1/1] net: cassini: Deletion of an unnecessary check before the function call "vfree"
Message-Id: <20141205.211452.873684925293554813.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5317A59D.4@users.sourceforge.net>
	<5479CD2A.9030009@users.sourceforge.net>
	<5479D2AD.9060704@users.sourceforge.net>
In-Reply-To: <5479D2AD.9060704@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 29 Nov 2014 15:05:33 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 29 Nov 2014 14:34:59 +0100
> 
> The vfree() function performs also input parameter validation.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
