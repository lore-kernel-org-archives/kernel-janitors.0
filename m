From: Tejun Heo <tj@kernel.org>
Date: Sun, 18 Feb 2018 13:17:08 +0000
Subject: Re: [PATCH 2/3] pata_arasan_cf: Delete an unnecessary variable initialisation in arasan_cf_probe()
Message-Id: <20180218131708.GZ695913@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d492f9d2-ed64-e858-441a-fa554369032c@users.sourceforge.net>
 <3b6bfa0f-3356-2fb9-07ae-bf52c1ccc47e@users.sourceforge.net>
In-Reply-To: <3b6bfa0f-3356-2fb9-07ae-bf52c1ccc47e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Viresh Kumar <vireshk@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Feb 16, 2018 at 04:59:01PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 16 Feb 2018 16:28:23 +0100
> 
> The local variable "ret" will eventually be set to an appropriate value
> a bit later. Thus omit the explicit initialisation at the beginning.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied 1-2 to libata/for-4.17.

Thanks.

-- 
tejun
