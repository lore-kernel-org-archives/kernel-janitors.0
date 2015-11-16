From: David Miller <davem@davemloft.net>
Date: Mon, 16 Nov 2015 20:07:45 +0000
Subject: Re: [PATCH 1/9] net: cavium: liquidio: constify pci_error_handlers structures
Message-Id: <20151116.150745.188460724093737913.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447495621-9161-1-git-send-email-Julia.Lawall@lip6.fr>
	<1447495621-9161-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447495621-9161-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: derek.chickles@caviumnetworks.com, kernel-janitors@vger.kernel.org, satananda.burla@caviumnetworks.com, felix.manlunas@caviumnetworks.com, raghu.vatsavayi@caviumnetworks.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Nov 2015 11:06:53 +0100

> This pci_error_handlers structure is never modified, like all the other
> pci_error_handlers structures, so declare it as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
