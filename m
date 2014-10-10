From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 10 Oct 2014 07:54:16 +0000
Subject: Re: [Cocci] [RFC] drop owner assignment from platform_drivers
Message-Id: <alpine.DEB.2.10.1410100951250.2402@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141010072439.GA1741@katana>
In-Reply-To: <20141010072439.GA1741@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> @match1@
> declarer name module_platform_driver;
> declarer name module_platform_driver_probe;
> identifier __driver;
> @@
> (
> 	module_platform_driver(__driver);
> |
> 	module_platform_driver_probe(__driver, ...);
> )
>
> @fix1 depends on match1@
> identifier match1.__driver;
> @@
> 	static struct platform_driver __driver = {
> 		.driver = {
> -			.owner = THIS_MODULE,
> 		}
> 	};
>
> @match2@
> identifier __driver;
> @@
> (
> 	platform_driver_register(&__driver)
> |
> 	platform_driver_probe(&__driver, ...)
> |
> 	platform_create_bundle(&__driver, ...)
> )
>
> @fix2 depends on match2@
> identifier match2.__driver;
> @@
> 	static struct platform_driver __driver = {
> 		.driver = {
> -			.owner = THIS_MODULE,
> 		}
> 	};

The semantic patch looks fine.  I'm a little surprised that it doesn't
complain about the lack of a comma after

.driver = { .owner = THIS_MODULE, }

but it seems that it does not.

If you think that it would be useful to have this in the Linux kernel, so
people don't add the owner initializer back in the future, you can try

coccinelle/tools/sgen/sgen

(run make in the coccinelle/tools/sgen directory).  That will guide you
through the process of making a Linux-ready semantic patch.  Feedback
would be appreciated.

julia
