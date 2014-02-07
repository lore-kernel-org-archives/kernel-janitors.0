From: David Miller <davem@davemloft.net>
Date: Fri, 07 Feb 2014 04:40:07 +0000
Subject: Re: [patch] isdn/hisax: hex vs decimal typo in prfeatureind()
Message-Id: <20140206.204007.2254644541681384666.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140206080308.GB26661@elgon.mountain>
In-Reply-To: <20140206080308.GB26661@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, akpm@linux-foundation.org, keescook@chromium.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 6 Feb 2014 11:03:08 +0300

> This is a static checker fix, but judging from the context then I think
> hexidecimal 0x80 is intended here instead of decimal 80.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
