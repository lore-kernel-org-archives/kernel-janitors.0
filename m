From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Jan 2018 15:49:06 +0000
Subject: Re: [PATCH 3/3] mfd/sm501: Adjust 12 checks for null pointers
Message-Id: <20180122154906.dl2cyvwfdmi2j6r6@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f292e2f3-2471-4ea0-3a02-349e6c10ff03@users.sourceforge.net>
 <10199b4b-ba7d-a253-25c5-e81cafb1d8c9@users.sourceforge.net>
In-Reply-To: <10199b4b-ba7d-a253-25c5-e81cafb1d8c9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 15 Jan 2018, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 15 Jan 2018 16:00:22 +0100
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The script “checkpatch.pl” pointed information out like the following.
> 
> Comparison to NULL could be written …
> 
> Thus fix the affected source code places.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/sm501.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)

Applied, thanks.

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
