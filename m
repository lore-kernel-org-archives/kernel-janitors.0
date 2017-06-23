From: Borislav Petkov <bp@suse.de>
Date: Fri, 23 Jun 2017 08:12:09 +0000
Subject: Re: [PATCH] RAS: Fix an error checking test in 'create_debugfs_nodes()'
Message-Id: <20170623081209.ypgow4gii4lahogp@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623062440.6726-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170623062440.6726-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 23, 2017 at 08:24:40AM +0200, Christophe JAILLET wrote:
> 'decay' is kwown to be not NULL at this point.
> 'count' should be tested instead.
> 
> Fixes: 011d82611172 ("RAS: Add a Corrected Errors Collector")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/ras/cec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imendörffer, Jane Smithard, Graham Norton, HRB 21284 (AG Nürnberg)
-- 
