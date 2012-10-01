From: Roland Dreier <roland@purestorage.com>
Date: Mon, 01 Oct 2012 09:12:35 +0000
Subject: Re: [infiniband:for-next 37/52] drivers/net/ethernet/mellanox/mlx4/mlx4.h:695:1: error: expected ide
Message-Id: <CAL1RGDXz1R467TcWMExMGF1By=daczTdQNBA6L9upDDhhe1pRA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121001041510.GA17304@localhost>
In-Reply-To: <20121001041510.GA17304@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sun, Sep 30, 2012 at 9:15 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/roland/infiniband.git for-next
> head:   c99517cda3548a0e270d374fe97d589d38022b80
> commit: 431ee27496b84effaaff9d21f0aae7c68015deeb [37/52] mlx4_core: Stash PCI ID driver_data in mlx4_priv structure
> config: x86_64-allmodconfig
>
> All error/warnings:
>
> In file included from drivers/net/ethernet/mellanox/mlx4/alloc.c:42:0:
> drivers/net/ethernet/mellanox/mlx4/mlx4.h:695:1: error: expected identifier or '(' before '<<' token

Thanks, managed to leave a conflict marker in when I merged up to
3.6-rc7.  Should be fixed now.
