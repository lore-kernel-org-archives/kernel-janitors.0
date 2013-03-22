From: David Miller <davem@davemloft.net>
Date: Fri, 22 Mar 2013 18:39:50 +0000
Subject: Re: [patch -next] l2tp: calling the ref() instead of deref()
Message-Id: <20130322.143950.1823890736719486695.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130322183314.GA23163@longonot.mountain>
In-Reply-To: <20130322183314.GA23163@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jchapman@katalix.com, tparkin@katalix.com, edumazet@google.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, kbuild@01.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Mar 2013 21:33:15 +0300

> This is a cut and paste typo.  We call ->ref() a second time instead
> of ->deref().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
