From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 25 May 2020 12:54:47 +0000
Subject: Re: [PATCH] RDMA/core: Complete exception handling in add_port()
Message-Id: <4bf45476-ad99-042b-d0ea-3c97bb429a98@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qiushi Wu <wu000273@umn.edu>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kangjie Lu <kjlu@umn.edu>, Leon Romanovsky <leon@kernel.org>

> In function add_port(), pointer p is not released in error paths.

1. I would prefer to describe that an ib_port data structure was not released
   in some error cases.
   How relevant can its size be here?


> Fix this issue by adding a kfree(p) into the end of error path.

2. I suggest to improve also this change description.

3. I find an other subject more appropriate.


…
> +++ b/drivers/infiniband/core/sysfs.c
> @@ -1202,6 +1202,7 @@  static int add_port(struct ib_core_device *coredev, int port_num)
>
>  err_put:
>  	kobject_put(&p->kobj);
> +	kfree(p);
>  	return ret;
>  }

4. I recommend to add also the label “free_port” before the missed function call.

   Another source code place should be accordingly adjusted then.

 	ret = kobject_init_and_add(&p->kobj, &port_type,
 				   coredev->ports_kobj,
 				   "%d", port_num);
-	if (ret) {
-		kfree(p);
-		return ret;
-	}
+	if (ret)
+		goto free_port;


5. Will a similar adjustment be needed for the data structure member “gid_attr_group”
   according to the desired complete exception handling?

Regards,
Markus
