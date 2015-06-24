From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 24 Jun 2015 16:53:59 +0000
Subject: Re: [patch -next] renesas: missing unlock on error path
Message-Id: <558AE0A7.5000507@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150624143254.GG1702@mwanda>
In-Reply-To: <20150624143254.GG1702@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Masaru Nagai <masaru.nagai.vx@renesas.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello.

On 06/24/2015 05:32 PM, Dan Carpenter wrote:

> We need to unlock before returning here.

     Indeed. Sorry about missing that.

> Fixes: a0d2f20650e8 ('Renesas Ethernet AVB PTP clock driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

WBR, Sergei

