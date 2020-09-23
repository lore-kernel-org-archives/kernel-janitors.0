From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 23 Sep 2020 10:16:55 +0000
Subject: Re: [PATCH] soundwire: remove an unnecessary NULL check
Message-Id: <20200923100455.GG2968@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200923083235.GB1454948@mwanda>
In-Reply-To: <20200923083235.GB1454948@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Sanyog Kale <sanyog.r.kale@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org

On 23-09-20, 11:32, Dan Carpenter wrote:
> The "bus" pointer isn't NULL so the address to a non-zero offset in
> middle of "bus" cannot be NULL.  Delete the NULL check.

Applied, thanks

-- 
~Vinod
