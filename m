From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 07 Feb 2020 04:37:32 +0000
Subject: Re: [greybus-dev] [PATCH] staging: greybus: use after free in gb_audio_manager_remove_all()
Message-Id: <20200207042532.wwd6jh6cfuptr7tz@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200205123217.jreendkyxulqsool@kili.mountain>
In-Reply-To: <20200205123217.jreendkyxulqsool@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>, kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>, Dinko Mironov <dmironov@mm-sol.com>, greybus-dev@lists.linaro.org, Greg Kroah-Hartman <gregkh@google.com>

On 05-02-20, 15:32, Dan Carpenter wrote:
> When we call kobject_put() and it's the last reference to the kobject
> then it calls gb_audio_module_release() and frees module.  We dereference
> "module" on the next line which is a use after free.
> 
> Fixes: c77f85bbc91a ("greybus: audio: Fix incorrect counting of 'ida'")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/staging/greybus/audio_manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
> index 9b19ea9d3fa1..9a3f7c034ab4 100644
> --- a/drivers/staging/greybus/audio_manager.c
> +++ b/drivers/staging/greybus/audio_manager.c
> @@ -92,8 +92,8 @@ void gb_audio_manager_remove_all(void)
>  
>  	list_for_each_entry_safe(module, next, &modules_list, list) {
>  		list_del(&module->list);
> -		kobject_put(&module->kobj);
>  		ida_simple_remove(&module_id, module->id);
> +		kobject_put(&module->kobj);
>  	}
>  
>  	is_empty = list_empty(&modules_list);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
