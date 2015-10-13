From: David Miller <davem@davemloft.net>
Date: Tue, 13 Oct 2015 11:18:59 +0000
Subject: Re: [PATCH] qlcnic: constify qlcnic_mbx_ops structure
Message-Id: <20151013.041859.2079956557358480044.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444564085-12839-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1444564085-12839-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: Dept-GELinuxNICDev@qlogic.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Oct 2015 13:48:05 +0200

> The only instance of a qlcnic_mbx_ops structure is never modified.  Thus
> the declaration of the structure and all references to the structure type
> can be made const.
> 
> In the definition of the qlcnic_mailbox structure, the ops field is no
> longer lined up with the other fields.  This was left as is, to avoid a lot
> of trivial changes on the other lines.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.
