From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Sun, 30 Oct 2016 15:03:05 +0000
Subject: Re: [PATCH 03/15] wm8350_power: use permission-specific DEVICE_ATTR variants
Message-Id: <20161030150305.GB1575@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
 <1477769829-22230-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1477769829-22230-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Sebastian Reichel <sre@kernel.org>, kernel-janitors@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Oct 29, 2016 at 09:36:57PM +0200, Julia Lawall wrote:
> Use DEVICE_ATTR_RO for read only attributes.  This simplifies the source
> code, improves readbility, and reduces the chance of inconsistencies.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @ro@
> declarer name DEVICE_ATTR;
> identifier x,x_show;
> @@
> 
> DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
> 
> @script:ocaml@
> x << ro.x;
> x_show << ro.x_show;
> @@
> 
> if not (x^"_show" = x_show) then Coccilib.include_match false
> 
> @@
> declarer name DEVICE_ATTR_RO;
> identifier ro.x,ro.x_show;
> @@
> 
> - DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
> + DEVICE_ATTR_RO(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com> 

Thanks,
Charles
