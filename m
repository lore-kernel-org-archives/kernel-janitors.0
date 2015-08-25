From: David Miller <davem@davemloft.net>
Date: Tue, 25 Aug 2015 20:39:26 +0000
Subject: Re: [PATCH 05/11] mlxsw: fix error return code
Message-Id: <20150825.133926.117809700677925849.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440288682-12732-1-git-send-email-Julia.Lawall@lip6.fr>
	<1440288682-12732-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440288682-12732-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: jiri@mellanox.com, kernel-janitors@vger.kernel.org, idosch@mellanox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Aug 2015 02:11:16 +0200

> Return a negative error code on failure.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
