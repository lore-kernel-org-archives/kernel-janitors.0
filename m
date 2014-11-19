From: David Miller <davem@davemloft.net>
Date: Wed, 19 Nov 2014 21:54:39 +0000
Subject: Re: [PATCH 1/1] mISDN: Deletion of unnecessary checks before the function call "vfree"
Message-Id: <20141119.165439.1170554636889327742.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<546CF5A6.3030305@users.sourceforge.net>
In-Reply-To: <546CF5A6.3030305@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Nov 2014 20:55:18 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 19 Nov 2014 20:48:26 +0100
> 
> The vfree() function performs also input parameter validation. Thus the test
> around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.
