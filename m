From: Darren Hart <dvhart@infradead.org>
Date: Tue, 06 Feb 2018 15:42:04 +0000
Subject: Re: [PATCH] platform/x86: mlx-platform: Fix an ERR_PTR vs NULL issue
Message-Id: <20180206154204.GB11119@fury>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206124536.GA9445@mwanda>
 <AM4PR05MB3330D53BBA5BD43AF7EE6D7DA2FD0@AM4PR05MB3330.eurprd05.prod.outlook.com>
In-Reply-To: <AM4PR05MB3330D53BBA5BD43AF7EE6D7DA2FD0@AM4PR05MB3330.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, Feb 06, 2018 at 12:55:58PM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> > Sent: Tuesday, February 06, 2018 2:46 PM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: Darren Hart <dvhart@infradead.org>; Andy Shevchenko
> > <andy@infradead.org>; platform-driver-x86@vger.kernel.org; kernel-
> > janitors@vger.kernel.org
> > Subject: [PATCH] platform/x86: mlx-platform: Fix an ERR_PTR vs NULL issue
> > 
> > devm_ioport_map() returns NULL on error but we accidentally check for error
> > pointers instead.
> > 
> > Fixes: c6acad68eb2d ("platform/mellanox: mlxreg-hotplug: Modify to use a
> > regmap interface")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Vadim Pasternak <vadimp@melanox.com>

Queued up for today's PR for 4.16. Thanks.

-- 
Darren Hart
VMware Open Source Technology Center
