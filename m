From: Henk de Groot <henk.de.groot@hetnet.nl>
Date: Thu, 17 Jun 2010 17:23:32 +0000
Subject: Re: [PATCH] staging/wlags49_h2: Fix build error when CONFIG_SYSFS
Message-Id: <4C1A5A14.4080304@hetnet.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1276751864.14632.6.camel@lenovo>
In-Reply-To: <1276751864.14632.6.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Javier,

I assumed Greg KH already added this last version of your patch to the 
queue for the staging tree. Anyway I think it's fine. The only problem I 
see is a possible complained from the compiler because of an argument 
that's defined but never used. The only way around that is to avoid the 
call to the function in the first place by using compiler directives in 
the code (or use a #define but that solution was already rejected). 
Disabling the call to the function in the code may even save some more 
overhead and make the memory footprint smaller.

Kind regards,

Henk.

Op 17-6-2010 7:17, Javier Martinez Canillas schreef:
> Hello,
>
> Didn't get any feedback so resending the patch.
>
> I got a wlags49_h2 driver build error in linux-next when CONFIG_SYSFS is not set.
>
> CC [M]  drivers/staging/wlags49_h2/wl_cs.o
> In file included from drivers/staging/wlags49_h2/wl_cs.c:104:
> drivers/staging/wlags49_h2/wl_sysfs.h: In function ‘register_wlags_sysfs’:
> drivers/staging/wlags49_h2/wl_sysfs.h:5: error: parameter name omitted
> drivers/staging/wlags49_h2/wl_sysfs.h: In function ‘unregister_wlags_sysfs’:
> drivers/staging/wlags49_h2/wl_sysfs.h:6: error: parameter name omitted
> make[1]: *** [drivers/staging/wlags49_h2/wl_cs.o] Error 1
> make: *** [_module_drivers/staging/wlags49_h2] Error 2
>
> This is due a wrong function definition (it does not include parameters names).
>
> Current patch solves the issue.
>
> Thanks a lot
>
> Signed-off-by: Javier Martinez Canillas<martinez.javier@gmail.com>
> ---
>   drivers/staging/wlags49_h2/wl_sysfs.h |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/wlags49_h2/wl_sysfs.h
> b/drivers/staging/wlags49_h2/wl_sysfs.h
> index 6d96d03..fa658c3 100644
> --- a/drivers/staging/wlags49_h2/wl_sysfs.h
> +++ b/drivers/staging/wlags49_h2/wl_sysfs.h
> @@ -2,6 +2,6 @@
>   extern void register_wlags_sysfs(struct net_device *);
>   extern void unregister_wlags_sysfs(struct net_device *);
>   #else
> -static void register_wlags_sysfs(struct net_device *) { return; };
> -static void unregister_wlags_sysfs(struct net_device *) { return; };
> +static inline void register_wlags_sysfs(struct net_device *net) { }
> +static inline void unregister_wlags_sysfs(struct net_device *net) { }
>   #endif
> --
> 1.7.0.4
>
>
>
>    


