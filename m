From: Joe Perches <joe@perches.com>
Date: Tue, 21 May 2019 09:57:10 +0000
Subject: Re: [PATCH net] mISDN: Fix indenting in dsp_cmx.c
Message-Id: <60901822e34c6c715668dbcf7adbded312d19ea4.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190521094256.GA11899@mwanda>
In-Reply-To: <20190521094256.GA11899@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Karsten Keil <isdn@linux-pingi.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2019-05-21 at 12:42 +0300, Dan Carpenter wrote:
> We used a script to indent this code back in 2012, but I guess it got
> confused by the ifdefs and added some extra tabs.  This patch removes
> them.

Yup, thanks Dan.
Emacs indent-region made a mess of it.

>  drivers/isdn/mISDN/dsp_cmx.c | 427 +++++++++++++++++------------------
>  1 file changed, 213 insertions(+), 214 deletions(-)
