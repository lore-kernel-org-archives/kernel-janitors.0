From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Mar 2019 08:45:12 +0000
Subject: Re: [PATCH] coccinelle: put_device: reduce false positives
Message-Id: <20190326084512.GC32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1553321671-27749-1-git-send-email-wen.yang99@zte.com.cn>
 <179bbdd1-3fcb-bba5-52b3-7f96973c7650@web.de>
 <alpine.DEB.2.21.1903232104030.5660@hadrien>
In-Reply-To: <alpine.DEB.2.21.1903232104030.5660@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr, Markus Elfring <Markus.Elfring@web.de>, Wen Yang <wen.yang99@zte.com.cn>

On Sat, Mar 23, 2019 at 09:06:54PM +0100, Julia Lawall wrote:
> 
> 
> On Sat, 23 Mar 2019, Markus Elfring wrote:
> 
> > > Don't complain about a return when this function returns "&pdev->dev".
> >
> > Would this information qualify to add the tag “Fixes” to the commit message?
> 
> Fixes tags relate to stable kernels, so that one can see which stable
> kernels a particular patch should be propagated to.  There is no need to
> propagate patches on semantic patches to stable kernels.  People who run
> stable kernels are interested in their behavior, not the bug finding
> rules that they contain.

The Fixes tag is not just about stable...  For example, we use them for
statistics to see how quickly bugs get fixed etc.

regards,
dan carpenter
