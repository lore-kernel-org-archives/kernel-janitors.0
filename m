From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Thu, 08 Aug 2013 21:11:40 +0000
Subject: Re: [PATCH] net:ethernet:korina.c Removed IRQF_DISABLED
Message-Id: <5204098C.9010402@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375989649-7252-1-git-send-email-kumargauravgupta3@gmail.com> <20130808210918.GE5502@mwanda>
In-Reply-To: <20130808210918.GE5502@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kumar Gaurav <kumargauravgupta3@gmail.com>, davem@davemloft.net, emilio@elopez.com.ar, mugunthanvnm@ti.com, jg1.han@samsung.com, hsweeten@visionengravers.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/09/2013 01:09 AM, Dan Carpenter wrote:

>> Removed IRQF_DISABLED as it's no-op and should be removed

> What?  No, that doesn't sound right.

    How about reading a comment to the definition of IRQF_DISABLED?

> regards,
> dan carpenter

WBR, Sergei

