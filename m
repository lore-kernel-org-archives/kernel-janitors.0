From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 23 Jul 2020 05:33:41 +0000
Subject: Re: [PATCH] mailbox: pcc: Put the PCCT table for error path
Message-Id: <9e4f09a9-d14f-d76c-5318-d25501c0ec66@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hanjun Guo <guohanjun@huawei.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

…
> In acpi_pcc_probe(), the PCCT table entries will be used as private
> data for communication chan at runtime, but the table should be put
> for error path.

* An imperative wording can be preferred for the change description,
  can't it?

* Will the tag “Fixes” become helpful for the commit message?

Regards,
Markus
