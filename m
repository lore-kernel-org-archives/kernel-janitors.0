From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Aug 2013 21:09:18 +0000
Subject: Re: [PATCH] net:ethernet:korina.c Removed IRQF_DISABLED
Message-Id: <20130808210918.GE5502@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375989649-7252-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1375989649-7252-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gaurav <kumargauravgupta3@gmail.com>
Cc: davem@davemloft.net, emilio@elopez.com.ar, mugunthanvnm@ti.com, jg1.han@samsung.com, hsweeten@visionengravers.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 09, 2013 at 12:50:49AM +0530, Kumar Gaurav wrote:
> Removed IRQF_DISABLED as it's no-op and should be removed
> 

What?  No, that doesn't sound right.

regards,
dan carpenter

