From: Sunil Kovvuri <sunil.kovvuri@gmail.com>
Date: Wed, 02 Dec 2020 07:15:00 +0000
Subject: Re: [PATCH net-next] octeontx2-af: debugfs: delete dead code
Message-Id: <CA+sq2Ceo3z1KAuOfZYsmRMHw4dHcnrRLtkRmALNHvj3=tRJKtA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8c6vpapJDYI2eWI@mwanda>
In-Reply-To: <X8c6vpapJDYI2eWI@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Linux Netdev List <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 2, 2020 at 12:28 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These debugfs never return NULL so all this code will never be run.
>
> In the normal case, (and in this case particularly), the debugfs
> functions are not supposed to be checked for errors so all this error
> checking code can be safely deleted.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks for the changes.
