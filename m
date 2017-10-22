From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 22 Oct 2017 19:01:41 +0000
Subject: Re: [PATCH 2/2] extcon: max14577: Delete an unnecessary variable initialisation in max14577_muic_set
Message-Id: <20171022190141.hml3egv6miokft7w@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <431ea2b6-5b03-3752-a9c1-a39b1a7e4921@users.sourceforge.net>
In-Reply-To: <431ea2b6-5b03-3752-a9c1-a39b1a7e4921@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Oct 22, 2017 at 07:52:18PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Oct 2017 19:39:12 +0200
> 
> The variable "ret" is immediately reassigned by a following statement.
> Thus omit the explicit initialisation at the beginning.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/extcon/extcon-max14577.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

This should be also sent to linux-kernel@vger.kernel.org - the mailing
list for this subsysten.

Best regards,
Krzysztof

