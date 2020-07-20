From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 20 Jul 2020 12:07:50 +0000
Subject: Re: [PATCH] ipmi: Remove duplicate code in __ipmi_bmc_register()
Message-Id: <2084072d-e16c-d47c-6eed-f47e8f149c44@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Corey Minyard <cminyard@mvista.com>, Jing Xiangfeng <jingxiangfeng@huawei.com>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Corey Minyard <minyard@acm.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

> > __ipmi_bmc_register() jumps to the label 'out_free_my_dev_name' in an
> > error path. So we can remove duplicate code in the if (rv).
>
> Looks correct, queued for next release.

1. Can an imperative wording be preferred for the change description?

2. Will the tag “Fixes” become helpful for the commit message?

3. Did you avoid a typo in the patch subject?

Regards,
Markus
