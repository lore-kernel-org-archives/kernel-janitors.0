From: Ingo Molnar <mingo@kernel.org>
Date: Thu, 14 Jul 2016 12:59:49 +0000
Subject: Re: [patch 1/2] drivers/virt: fix the error handling in ioctl_dtprop()
Message-Id: <20160714125949.GB21281@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160714114139.GK18175@mwanda>
In-Reply-To: <20160714114139.GK18175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Timur Tabi <timur@freescale.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


* Dan Carpenter <dan.carpenter@oracle.com> wrote:

> If strndup_user() user fails then it returns an error pointer and we
> pass that to kfree() which causes an oops.

Hm, in addition to this fix wouldn't it be better to not crash if kfree() gets 
passed an error pointer? Would that have changed the pattern of this particular 
bug?

Thanks,

	Ingo
