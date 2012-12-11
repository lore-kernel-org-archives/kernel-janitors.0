From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Dec 2012 06:32:15 +0000
Subject: Re: [PATCH v2] staging: rtl8712: avoid a useless call to memset().
Message-Id: <20121211063215.GU22569@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0121210085516.GO6568@mwanda>
 <1355185248-26842-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1355185248-26842-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, yongjun_wei@trendmicro.com.cn, marcos.souza.org@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 11, 2012 at 01:20:48AM +0100, Cyril Roelandt wrote:
> In r8711_wx_get_wap(), make sure we do not call memcpy() on a memory area that
> has just been zeroed by a call to memset().
> 

Acked-by: Dan Carpenter <dan.carpenter@oracle.com>

