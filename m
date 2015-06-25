From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Thu, 25 Jun 2015 16:45:23 +0000
Subject: Re: [PATCH 1/2] perf header: Delete an unnecessary check before the function call "free_event_desc"
Message-Id: <20150625164523.GG3253@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <558C29E1.2040909@users.sourceforge.net>
 <558C2ABA.3000603@users.sourceforge.net>
In-Reply-To: <558C2ABA.3000603@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Em Thu, Jun 25, 2015 at 06:22:18PM +0200, SF Markus Elfring escreveu:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 25 Jun 2015 17:12:32 +0200
> 
> The free_event_desc() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.

Thanks, applying.

- Arnaldo
 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  tools/perf/util/header.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
> index 21a77e7..03ace57 100644
> --- a/tools/perf/util/header.c
> +++ b/tools/perf/util/header.c
> @@ -1063,8 +1063,7 @@ out:
>  	free(buf);
>  	return events;
>  error:
> -	if (events)
> -		free_event_desc(events);
> +	free_event_desc(events);
>  	events = NULL;
>  	goto out;
>  }
> -- 
> 2.4.4
