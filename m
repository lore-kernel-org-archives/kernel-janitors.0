From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 04 Oct 2017 18:40:58 +0000
Subject: Re: [PATCH 2/2] ARM: s3c64xx: Delete an unnecessary return statement in samsung_bl_set()
Message-Id: <20171004184058.vn74ricacf476j7q@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b695686-2e07-910d-6278-91d54a1b0b2f@users.sourceforge.net>
 <6d599b4d-93e3-3e3e-875a-f24ee879ca74@users.sourceforge.net>
In-Reply-To: <6d599b4d-93e3-3e3e-875a-f24ee879ca74@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Mon, Oct 02, 2017 at 10:40:44PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 2 Oct 2017 22:30:55 +0200
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> WARNING: void function return statements are not generally useful
> 
> Thus remove such a statement in the affected function.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/arm/mach-s3c64xx/dev-backlight.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Thanks, applied.

Best regards,
Krzysztof

