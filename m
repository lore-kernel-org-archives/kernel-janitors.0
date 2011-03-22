From: Felipe Balbi <balbi@ti.com>
Date: Tue, 22 Mar 2011 09:21:06 +0000
Subject: Re: [patch 1/4] USB: musb: add missing unlock in cppi_interrupt()
Message-Id: <20110322092105.GS1837@legolas.emea.dhcp.ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110320111436.GI2008@bicker>
In-Reply-To: <20110320111436.GI2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Mar 20, 2011 at 02:14:36PM +0300, Dan Carpenter wrote:
> We should unlock before returning here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

applied, thanks

-- 
balbi
