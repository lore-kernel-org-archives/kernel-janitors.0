From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 12 Dec 2012 17:01:48 +0000
Subject: Re: [PATCH] drivers/pinctrl/pinctrl-at91.c: convert kfree to devm_kfree
Message-Id: <20121212170148.GL4398@game.jcrosoft.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355223525-19165-1-git-send-email-Julia.Lawall@lip6.fr>
 <20121212115624.GI4398@game.jcrosoft.org>
 <alpine.DEB.2.02.1212121521590.1995@hadrien>
In-Reply-To: <alpine.DEB.2.02.1212121521590.1995@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 15:22 Wed 12 Dec     , Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The function at91_dt_node_to_map is ultimately called by the function
> pinctrl_get, which is an exported function.  Since it is possible that this
> function is not called from within a probe function, for safety, the kfree
> is converted to a devm_kfree, to both free the data and remove it from the
> device in a failure situation.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Best Regards,
J.
