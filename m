From: David Miller <davem@davemloft.net>
Date: Fri, 03 Jul 2015 16:28:04 +0000
Subject: Re: [PATCH] net-ipv6: Delete an unnecessary check before the function call "free_percpu"
Message-Id: <20150703.092804.2186056253816861418.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<55954E1F.6090205@users.sourceforge.net>
In-Reply-To: <55954E1F.6090205@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, jmorris@namei.org, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 02 Jul 2015 16:43:43 +0200

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 2 Jul 2015 16:30:24 +0200
> 
> The free_percpu() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
