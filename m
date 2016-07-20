From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 20 Jul 2016 13:38:11 +0000
Subject: Re: [PATCH] cxl: Delete an unnecessary check before the function call "of_node_put"
Message-Id: <alpine.DEB.2.10.1607201535270.2838@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <33fb6b04-9986-35ee-f4e2-0ebeb79c5e23@users.sourceforge.net>
In-Reply-To: <33fb6b04-9986-35ee-f4e2-0ebeb79c5e23@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linuxppc-dev@lists.ozlabs.org, Christophe Lombard <clombard@linux.vnet.ibm.com>, Ian Munsie <imunsie@au1.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>



On Wed, 20 Jul 2016, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 20 Jul 2016 15:10:32 +0200
>
> The of_node_put() function tests whether its argument is NULL
> and then returns immediately.
> Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/misc/cxl/of.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
> index edc4583..333256a 100644
> --- a/drivers/misc/cxl/of.c
> +++ b/drivers/misc/cxl/of.c
> @@ -490,8 +490,7 @@ int cxl_of_probe(struct platform_device *pdev)
>  		adapter->slices = 0;
>  	}
>
> -	if (afu_np)
> -		of_node_put(afu_np);
> +	of_node_put(afu_np);
>  	return 0;
>  }

I don't think that the call should be there at all.  The loop only exits
when afu_np is NULL.  Furthermore, the loop should not be written as a for
loop, but rather with for_each_child_of_node.

julia
