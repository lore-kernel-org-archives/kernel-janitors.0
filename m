From: "Rafael J. Wysocki" <rjw@sisk.pl>
Date: Thu, 09 Aug 2012 10:01:48 +0000
Subject: Re: [pm:linux-next 22/38] include/linux/pm_domain.h:252:2: error: too many arguments to function '__
Message-Id: <201208091201.48712.rjw@sisk.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120809092312.GA3316@localhost>
In-Reply-To: <20120809092312.GA3316@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Thursday, August 09, 2012, Fengguang Wu wrote:
> Hi Rafael,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
> head:   9ea3f7070730c4148694904a335825f7e4540604
> commit: 3fca1aaa84488678c2b57d9b35259bbd4efd86ca [22/38] PM / Domains: Make it possible to use domain names when adding devices
> config: sh-allnoconfig (attached as .config)
> 
> All related error/warning messages:
> 
> In file included from drivers/sh/pm_runtime.c:15:0:
> include/linux/pm_domain.h: In function 'pm_genpd_of_add_device':
> include/linux/pm_domain.h:252:2: error: too many arguments to function '__pm_genpd_of_add_device'
> include/linux/pm_domain.h:182:19: note: declared here
> include/linux/pm_domain.h: In function 'pm_genpd_name_add_device':
> include/linux/pm_domain.h:258:2: warning: passing argument 1 of '__pm_genpd_name_add_device' discards 'const' qualifier from pointer target type [enabled by default]
> include/linux/pm_domain.h:187:19: note: expected 'char *' but argument is of type 'const char *'
> 
> vim +252 include/linux/pm_domain.h
>    249	static inline int pm_genpd_of_add_device(struct device_node *genpd_node,
>    250						 struct device *dev)
>    251	{
>  > 252		return __pm_genpd_of_add_device(genpd_node, dev, NULL);
>    253	}
>    254	
>    255	static inline int pm_genpd_name_add_device(const char *domain_name,
> 

That is due to CONFIG_PM_GENERIC_DOMAINS unset.  Should be fixed now.

Thanks,
Rafael
