From: Samuel Ortiz <sameo@linux.intel.com>
Date: Mon, 14 May 2012 20:16:53 +0000
Subject: Re: [patch] mfd: lm3533: silence a gcc warning
Message-Id: <20120514201653.GA12740@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120512110104.GC19472@elgon.mountain>
In-Reply-To: <20120512110104.GC19472@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Sat, May 12, 2012 at 02:01:04PM +0300, Dan Carpenter wrote:
> This is supposed to be umode_t.  It causes a GCC warning:
> drivers/mfd/lm3533-core.c:440:2: warning: initialization from incompatible pointer type [enabled by default]
> drivers/mfd/lm3533-core.c:440:2: warning: (near initialization for ‘lm3533_attribute_group.is_visible’) [enabled by default]
> 
Applied, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
