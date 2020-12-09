From: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 09 Dec 2020 09:50:48 +0000
Subject: Re: [PATCH] media: ccs: Remove uninitialized, unused variable
Message-Id: <20201209095048.GG25763@paasikivi.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9B0NIm4Iv4uFlkT@mwanda>
In-Reply-To: <X9B0NIm4Iv4uFlkT@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, Dec 09, 2020 at 09:52:36AM +0300, Dan Carpenter wrote:
> The "reg" value isn't used any more but it's still printed in the
> debug code.  Delete it.
> 
> Fixes: fd9065812c7b ("media: smiapp: Obtain frame descriptor from CCS limits")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for the patch. This has been already fixed by another patch:

<URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201203222828.1029943-1-arnd@kernel.org/>

-- 
Sakari Ailus
