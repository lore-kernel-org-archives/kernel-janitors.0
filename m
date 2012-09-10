From: Glauber Costa <glommer@parallels.com>
Date: Mon, 10 Sep 2012 14:07:43 +0000
Subject: Re: [PATCH] idr: Rename MAX_LEVEL to MAX_ID_LEVEL
Message-Id: <504DF42F.2050504@parallels.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120910131426.GA12431@localhost>
In-Reply-To: <20120910131426.GA12431@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>

On 09/10/2012 05:14 PM, Fengguang Wu wrote:
> To avoid name conflicts:
> 
> drivers/video/riva/fbdev.c:281:9: sparse: preprocessor token MAX_LEVEL redefined
> 
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>

Acked-by: Glauber Costa <glommer@parallels.com>

