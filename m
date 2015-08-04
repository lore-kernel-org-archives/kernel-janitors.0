From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Aug 2015 22:49:59 +0000
Subject: Re: stmmac: add ipq806x glue layer
Message-Id: <20150804224959.GZ5096@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Aug 04, 2015 at 03:42:51PM -0700, Mathieu Olivari wrote:
> Hi Dan,
> You're right, that's a bug. The offset should be (x), and not (1 << x).
> We could either redefine the macro to be (x), or we just use << gmac->id
> directly without a macro.
> The reason why we have NSS_COMMON_CLK_SRC_CTRL_RGMII &
> NSS_COMMON_CLK_SRC_CTRL_SGMII macros is that the bit takes different values
> depending on the port. I can post a patch today if you want.

Yes, please.  If you could give me a Reported-by: Dan Carpenter
<dan.carpenter@oracle.com> tag, I would be grateful.  Thanks!

regards,
dan carpenter

