From: Alexander Aring <alex.aring@gmail.com>
Date: Mon, 04 Jan 2016 14:33:49 +0000
Subject: Re: [PATCH] mac802154: constify ieee802154_llsec_ops structure
Message-Id: <20160104143344.GA18317@omega>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450906592-9203-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450906592-9203-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, marcel@holtmann.org

Hi,

On Wed, Dec 23, 2015 at 10:36:32PM +0100, Julia Lawall wrote:
> The ieee802154_llsec_ops structure is never modified, so declare it as
> const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 

Acked-by: Alexander Aring <alex.aring@gmail.com>

Marcel, can you please apply this on bluetooth-next?

Thank you.

- Alex
