From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2013 08:48:48 +0000
Subject: Re: [patch] mfd: pm8921: potential NULL dereference in pm8921_remove()
Message-Id: <20131108084847.GZ26669@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107080420.GP21844@elgon.mountain>
 <20131107100609.GL30901@lee--X1>
 <20131107105050.GL20521@mwanda>
 <20131107112258.GM30901@lee--X1>
In-Reply-To: <20131107112258.GM30901@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: David Brown <davidb@codeaurora.org>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 07, 2013 at 11:22:58AM +0000, Lee Jones wrote:
> On Thu, 07 Nov 2013, Dan Carpenter wrote:
> 
> > On Thu, Nov 07, 2013 at 10:06:09AM +0000, Lee Jones wrote:
> > > Just a thought. If you use `git format-patch` you don't have to
> > > hand-craft the [PATCH] part of the subject line.
> > 
> > The lower case [patch] is annoying?
> 
> Not particularly. It didn't even make it to 'nit' status.
> 
> The pointer was more to aid you than anything. `git format-patch` is a
> nice tool with some really useful options.

It would be hard for me to automate my work flow any more than it
currently is.  :P

regards,
dan carpenter

