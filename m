From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 23 Jul 2020 06:28:26 +0000
Subject: Re: [PATCH] efi: add missed destroy_workqueue when efisubsys_init fails
Message-Id: <9255e38a-e5fb-0a41-1b6d-5fe4226e3b42@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Li Heng <liheng40@huawei.com>, linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Rui Xiang <rui.xiang@huawei.com>

> destroy_workqueue() should be called to destroy efi_rts_wq
> when efisubsys_init() init resources fails.

* Can such exception handling depend on the data structure member “efi.runtime_supported_mask”?

* An imperative wording would be preferred for the change description
  (besides another bit of fine-tuning), wouldn't it?

* Will the tag “Fixes” become helpful for the commit message?


…
> +++ b/drivers/firmware/efi/efi.c
> @@ -379,6 +379,7 @@ static int __init efisubsys_init(void)
>  	efi_kobj = kobject_create_and_add("efi", firmware_kobj);
>  	if (!efi_kobj) {
>  		pr_err("efi: Firmware registration failed.\n");
> +		destroy_workqueue(efi_rts_wq);
>  		return -ENOMEM;
>  	}

How do you think about to use the following statements instead
in the if branch?

-		return -ENOMEM;
+		error = -ENOMEM;
+		goto destroy_workqueue;


Regards,
Markus
