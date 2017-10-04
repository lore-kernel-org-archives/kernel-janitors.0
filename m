From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 04 Oct 2017 19:11:02 +0000
Subject: Re: [PATCH 2/2] ARM: SAMSUNG: Improve a size determination in 13 functions
Message-Id: <20171004191102.mnswu25bjxynuh4o@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75c352ad-c51e-2e63-2f93-0f14522ff09c@users.sourceforge.net>
 <7f196313-ad49-2cd8-e45f-be487e089547@users.sourceforge.net>
In-Reply-To: <7f196313-ad49-2cd8-e45f-be487e089547@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Oct 04, 2017 at 01:12:55PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 4 Oct 2017 09:52:33 +0200
> 
> Replace the specification of data structures by pointer dereferences
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/arm/plat-samsung/adc.c  |  4 ++--
>  arch/arm/plat-samsung/devs.c | 33 +++++++++++----------------------
>  2 files changed, 13 insertions(+), 24 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

