From: David Miller <davem@davemloft.net>
Date: Thu, 29 Mar 2018 18:33:45 +0000
Subject: Re: [PATCH] test_bpf: Fix NULL vs IS_ERR() check in test_skb_segment()
Message-Id: <20180329.143345.769203497090630957.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180328114836.GD29050@mwanda>
        <b76502fe-4aa0-599f-23e2-72a773c7f764@fb.com>
        <c76d47e1-100c-c2f3-4712-b338b80673f7@iogearbox.net>
In-Reply-To: <c76d47e1-100c-c2f3-4712-b338b80673f7@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daniel@iogearbox.net
Cc: yhs@fb.com, dan.carpenter@oracle.com, ast@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Daniel Borkmann <daniel@iogearbox.net>
Date: Wed, 28 Mar 2018 20:57:27 +0200

> If you have a chance, please take this fix directly into your net-next tree
> since it also contains the original commit 76db8087c4c9 ("net: bpf: add a
> test for skb_segment in test_bpf module"), which is not in the bpf-next tree
> at this point.

Ok, done.
