From: David Miller <davem@davemloft.net>
Date: Mon, 27 Jul 2020 17:10:59 +0000
Subject: Re: [PATCH 4/7] net/mlx5: drop unnecessary list_empty
Message-Id: <20200727.101059.1257161436665415755.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
        <1595761112-11003-5-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1595761112-11003-5-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@inria.fr
Cc: saeedm@mellanox.com, kernel-janitors@vger.kernel.org, leon@kernel.org, kuba@kernel.org, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 26 Jul 2020 12:58:29 +0200

> list_for_each_entry is able to handle an empty list.
> The only effect of avoiding the loop is not initializing the
> index variable.
> Drop list_empty tests in cases where these variables are not
> used.
> 
> Note that list_for_each_entry is defined in terms of list_first_entry,
> which indicates that it should not be used on an empty list.  But in
> list_for_each_entry, the element obtained by list_first_entry is not
> really accessed, only the address of its list_head field is compared
> to the address of the list head, so the list_first_entry is safe.
> 
> The semantic patch that makes this change is as follows (with another
> variant for the no brace case): (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Saeed, please pick this up.

Thank you.
