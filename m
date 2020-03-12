From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Mar 2020 17:47:41 +0000
Subject: Re: [PATCH] spi: spi-nxp-fspi: Fix a NULL vs IS_ERR() check in probe
Message-Id: <20200312125016.GF11583@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200312113154.GC20562@mwanda>
 <CAHCN7xKSc7spZyq=mySWHDmSrGMkQo8FYRbn-NzYRa7iB-0BoQ@mail.gmail.com>
In-Reply-To: <CAHCN7xKSc7spZyq=mySWHDmSrGMkQo8FYRbn-NzYRa7iB-0BoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yogesh Gaur <yogeshgaur.83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-spi <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Mar 12, 2020 at 06:58:31AM -0500, Adam Ford wrote:
> On Thu, Mar 12, 2020 at 6:32 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The platform_get_resource_byname() function returns NULL on error, it
> > doesn't return error pointers.
> >
> > Fixes: d166a73503ef ("spi: fspi: dynamically alloc AHB memory")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > The commit message for commit d166a73503ef ("spi: fspi: dynamically
> > alloc AHB memory") is not very good.  Why is it necessary to allocate
> > the AHB memory dynamically instead of during probe?  Also I suspect that
> > Adam should have recieved authorship credit for that patch.
> 
> It wasn't my patch, I just pulled it in from NXP's repo.  The true
> author is Han Xu.  When I pulled in the series from NXP, I found the
> flexSPI on the i.MX8MM to become functional, and my company has a
> board with a qspi flash on it.

You should have put your Signed-off-by after Han Xu's.  They should be
in chronological order so whoever handles a patch adds their S-o-b to
the end.

regards,
dan carpenter
