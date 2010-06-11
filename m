From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 11 Jun 2010 12:46:01 +0000
Subject: Re: [PATCH] staging/wlags49_hs: Fix build error when CONFIG_SYSFS is
Message-Id: <AANLkTikH_CAVo7sblakUfhI-ysIXk2z1KZz0YkjCDL3m@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1276238148.22216.30.camel@lenovo> <1276238502.1556.512.camel@Joe-Laptop.home>
In-Reply-To: <1276238502.1556.512.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Henk de Groot <pe1dnn@amsat.org>, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors <kernel-janitors@vger.kernel.org>

>>  extern void register_wlags_sysfs(struct net_device *);
>>  extern void unregister_wlags_sysfs(struct net_device *);
>>  #else
>> -static void register_wlags_sysfs(struct net_device *) { return; };
>> -static void unregister_wlags_sysfs(struct net_device *) { return; };
>> +#define register_wlags_sysfs(net_device) { }
>> +#define unregister_wlags_sysfs(net_device) { }
>>  #endif
>
> Yes, that works, but a better fix would be to remove the
> semicolons after the function close braces.
> ---

Why would it be better? With a macro you avoid the overhead of a
function call that does nothing.
I personally think a macro fit better in this case.

Best regards,

-----------------------------------------
Javier Martínez Canillas
+595 981 88 66 58
