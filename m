From: Jesse Brandeburg <jesse.brandeburg@intel.com>
Date: Thu, 08 Aug 2019 05:30:04 +0000
Subject: Re: [PATCH 2/2] net: ag71xx: Use GFP_KERNEL instead of GFP_ATOMIC in 'ag71xx_rings_init()'
Message-Id: <20190807223004.00001947@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564560130.git.christophe.jaillet@wanadoo.fr>
        <75ee52ae065ce9cb1f32d88939b166773316dc45.1564560130.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <75ee52ae065ce9cb1f32d88939b166773316dc45.1564560130.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jcliburn@gmail.com, davem@davemloft.net, chris.snook@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, jesse.brandeburg@intel.com

On Wed, 31 Jul 2019 10:06:48 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> There is no need to use GFP_ATOMIC here, GFP_KERNEL should be enough.
> The 'kcalloc()' just a few lines above, already uses GFP_KERNEL.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
