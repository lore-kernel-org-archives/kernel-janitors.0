From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Apr 2020 11:00:41 +0000
Subject: Re: [PATCH -next v2] mailbox: zynqmp-ipi: Fix NULL vs IS_ERR() check in zynqmp_ipi_mbox_probe()
Message-Id: <93fe8107-ffca-8006-4020-be3bd6edfc57@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429073020.83519-1-weiyongjun1@huawei.com>
 <20200429093503.150485-1-weiyongjun1@huawei.com>
In-Reply-To: <20200429093503.150485-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Wendy Liang <wendy.liang@xilinx.com>

> So we should check whether the return value of devm_ioremap()
> is NULL instead of IS_ERR.

Will an other change description provide the preferred imperative wording?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/process/submitting-patches.rst?id=96c9a7802af7d500a582d89a8b8645=
84fe878c1b#n151

Regards,
Markus
