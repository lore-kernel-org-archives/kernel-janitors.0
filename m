From: Yi-Hung Wei <yihung.wei@gmail.com>
Date: Tue, 02 Apr 2019 17:05:24 +0000
Subject: Re: [PATCH net-next] openvswitch: use after free in __ovs_ct_free_action()
Message-Id: <CAG1aQhLqiPKaMbvZD1kjsU4TM=j0yhSF3jRmy2szuCpdTKpfTg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190402065314.GA14444@kadam>
In-Reply-To: <20190402065314.GA14444@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pravin B Shelar <pshelar@ovn.org>, "David S. Miller" <davem@davemloft.net>, Linux Kernel Network Developers <netdev@vger.kernel.org>, ovs dev <dev@openvswitch.org>, kernel-janitors@vger.kernel.org

On Mon, Apr 1, 2019 at 11:53 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We free "ct_info->ct" and then use it on the next line when we pass it
> to nf_ct_destroy_timeout().  This patch swaps the order to avoid the use
> after free.
>
> Fixes: 06bd2bdf19d2 ("openvswitch: Add timeout support to ct action")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
Thanks for the fix.

Acked-by: Yi-Hung Wei <yihung.wei@gmail.com>
