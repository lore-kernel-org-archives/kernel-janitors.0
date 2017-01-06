From: Richard Weinberger <richard@nod.at>
Date: Fri, 06 Jan 2017 10:36:28 +0000
Subject: Re: error: ubi_io_read: error -74 (ECC error)
Message-Id: <04e73e49-fb0f-d58c-e300-5e1b80e0a6a6@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b23632bb474f4ba793086a9a139b3083@SGPMBX1023.APAC.bosch.com>
In-Reply-To: <b23632bb474f4ba793086a9a139b3083@SGPMBX1023.APAC.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Anurag Raghavan (RBEI/ETW11)" <Raghavan.Anurag@in.bosch.com>, Dan Carpenter <dan.carpenter@oracle.com>, David Gstir <david@sigma-star.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>

Raghavan Anurag,

Am 06.01.2017 um 06:15 schrieb Anurag Raghavan (RBEI/ETW11):
> Hi Richard,
> 
> I am using the kernel version-30.3.5
> 
> Is there any patches available to fix this issue...???

Depends. Your kernel is very old, please consider an upgrade.
gpmi-nand saw some fixes lately. See commit bd2e778c9ee361c23ccb2b10591712e129d97893.

Just in case, removing the check from UBIFS is not the right fix.
I saw such "fixes" more than once on customer kernels.

Thanks,
//richard
