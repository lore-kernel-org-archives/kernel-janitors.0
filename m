From: David Miller <davem@davemloft.net>
Date: Mon, 31 Oct 2016 19:32:51 +0000
Subject: Re: [PATCH 12/15] ptp: use permission-specific DEVICE_ATTR variants
Message-Id: <20161031.153251.1547344422306772113.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
        <1477769829-22230-13-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1477769829-22230-13-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: richardcochran@gmail.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Oct 2016 21:37:06 +0200

> Use DEVICE_ATTR_RO for read only attributes.  This simplifies the
> source code, improves readbility, and reduces the chance of
> inconsistencies.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Also applied to net-next, thank you.
