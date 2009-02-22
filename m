From: David Miller <davem@davemloft.net>
Date: Sun, 22 Feb 2009 07:37:20 +0000
Subject: Re: [PATCH 15/16] ipv6: fix sparse warning: Using plain integer as
Message-Id: <20090221.233720.204925051.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	<20090222000541.17557.51181.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000541.17557.51181.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 01:05:44 +0100

> Fix this sparse warning:
>   net/ipv6/xfrm6_state.c:72:26: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied, thanks.
