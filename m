From: Vinod Koul <vinod.koul@intel.com>
Date: Mon, 02 Jan 2017 05:20:16 +0000
Subject: Re: [PATCH] dmaengine: ti-dma-crossbar: Add some 'of_node_put()' in error path.
Message-Id: <20170102050816.GO3573@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161219053351.21156-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161219053351.21156-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Dec 19, 2016 at 06:33:51AM +0100, Christophe JAILLET wrote:
> Add some missing 'of_node_put()' in early exit error path.

Applied, Thanks

-- 
~Vinod
