From: Felipe Balbi <balbi@ti.com>
Date: Tue, 22 Mar 2011 09:21:19 +0000
Subject: Re: [patch 2/4] USB: musb: using 0 instead of NULL
Message-Id: <20110322092117.GT1837@legolas.emea.dhcp.ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110320111524.GJ2008@bicker>
In-Reply-To: <20110320111524.GJ2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Mar 20, 2011 at 02:15:24PM +0300, Dan Carpenter wrote:
> Sparse complains (and rightly so):
> drivers/usb/musb/cppi_dma.c:1458:33:
> 	warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

applied, thanks

-- 
balbi
