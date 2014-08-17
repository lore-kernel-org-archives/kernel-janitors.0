From: Jason Cooper <jason@lakedaemon.net>
Date: Sun, 17 Aug 2014 17:20:51 +0000
Subject: Re: [patch] irqchip/irq-crossbar: off by one bugs in init
Message-Id: <20140817172051.GF12769@titan.lakedaemon.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140807152821.GB10299@mwanda>
In-Reply-To: <20140807152821.GB10299@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Sricharan R <r.sricharan@ti.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan,

On Thu, Aug 07, 2014 at 06:28:21PM +0300, Dan Carpenter wrote:
> My static checker complains that the ">" should be ">=" or else we go
> beyoned the end of the cb->irq_map[] array on the next line.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to irqchip/urgent

thx,

Jason.
