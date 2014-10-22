From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Oct 2014 10:32:41 +0000
Subject: Re: [patch 2/2] staging: lustre: validate size in ll_setxattr()
Message-Id: <20141022103241.GG26918@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141022081233.GB31384@mwanda>
In-Reply-To: <20141022081233.GB31384@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 22, 2014 at 02:27:08PM +0400, Andrew Perepechko wrote:
> Hi Dan!
> 
> You probably meant putting that check after the followring if-statement,
> since generic extended attributes can have size 1, 2, 3, ...
> 

Ok.

> In that case, size = 0 seems to be the wrong value size for an lov param
> as well.

I don't know about this.  The code is very clear that size = 0 is
acceptable inside the if statement.  Oleg?

regards,
dan carpenter

