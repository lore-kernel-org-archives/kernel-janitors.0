From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 May 2013 15:57:04 +0000
Subject: Re: [Patch 2/2] Staging: winbond: Memory & urb freed
Message-Id: <20130531155704.GA28112@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A8C27B.9090003@gmail.com>
In-Reply-To: <51A8C27B.9090003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 31, 2013 at 09:02:11PM +0530, Harsh Kumar wrote:
> Memory & urb should be freed before exiting from the function, I think.
> 

They are freed in Wb35Reg_EP0VM_complete() so this patch will make
the system crash right away.  Btw, there are tons of real bugs that
I know about but which I don't fix because I don't know what the
right thing to do is.

> Note: This patch is to be applied after applying the earlier patch i.e [patch 1/2]
> 

In a patch series it's assumed that we have to apply them in order,
but if you need to add a comment like this the right place to do it
is under the --- line and before the patch.

> Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>
> 
> ---

Side comments not intended for the perment git log go here.

>  drivers/staging/winbond/wb35reg.c |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

regards,
dan carpenter

