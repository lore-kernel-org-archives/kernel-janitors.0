From: Russell King - ARM Linux <linux@armlinux.org.uk>
Date: Tue, 01 Nov 2016 20:14:04 +0000
Subject: Re: [PATCH] drm/armada: Remove some dead code
Message-Id: <20161101201404.GU1041@n2100.armlinux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030153842.16745-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030153842.16745-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Oct 30, 2016 at 04:38:42PM +0100, Christophe JAILLET wrote:
> 'dma_buf_map_attachment()' can not return NULL, so there is no need to
> check for it.
> 
> Also add a space in order to improve layout.

Thanks, applied.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
