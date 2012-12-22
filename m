From: Sergei Shtylyov <sshtylyov@mvista.com>
Date: Sat, 22 Dec 2012 21:53:13 +0000
Subject: Re: [PATCH RESEND 6/6] clk: s5p-g2d: Fix incorrect usage of IS_ERR_OR_NULL
Message-Id: <50D62BC9.9010706@mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
 <1355852048-23188-7-git-send-email-linux@prisktech.co.nz>
In-Reply-To: <1355852048-23188-7-git-send-email-linux@prisktech.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hello.

On 18-12-2012 21:34, Tony Prisk wrote:

> Resend to include mailing lists.

    Such remarks should be placed under --- tear line, not in the changelog.

> Replace IS_ERR_OR_NULL with IS_ERR on clk_get results.

> Signed-off-by: Tony Prisk <linux@prisktech.co.nz>
> CC: Kyungmin Park <kyungmin.park@samsung.com>
> CC: Tomasz Stanislawski <t.stanislaws@samsung.com>
> CC: linux-media@vger.kernel.org

WBR, Sergei


