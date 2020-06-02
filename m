From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 17:20:32 +0000
Subject: Re: [PATCH] cxl: Fix kobject memory leak in cxl_sysfs_afu_new_cr()
Message-Id: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang Hai <wanghai38@huawei.com>, linuxppc-dev@lists.ozlabs.org
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ian Munsie <imunsie@au1.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>

> Fix it by adding a call to kobject_put() in the error path of
> kobject_init_and_add().

Thanks for another completion of the exception handling.

Would an other patch subject be a bit nicer?


…
> +++ b/drivers/misc/cxl/sysfs.c
> @@ -624,7 +624,7 @@ static struct afu_config_record *cxl_sysfs_afu_new_cr(struct cxl_afu *afu, int c
>  	rc = kobject_init_and_add(&cr->kobj, &afu_config_record_type,
>  				  &afu->dev.kobj, "cr%i", cr->cr);
>  	if (rc)
> -		goto err;
> +		goto err1;
…

Can an other label be more reasonable here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=f359287765c04711ff54fbd11645271d8e5ff763#n465

Regards,
Markus
