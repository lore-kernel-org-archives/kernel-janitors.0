From: Tejun Heo <tj@kernel.org>
Date: Sun, 18 Feb 2018 13:18:32 +0000
Subject: Re: [PATCH 3/3] pata_arasan_cf: Move two variable assignments in arasan_cf_probe()
Message-Id: <20180218131832.GA695913@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d492f9d2-ed64-e858-441a-fa554369032c@users.sourceforge.net>
 <0f5492bc-d239-401e-6f77-a27897e4ede5@users.sourceforge.net>
In-Reply-To: <0f5492bc-d239-401e-6f77-a27897e4ede5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Viresh Kumar <vireshk@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Feb 16, 2018 at 05:00:11PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 16 Feb 2018 16:42:26 +0100
> 
> Move assignments for the local variables "irq_handler" and "pdata"
> so that their setting will only be performed after a call
> of the function "devm_kzalloc" succeeded by this function.
> Thus adjust a corresponding if statement.

I'm not gonna apply this.  If there's something preventing the
compiler from optimizing it, the right thing to do is fixing that.

Thanks.

-- 
tejun
