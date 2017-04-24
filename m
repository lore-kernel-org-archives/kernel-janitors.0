From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Mon, 24 Apr 2017 12:59:50 +0000
Subject: Re: [PATCH 3/3] extcon: arizona: Use devm_kcalloc() in arizona_extcon_get_micd_configs()
Message-Id: <20170424130039.GG1594@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
 <1a203761-76b9-bf3c-c034-0bb81fe6006a@users.sourceforge.net>
In-Reply-To: <1a203761-76b9-bf3c-c034-0bb81fe6006a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: patches@opensource.wolfsonmicro.com, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Apr 24, 2017 at 02:43:55PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 23 Apr 2017 22:44:19 +0200
> 
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus use the corresponding function "devm_kcalloc".
> 
> * Replace the specification of a data structure by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Actually fixes a bug on the alloc as well looks like the type was
wrong before.

Thanks,
Charles
