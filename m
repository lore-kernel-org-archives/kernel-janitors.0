From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Fri, 01 Jan 2016 23:14:46 +0000
Subject: Re: [PATCH] net-libertas: Better exception handling in if_spi_host_to_card_worker()
Message-Id: <56870866.7020000@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5686F0B2.5000000@users.sourceforge.net>
In-Reply-To: <5686F0B2.5000000@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Hello

On 1/2/2016 12:33 AM, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 1 Jan 2016 22:27:20 +0100
>
> This issue was detected by using the Coccinelle software.
>
> Move the jump label directly before the desired log statement
> so that the variable "err" will not be checked once more
> after it was determined that a function call failed.
> Use the identifier "report_failure" instead of the label "err".

    Why? The code was smart enough and you're making it uglier that it needs 
to be.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

MBR, Sergei

