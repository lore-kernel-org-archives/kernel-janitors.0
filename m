From: Jiri Pirko <jiri@resnulli.us>
Date: Mon, 15 Jan 2018 11:19:19 +0000
Subject: Re: [PATCH net-next] mlxsw: spectrum: qdiscs: Make function mlxsw_sp_qdisc_prio_unoffload static
Message-Id: <20180115111919.GA2103@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516012983-994-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516012983-994-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Mon, Jan 15, 2018 at 11:43:03AM CET, weiyongjun1@huawei.com wrote:
>Fixes the following sparse warning:
>
>drivers/net/ethernet/mellanox/mlxsw/spectrum_qdisc.c:464:1: warning:
> symbol 'mlxsw_sp_qdisc_prio_unoffload' was not declared. Should it be static?
>
>Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Acked-by: Jiri Pirko <jiri@mellanox.com>

Thanks.
