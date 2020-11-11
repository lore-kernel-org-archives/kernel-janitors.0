From: Mat Martineau <mathew.j.martineau@linux.intel.com>
Date: Wed, 11 Nov 2020 18:49:20 +0000
Subject: Re: [PATCH][next] mptcp: fix a dereference of pointer before msk is null checked.
Message-Id: <cb9fba1-b399-325f-c956-ede9da1b1b7@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201109125215.2080172-1-colin.king@canonical.com>
In-Reply-To: <20201109125215.2080172-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Matthieu Baerts <matthieu.baerts@tessares.net>, "David S . Miller" <davem@davemloft.net>, Geliang Tang <geliangtang@gmail.com>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, mptcp@lists.01.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 9 Nov 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the assignment of pointer net from the sock_net(sk) call
> is potentially dereferencing a null pointer sk. sk points to the
> same location as pointer msk and msk is being null checked after
> the sock_net call.  Fix this by calling sock_net after the null
> check on pointer msk.
>
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 00cfd77b9063 ("mptcp: retransmit ADD_ADDR when timeout")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> net/mptcp/pm_netlink.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>

Hi Colin and Jakub -

I noticed that the follow-up discussion on this patch didn't go to the 
netdev list, so patchwork did not get updated.

This patch is superseded by the following, which already has a Reviewed-by 
tag from Matthieu:

http://patchwork.ozlabs.org/project/netdev/patch/078a2ef5bdc4e3b2c25ef852461692001f426495.1604976945.git.geliangtang@gmail.com/


Thanks!

--
Mat Martineau
Intel
