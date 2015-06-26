From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Jun 2015 17:42:13 +0000
Subject: Re: [PATCH] fs-eventpoll: Deletion of unnecessary checks before the function call "__pm_stay_awake"
Message-Id: <558D8EF5.9030701@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.so
 urceforge.net> <546B04E2.80000@users.sourceforge.net>
In-Reply-To: <546B04E2.80000@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 18 Nov 2014 09:27:16 +0100
> 
> The __pm_stay_awake() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/eventpoll.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> index 7bcfff9..eec2e85 100644
> --- a/fs/eventpoll.c
> +++ b/fs/eventpoll.c
> @@ -555,8 +555,7 @@ static inline void ep_pm_stay_awake(struct epitem *epi)
>  {
>  	struct wakeup_source *ws = ep_wakeup_source(epi);
>  
> -	if (ws)
> -		__pm_stay_awake(ws);
> +	__pm_stay_awake(ws);
>  }
>  
>  static inline bool ep_has_wakeup_source(struct epitem *epi)
> @@ -571,8 +570,7 @@ static inline void ep_pm_stay_awake_rcu(struct epitem *epi)
>  
>  	rcu_read_lock();
>  	ws = rcu_dereference(epi->ws);
> -	if (ws)
> -		__pm_stay_awake(ws);
> +	__pm_stay_awake(ws);
>  	rcu_read_unlock();
>  }
>  
> 

How are the chances to integrate this update suggestion
into another source code repository?

Regards,
Markus
