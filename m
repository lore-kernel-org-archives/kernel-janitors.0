From: Greg KH <greg@kroah.com>
Date: Tue, 31 Aug 2010 18:12:06 +0000
Subject: Re: [PATCH] staging/wlan-ng: fix compile error updating to new
Message-Id: <20100831181206.GA29005@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277986723.1679.8.camel@lenovo>
In-Reply-To: <1277986723.1679.8.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 01, 2010 at 08:18:43AM -0400, Javier Martinez Canillas wrote:
> Hello, 
> 
> A few days ago I send this patch and didn't get any feedback. So I'm resending it.
> 
> In linux-next I got a compile error in wlan-ng:
> 
> CC [M]  drivers/staging/wlan-ng/p80211netdev.o
> In file included from drivers/staging/wlan-ng/p80211netdev.c:91:
> drivers/staging/wlan-ng/cfg80211.c:602: warning: ‘enum tx_power_setting’ declared inside parameter list
> drivers/staging/wlan-ng/cfg80211.c:602: warning: its scope is only this definition or declaration, which is probably not what you want
> drivers/staging/wlan-ng/cfg80211.c:602: error: parameter 2 (‘type’) has incomplete type
> drivers/staging/wlan-ng/cfg80211.c: In function ‘prism2_set_tx_power’:
> drivers/staging/wlan-ng/cfg80211.c:609: error: ‘TX_POWER_AUTOMATIC’ undeclared (first use in this function)
> drivers/staging/wlan-ng/cfg80211.c:609: error: (Each undeclared identifier is reported only once
> drivers/staging/wlan-ng/cfg80211.c:609: error: for each function it appears in.)
> make[1]: *** [drivers/staging/wlan-ng/p80211netdev.o] Error 1
> make: *** [_module_drivers/staging/wlan-ng] Error 2
> 
> The problem is that the 802.11 netlink interface changed and the driver was not updated

I don't see this error anymore in Linus's tree, is it still needed?

thanks,

greg k-h
