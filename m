From: Tejun Heo <tj@kernel.org>
Date: Sun, 18 Feb 2018 13:23:38 +0000
Subject: Re: [PATCH] pata_mpc52xx: Delete an error message for a failed memory allocation in mpc52xx_ata_prob
Message-Id: <20180218132338.GD695913@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b9749bf6-0bbb-2b2d-b946-aae893f3e305@users.sourceforge.net>
In-Reply-To: <b9749bf6-0bbb-2b2d-b946-aae893f3e305@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Feb 16, 2018 at 11:44:13AM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 16 Feb 2018 11:34:53 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to libata/for-4.17.

Thanks.

-- 
tejun
