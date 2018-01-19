From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Date: Fri, 19 Jan 2018 16:59:30 +0000
Subject: Re: [PATCH 1/3] soc-knav_dma: Use seq_putc() in dma_debug_show_channels()
Message-Id: <01885292-d7a1-1b5c-d176-86e82af90a70@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <eddc35f7-a04b-42f5-ad8b-d345ca0b57b4@users.sourceforge.net>
 <54a54866-6828-1ae5-6524-ca3f0dc4ab33@users.sourceforge.net>
In-Reply-To: <54a54866-6828-1ae5-6524-ca3f0dc4ab33@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 5/1/2017 12:27 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 May 2017 20:55:55 +0200
> 
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
Will pick all three patches. Thanks !!
