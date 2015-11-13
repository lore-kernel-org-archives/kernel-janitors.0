From: Bob Peterson <rpeterso@redhat.com>
Date: Fri, 13 Nov 2015 14:06:45 +0000
Subject: Re: [PATCH] GFS2: Delete an unnecessary check before the function call "iput"
Message-Id: <608064275.10477765.1447423605461.JavaMail.zimbra@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <546B20F0.9040202@users.sourceforge.net> <546B27FF.6080702@redhat.com> <563A6A22.5000206@users.sourceforge.net>
In-Reply-To: <563A6A22.5000206@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Steven Whitehouse <swhiteho@redhat.com>, cluster-devel@redhat.com, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

----- Original Message -----
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 4 Nov 2015 21:23:43 +0100
> 
> The iput() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/gfs2/ops_fstype.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index baab99b..1f9de17 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -910,8 +910,7 @@ fail_qc_i:
>  fail_ut_i:
>  	iput(sdp->sd_sc_inode);
>  fail:
> -	if (pn)
> -		iput(pn);
> +	iput(pn);
>  	return error;
>  }
>  
> --
> 2.6.2
> 
> 
Hi Markus,

ACK,

I'll save this patch and push it after the current merge window closed.

Regards,

Bob Peterson
Red Hat File Systems
