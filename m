From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 30 Jun 2015 08:13:54 +0000
Subject: Re: [PATCH] macintosh: Delete an unnecessary check before the function call "of_node_put"
Message-Id: <55924FC2.3070006@users.sourceforge.net>
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
 <5317A59D.4@users.sourceforge.net> <54D282B0.90907@users.sourceforge.net>
In-Reply-To: <54D282B0.90907@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Am 04.02.2015 um 21:36 schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 4 Feb 2015 21:32:27 +0100
> 
> The of_node_put() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/macintosh/smu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
> index 10ae69b..d531f80 100644
> --- a/drivers/macintosh/smu.c
> +++ b/drivers/macintosh/smu.c
> @@ -557,8 +557,7 @@ int __init smu_init (void)
>  	return 0;
>  
>  fail_msg_node:
> -	if (smu->msg_node)
> -		of_node_put(smu->msg_node);
> +	of_node_put(smu->msg_node);
>  fail_db_node:
>  	of_node_put(smu->db_node);
>  fail_bootmem:
> 

Would you like to integrate this update suggestion
into another source code repository?

Regards,
Markus
