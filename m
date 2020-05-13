From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 13 May 2020 11:49:41 +0000
Subject: Re: [PATCH] dmaengine: sf-pdma: Simplify the error handling path in 'sf_pdma_probe()'
Message-Id: <20200513113741.GG14092@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200501100824.126534-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200501100824.126534-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: green.wan@sifive.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01-05-20, 12:08, Christophe JAILLET wrote:
> There is no need to explicitly free memory that have been 'devm_kzalloc'ed.
> Simplify the probe function accordingly.

Applied, thanks

-- 
~Vinod
