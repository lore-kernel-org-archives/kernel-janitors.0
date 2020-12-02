From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 02 Dec 2020 20:01:27 +0000
Subject: Re: [PATCH net-next] octeontx2-af: debugfs: delete dead code
Message-Id: <20201202120127.7cc7453f@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8c6vpapJDYI2eWI@mwanda>
        <CA+sq2Ceo3z1KAuOfZYsmRMHw4dHcnrRLtkRmALNHvj3=tRJKtA@mail.gmail.com>
In-Reply-To: <CA+sq2Ceo3z1KAuOfZYsmRMHw4dHcnrRLtkRmALNHvj3=tRJKtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Kovvuri <sunil.kovvuri@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, "David S. Miller" <davem@davemloft.net>, Linux Netdev List <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, 2 Dec 2020 12:33:00 +0530 Sunil Kovvuri wrote:
> On Wed, Dec 2, 2020 at 12:28 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > These debugfs never return NULL so all this code will never be run.
> >
> > In the normal case, (and in this case particularly), the debugfs
> > functions are not supposed to be checked for errors so all this error
> > checking code can be safely deleted.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks for the changes.

Applied, thanks!
