From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 May 2019 10:27:42 +0000
Subject: Re: [PATCH net] mISDN: Fix indenting in dsp_cmx.c
Message-Id: <20190521102742.GJ19380@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190521094256.GA11899@mwanda>
 <60901822e34c6c715668dbcf7adbded312d19ea4.camel@perches.com>
In-Reply-To: <60901822e34c6c715668dbcf7adbded312d19ea4.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Karsten Keil <isdn@linux-pingi.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 21, 2019 at 02:57:10AM -0700, Joe Perches wrote:
> On Tue, 2019-05-21 at 12:42 +0300, Dan Carpenter wrote:
> > We used a script to indent this code back in 2012, but I guess it got
> > confused by the ifdefs and added some extra tabs.  This patch removes
> > them.
> 
> Yup, thanks Dan.
> Emacs indent-region made a mess of it.
> 

The re-indent generally made things better and even in this case it
didn't really make it worse, just different.

regards,
dan carpenter
