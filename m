From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 06 May 2020 17:20:32 +0000
Subject: Re: MAINTAINERS: Wrong ordering in DYNAMIC INTERRUPT MODERATION
Message-Id: <20200506102032.32b0f9a3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.2005060749590.7719@felia>
In-Reply-To: <alpine.DEB.2.21.2005060749590.7719@felia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Joe Perches <joe@perches.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 6 May 2020 07:51:36 +0200 (CEST) Lukas Bulwahn wrote:
> Hi Jakub,
> 
> with your commit 9b038086f06b ("docs: networking: convert DIM to RST"), 
> visible on next-20200505, ./scripts/checkpatch.pl -f MAINTAINERS 
> complains:
> 
> WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
> #5966: FILE: MAINTAINERS:5966:
> +F:	lib/dim/
> +F:	Documentation/networking/net_dim.rst
> 
> This is due to wrong ordering of the entries in your submission. If you 
> would like me to send you a patch fixing that, please just let me know.

Please do, thank you!

> It is a recent addition to checkpatch.pl to report ordering problems in 
> MAINTAINERS, so you might have not seen that at submission time.
> 
> 
> Best regards,
> 
> Lukas
