From: David Miller <davem@davemloft.net>
Date: Mon, 12 Jul 2010 01:13:00 +0000
Subject: Re: [PATCH] depca: fix leaks
Message-Id: <20100711.181300.58435799.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278678986-7725-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278678986-7725-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, jpirko@redhat.com, joe@perches.com, shemminger@vyatta.com, eric.dumazet@gmail.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri,  9 Jul 2010 16:36:25 +0400

> Since some of xxx_register_driver() can return error we must continue
> with already registered drivers. If any of xxx_register_driver()
> succeeded or depca_platform_probe() found any device then
> depca_module_init() returns ok. In depca_module_exit() we must
> unregister only registered drivers.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Driver registry should succeed except in cases that would indicate a
serious driver bug, such as trying to register the same driver twice.

Therefore if any registry fails, we should fail the entire probe.

This is the scheme used in just about any driver I've had any
involvement in, see for example drivers/net/niu.c:

--------------------
#ifdef CONFIG_SPARC64
	err = of_register_driver(&niu_of_driver, &of_bus_type);
#endif

	if (!err) {
		err = pci_register_driver(&niu_pci_driver);
#ifdef CONFIG_SPARC64
		if (err)
			of_unregister_driver(&niu_of_driver);
#endif
	}

	return err;
--------------------

Please do something similar here in depca, thanks.
