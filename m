From: Tejun Heo <tj@kernel.org>
Date: Sun, 18 Feb 2018 13:27:06 +0000
Subject: Re: [PATCH 1/2] pata_it821x: Delete an error message for a failed memory allocation in it821x_firmwa
Message-Id: <20180218132706.GF695913@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6cdadc5e-bfbd-9866-a69f-d225e68c3b22@users.sourceforge.net>
 <939014fc-8c9e-99a4-99fb-2fde4694cd29@users.sourceforge.net>
In-Reply-To: <939014fc-8c9e-99a4-99fb-2fde4694cd29@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Feb 16, 2018 at 03:22:18PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 16 Feb 2018 14:04:49 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applying this one to libata/for-4.17 but skipping the next one.
There's no point in making these trivial changes.  It's just churn
without actual benefits but only risks.

Thanks.

-- 
tejun
