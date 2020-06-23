From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Tue, 23 Jun 2020 16:34:41 +0000
Subject: Re: [PATCH] drivers: base: power: mark 2 functions as __init to save some memory
Message-Id: <2442161.XSOieovDCv@kreacher>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200621081854.882705-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200621081854.882705-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: len.brown@intel.com, pavel@ucw.cz, gregkh@linuxfoundation.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sunday, June 21, 2020 10:18:54 AM CEST Christophe JAILLET wrote:
> 'early_resume_init()' and 'late_resume_init() 'are only called respectively
> via 'early_resume_init' and 'late_resume_init'.
> They can be marked as __init to save a few bytes of memory.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/base/power/trace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/power/trace.c b/drivers/base/power/trace.c
> index 977d27bd1a22..a97f33d0c59f 100644
> --- a/drivers/base/power/trace.c
> +++ b/drivers/base/power/trace.c
> @@ -265,14 +265,14 @@ static struct notifier_block pm_trace_nb = {
>  	.notifier_call = pm_trace_notify,
>  };
>  
> -static int early_resume_init(void)
> +static int __init early_resume_init(void)
>  {
>  	hash_value_early_read = read_magic_time();
>  	register_pm_notifier(&pm_trace_nb);
>  	return 0;
>  }
>  
> -static int late_resume_init(void)
> +static int __init late_resume_init(void)
>  {
>  	unsigned int val = hash_value_early_read;
>  	unsigned int user, file, dev;
> 

Applied as 5.8-rc material, thanks!
