From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Tue, 18 Nov 2014 23:32:07 +0000
Subject: Re: [PATCH 1/1] kernel-power: Deletion of an unnecessary check before the function call "vfree"
Message-Id: <3338798.z9fqSjyBWX@vostro.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <5317A59D.4@users.sourceforge.net> <5468A677.1030004@users.sourceforge.net>
In-Reply-To: <5468A677.1030004@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

On Sunday, November 16, 2014 02:28:23 PM SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 16 Nov 2014 14:18:28 +0100
> 
> The vfree() function performs also input parameter validation. Thus the test
> around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Queued up for 3.19-rc1, thanks!

> ---
>  kernel/power/swap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/power/swap.c b/kernel/power/swap.c
> index aaa3261..337c7a9 100644
> --- a/kernel/power/swap.c
> +++ b/kernel/power/swap.c
> @@ -1374,7 +1374,7 @@ out_clean:
>  				kthread_stop(data[thr].thr);
>  		vfree(data);
>  	}
> -	if (page) vfree(page);
> +	vfree(page);
>  
>  	return ret;
>  }
> 

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
