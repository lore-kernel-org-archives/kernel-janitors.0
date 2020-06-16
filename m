From: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 16 Jun 2020 09:51:35 +0000
Subject: Re: [PATCH] media: atomisp: Fix a pointer math problem in dump_sp_dmem()
Message-Id: <20200616095135.GX16711@paasikivi.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200616092728.GB11940@mwanda>
In-Reply-To: <20200616092728.GB11940@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, Mauro Carvalho Chehab <mchehab@kernel.org>, kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org

On Tue, Jun 16, 2020 at 12:27:28PM +0300, Dan Carpenter wrote:
> The "io_virt_addr" variable is a u32 pointer and it should be
> incremented by one instead of four.  The current code will dump bogus
> data and read beyond the end of the buffer.
> 
> Fixes: 69a03e36c711 ("media: atomisp: get rid of an iomem abstraction layer")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
