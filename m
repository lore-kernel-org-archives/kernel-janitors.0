From: Florian Fainelli <f.fainelli@gmail.com>
Date: Sat, 28 Oct 2017 21:08:49 +0000
Subject: Re: [PATCH] phylink: Use common error handling code in phylink_create()
Message-Id: <60594e3d-c8ec-16a0-1fec-3fc854334321@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f52bdf2b-d45f-7db4-b533-d96dd3b4f6bf@users.sourceforge.net>
In-Reply-To: <f52bdf2b-d45f-7db4-b533-d96dd3b4f6bf@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On 10/28/2017 01:00 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 28 Oct 2017 21:48:31 +0200
> 
> * Add a jump target so that a bit of exception handling can be better
>   reused at the end of this function.
> 
> * Adjust three condition checks.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
