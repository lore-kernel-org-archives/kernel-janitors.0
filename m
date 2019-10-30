From: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 30 Oct 2019 08:24:21 +0000
Subject: Re: [PATCH] media: smiapp: unlock on error in smiapp_start_streaming()
Message-Id: <20191030082421.GE10211@paasikivi.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191029182401.GB17569@mwanda>
In-Reply-To: <20191029182401.GB17569@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 29, 2019 at 09:24:01PM +0300, Dan Carpenter wrote:
> We added two new error paths to smiapp_start_streaming(), but we can't
> return directly without dropping the "sensor->mutex" lock.
> 
> Fixes: f8c4352c1bef ("media: smiapp: Move binning configuration to streaming start")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, Dan!

-- 
Sakari Ailus
