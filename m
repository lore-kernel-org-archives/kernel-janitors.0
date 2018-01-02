From: David Miller <davem@davemloft.net>
Date: Tue, 02 Jan 2018 18:50:25 +0000
Subject: Re: [PATCH 03/12] net: dccp: drop unneeded newline
Message-Id: <20180102.135025.617695999212757046.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
        <1514386305-7402-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: gerrit@erg.abdn.ac.uk, kernel-janitors@vger.kernel.org, dccp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 15:51:36 +0100

> DCCP_CRIT prints some other text and then a newline after the message
> string, so the message string does not need to include a newline
> explicitly.  Done using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
