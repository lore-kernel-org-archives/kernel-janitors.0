From: Vinod Koul <vkoul@kernel.org>
Date: Sat, 04 May 2019 10:53:09 +0000
Subject: Re: [PATCH] dmaengine: at_xdmac: remove a stray bottom half unlock
Message-Id: <20190504104109.GA3845@vkoul-mobl.Dlink>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503131507.GA1236@mwanda>
In-Reply-To: <20190503131507.GA1236@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, Barry Song <21cnbao@gmail.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On 03-05-19, 16:15, Dan Carpenter wrote:
> We switched this code from spin_lock_bh() to vanilla spin_lock() but
> there was one stray spin_unlock_bh() that was overlooked.  This
> patch converts it to spin_unlock() as well.

Applied, thanks

-- 
~Vinod
