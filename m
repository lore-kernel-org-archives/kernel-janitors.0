From: Tejun Heo <tj@kernel.org>
Date: Sun, 18 Feb 2018 13:25:35 +0000
Subject: Re: [PATCH 1/3] pata_macio: Delete an error message for a failed memory allocation in two functions
Message-Id: <20180218132535.GE695913@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1e87cf7d-eda2-12d9-af01-17f6619cda72@users.sourceforge.net>
 <0e764e7d-98cf-7f4e-91ff-bf82aa381442@users.sourceforge.net>
In-Reply-To: <0e764e7d-98cf-7f4e-91ff-bf82aa381442@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Feb 16, 2018 at 01:38:20PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 16 Feb 2018 13:01:45 +0100
> 
> Omit an extra message for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applying this one but not the other two.

Thanks.

-- 
tejun
