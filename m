From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Apr 2016 14:03:54 +0000
Subject: Re: [patch] drm/rockchip: inno_hdmi: fix an error code
Message-Id: <20160421140354.GB17913@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160225213029.GA18267@mwanda> <56CFF00F.3030309@rock-chips.com>
In-Reply-To: <56CFF00F.3030309@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yakir Yang <ykk@rock-chips.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org

On Fri, Feb 26, 2016 at 02:26:23PM +0800, Yakir Yang wrote:
> Dan,
> 
> On 02/26/2016 05:30 AM, Dan Carpenter wrote:
> >We were accidentally returning PTR_ERR(NULL) which means success when we
> >wanted to return a negative error code.
> >
> >Fixes: 412d4ae6b7a5 ('drm/rockchip: hdmi: add Innosilicon HDMI support')
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Yakir Yang <ykk@rock-chips.com>

We still need to apply this.

regards,
dan carpenter

