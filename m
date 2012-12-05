From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Dec 2012 07:11:56 +0000
Subject: Re: [PATCH] staging: rtl8712: avoid a useless call to memset().
Message-Id: <20121205071156.GL6568@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354670522-27144-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1354670522-27144-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml@gmail.com>
Cc: linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, yongjun_wei@trendmicro.com.cn, marcos.souza.org@gmail.com, Larry.Finger@lwfinger.net

On Wed, Dec 05, 2012 at 02:22:02AM +0100, Cyril Roelandt wrote:
> In r8711_wx_get_wap(), make sure we do not call memcpy() on a memory area that
> has just been zeroed by a call to memset().
> 

I look at it like the original code is fine.  Your version is also
fine but is it worth the churn?  Also the curly braces are not
needed.

regards,
dan carpenter

