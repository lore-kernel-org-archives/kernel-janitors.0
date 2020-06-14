From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Jun 2020 08:25:38 +0000
Subject: Re: [PATCH] net: fec: fix ref count leaking when pm_runtime_get_sync fails
Message-Id: <38dcaa5d-98ad-e1df-6e83-2e6dd677a483@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, netdev@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <mccamant@cs.umn.edu>, Qiushi Wu <wu000273@umn.edu>, "David S. Miller" <davem@davemloft.net>, Fugang Duan <fugang.duan@nxp.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> in fec_enet_mdio_read, …

I am curious under which circumstances you would like to improve
such commit messages.

* Will the tag “Fixes” become helpful?

* Which source code analysis tools did trigger to send
  update suggestions according to 16 similar issues for today?


…
> +++ b/drivers/net/ethernet/freescale/fec_main.c
…
> @@ -1893,8 +1895,10 @@  static int fec_enet_mdio_write(struct mii_bus *bus, int mii_id, int regnum,
>  	bool is_c45 = !!(regnum & MII_ADDR_C45);
>
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_autosuspend(dev);
>  		return ret;
> +	}
>  	else
>  		ret = 0;

I suggest to adjust also the source code from the else branch.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=96144c58abe7ff767e754b5b80995f7b8846d49b#n196


…
> @@ -2276,6 +2280,7 @@  static void fec_enet_get_regs(struct net_device *ndev,
>  	}
>
>  	pm_runtime_mark_last_busy(dev);
> +out:
>  	pm_runtime_put_autosuspend(dev);
>  }

Perhaps use the label “put_runtime” instead?

Regards,
Markus
