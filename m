From: Venu Byravarasu <vbyravarasu@nvidia.com>
Date: Mon, 17 Sep 2012 05:50:24 +0000
Subject: Re: drivers/mfd/tps65090.c: duplicated argument to ||
Message-Id: <5056B750.6080009@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120917004501.GD12394@localhost>
In-Reply-To: <20120917004501.GD12394@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Pushed a patch to fix this & included you in TO list for review.

Thanks for bringing this to my notice.
Venu

On Monday 17 September 2012 06:15 AM, Fengguang Wu wrote:
> Hi Venu,
>
> coccinelle warns about
>
> drivers/mfd/tps65090.c:239:5-30: duplicated argument to && or ||
>
> Which is introduced by:
>
> commit 3c33be06f9aa0949ad24e67dfcae1f2a3006f4e1
> Author:     Venu Byravarasu <vbyravarasu@nvidia.com>
> AuthorDate: Fri Mar 16 11:10:19 2012 +0530
> Commit:     Samuel Ortiz <sameo@linux.intel.com>
> CommitDate: Tue Mar 20 16:56:33 2012 +0100
>
>      mfd: Add support for TPS65090
>
> Thanks,
> Fengguang


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
