From: David Miller <davem@davemloft.net>
Date: Thu, 05 Feb 2015 04:30:03 +0000
Subject: Re: [PATCH] NetCP: Deletion of unnecessary checks before two function calls
Message-Id: <20150204.203003.1536872523602316517.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<54D11FEF.10804@users.sourceforge.net>
In-Reply-To: <54D11FEF.10804@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: m-karicheri2@ti.com, w-kwok2@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 03 Feb 2015 20:22:23 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 3 Feb 2015 20:12:25 +0100
> 
> The functions cpsw_ale_destroy() and of_dev_put() test whether their argument
> is NULL and then return immediately. Thus the test around the call
> is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
