From: Tejun Heo <tj@kernel.org>
Date: Sun, 18 Feb 2018 13:21:02 +0000
Subject: Re: [PATCH] pata_samsung_cf: Delete an error message for a failed memory allocation in pata_s3c_prob
Message-Id: <20180218132102.GB695913@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b757fb06-dde6-b1f6-77fa-f5301fb6fec1@users.sourceforge.net>
In-Reply-To: <b757fb06-dde6-b1f6-77fa-f5301fb6fec1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Feb 16, 2018 at 11:08:18AM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 16 Feb 2018 10:55:51 +0100
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
