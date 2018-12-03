From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 03 Dec 2018 16:28:50 +0000
Subject: Re: [PATCH] misc: vexpress: Off by one in vexpress_syscfg_exec()
Message-Id: <20181203162808.GA14028@e107155-lin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203145219.brmtuv26dj3vnc5y@kili.mountain>
In-Reply-To: <20181203145219.brmtuv26dj3vnc5y@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org

On Mon, Dec 03, 2018 at 05:52:19PM +0300, Dan Carpenter wrote:
> The > comparison should be >= to prevent reading beyond the end of the
> func->template[] array.
> 
> (The func->template array is allocated in vexpress_syscfg_regmap_init()
> and it has func->num_templates elements.)
> 
> Fixes: 974cc7b93441 ("mfd: vexpress: Define the device as MFD cells")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch, thanks for identifying and fixing this.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

I assume Greg will pick this up, if not I will add this when I send
pull request next time(not sure when yet as I don't have anything for
v4.21)

--
Regards,
Sudeep
