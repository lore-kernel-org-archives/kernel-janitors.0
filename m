From: David Miller <davem@davemloft.net>
Date: Tue, 20 Jan 2015 00:45:37 +0000
Subject: Re: [patch] s2io: use snprintf() as a safety feature
Message-Id: <20150119.194537.2076072305947176887.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150119193451.GB32634@mwanda>
In-Reply-To: <20150119193451.GB32634@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jdmason@kudzu.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Jan 2015 22:34:51 +0300

> "sp->desc[i]" has 25 characters.  "dev->name" has 15 characters.  If we
> used all 15 characters then the sprintf() would overflow.
> 
> I changed the "sprintf(sp->name, "%s Neterion %s"" to snprintf(), as
> well, even though it can't overflow just to be consistent.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
