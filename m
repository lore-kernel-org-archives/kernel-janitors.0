From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Mar 2015 16:32:39 +0000
Subject: Re: [PATCH V3] [media] mantis: fix error handling
Message-Id: <20150323163239.GT16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150322224831.GF16501@mwanda>
 <1427127953-24716-1-git-send-email-s.jegen@gmail.com>
In-Reply-To: <1427127953-24716-1-git-send-email-s.jegen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Silvan Jegen <s.jegen@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 23, 2015 at 05:25:53PM +0100, Silvan Jegen wrote:
> Remove dead code, make goto label names more expressive and add a label
> in order to call mantis_dvb_exit if mantis_uart_init fails.
> 
> Also make sure that mantis_pci_exit is called if we fail the
> mantis_stream_control call and that we call mantis_i2c_exit if
> mantis_get_mac fails.
> 
> Signed-off-by: Silvan Jegen <s.jegen@gmail.com>

Looks great.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

