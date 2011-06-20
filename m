From: Samuel Ortiz <sameo@linux.intel.com>
Date: Mon, 20 Jun 2011 13:29:33 +0000
Subject: Re: [PATCH 1/2] mfd/ab3550: Use kstrtoul_from_user
Message-Id: <20110620132933.GK22420@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1307393012-32582-1-git-send-email-peterhuewe@gmx.de>
In-Reply-To: <1307393012-32582-1-git-send-email-peterhuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hi Peter,

On Mon, Jun 06, 2011 at 10:43:31PM +0200, Peter Huewe wrote:
> This patch replaces the code for getting an unsigned long from a
> userspace buffer by a simple call to kstroul_from_user.
> This makes it easier to read and less error prone.
Thanks, both patches applied.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
