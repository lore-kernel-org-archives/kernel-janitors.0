From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 04 Oct 2017 19:04:28 +0000
Subject: Re: [PATCH 1/2] ARM: SAMSUNG: Delete an error message for a failed memory allocation in three functi
Message-Id: <20171004190428.6agsco3456oeyab5@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75c352ad-c51e-2e63-2f93-0f14522ff09c@users.sourceforge.net>
 <ae29b97e-9a60-fdf4-5bd2-af33f6081446@users.sourceforge.net>
In-Reply-To: <ae29b97e-9a60-fdf4-5bd2-af33f6081446@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Oct 04, 2017 at 01:11:56PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 4 Oct 2017 09:33:52 +0200
> 
> Omit extra messages for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/arm/plat-samsung/adc.c          | 8 ++------
>  arch/arm/plat-samsung/platformdata.c | 4 +---
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

