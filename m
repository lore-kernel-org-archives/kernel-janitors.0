From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 22 Jun 2020 14:25:03 +0000
Subject: Re: [PATCH v3] nbd: Fix memory leak in nbd_add_socket
Message-Id: <d53f66d0-a122-017c-3f4a-3947adc13fd8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200622112001.105047-1-zhengbin13@huawei.com>
In-Reply-To: <20200622112001.105047-1-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zheng Bin <zhengbin13@huawei.com>, Navid Emamdoost <navid.emamdoost@gmail.com>, linux-block@vger.kernel.org
Cc: nbd@other.debian.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <mccamant@cs.umn.edu>, Qiushi Wu <wu000273@umn.edu>, Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Yi Zhang <yi.zhang@huawei.com>

> When adding first socket to nbd,   …

Can the term “network block device” matter for this change description?


> … A memory leak will occur
> then because the function "nbd_config_put" will free "config->socks" only
> when "config->num_connections" is not zero.

Will an additional imperative wording be helpful for the commit message?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=625d3449788f85569096780592549d0340e9c0c7#n151

Regards,
Markus


…
> +++ b/drivers/block/nbd.c
> @@ -1033,25 +1033,26 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
…
> +	if (!nsock) {
> +		err = -ENOMEM;
> +		goto put_socket;
>  	}
…
>  	return 0;
> +

I find that the exception handling can be improved a bit more
by adding another jump target.

+e_nomem:
+	err = -ENOMEM;


> +put_socket:
> +	sockfd_put(sock);
> +	return err;
>  }

Would you like to apply any further fine-tuning?

Regards,
Markus
