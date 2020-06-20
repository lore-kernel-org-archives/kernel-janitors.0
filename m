From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 20 Jun 2020 12:05:53 +0000
Subject: Re: [PATCH v2] nbd: Fix memory leak in nbd_add_socket
Message-Id: <b55f8af2-b20c-214f-90f0-9b6efcb7273c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zheng Bin <zhengbin13@huawei.com>, linux-block@vger.kernel.org
Cc: nbd@other.debian.org, Navid Emamdoost <navid.emamdoost@gmail.com>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <mccamant@cs.umn.edu>, Qiushi Wu <wu000273@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Yi Zhang <yi.zhang@huawei.com>

> If we add first socket to nbd, config->socks is malloced but
> num_connections does not update(nsock's allocation fail), the memory
> is leaked. Cause in later nbd_config_put(), will only free config->socks
> when num_connections is not 0.
>
> Let nsock's allocation first to avoid this.

I suggest to improve this change description.
Can an other wording variant be nicer?


…
> +++ b/drivers/block/nbd.c
> @@ -1037,21 +1037,22 @@  static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
>  		return -EBUSY;
>  	}
>
> +	nsock = kzalloc(sizeof(struct nbd_sock), GFP_KERNEL);

Please use the following code variant.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=4333a9b0b67bb4e8bcd91bdd80da80b0ec151162#n854

+	nsock = kzalloc(sizeof(*nsock), GFP_KERNEL);


…
>  	if (!socks) {
>  		sockfd_put(sock);
> +		kfree(nsock);
>  		return -ENOMEM;
>  	}

Please take another software design possibility into account.

 	if (!socks) {
-		sockfd_put(sock);
-		return -ENOMEM;
+		kfree(nsock);
+		goto put_socket;
 	}


Regards,
Markus
