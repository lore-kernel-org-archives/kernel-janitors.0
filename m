From: Sunil Kovvuri <sunil.kovvuri@gmail.com>
Date: Thu, 21 Nov 2019 09:53:13 +0000
Subject: Re: [PATCH net-next] octeontx2-af: Fix uninitialized variable in debugfs
Message-Id: <CA+sq2Cf=u509E-er_N8rzgkP4XdetNpogNqn+AVv-9AzmoQKrg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121092146.hnvdwnzpirskw3wr@kili.mountain>
In-Reply-To: <20191121092146.hnvdwnzpirskw3wr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, "David S. Miller" <davem@davemloft.net>, Linux Netdev List <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Nov 21, 2019 at 2:53 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If rvu_get_blkaddr() fails, then this rvu_cgx_nix_cuml_stats() returns
> zero and we write some uninitialized data into the debugfs output.
>
> On the error paths, the use of the uninitialized "*stat" is harmless,
> but it will lead to a Smatch warning (static analysis) and a UBSan
> warning (runtime analysis) so we should prevent that as well.
>

Thanks for the fix.

Thanks,
Sunil.
