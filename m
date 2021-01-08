From: Jakub Kicinski <kuba@kernel.org>
Date: Fri, 08 Jan 2021 02:42:38 +0000
Subject: Re: [PATCH] octeontx2-af: fix memory leak of lmac and lmac->name
Message-Id: <20210107184238.36841971@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210107123916.189748-1-colin.king@canonical.com>
        <CA+sq2CcPRuQijfOFA74KrNF9E5tj-QqH_0nNC21fT=rqkuuCcw@mail.gmail.com>
In-Reply-To: <CA+sq2CcPRuQijfOFA74KrNF9E5tj-QqH_0nNC21fT=rqkuuCcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Kovvuri <sunil.kovvuri@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, "David S . Miller" <davem@davemloft.net>, Nithya Mani <nmani@marvell.com>, Linux Netdev List <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 7 Jan 2021 22:31:30 +0530 Sunil Kovvuri wrote:
> On Thu, Jan 7, 2021 at 6:11 PM Colin King <colin.king@canonical.com> wrote:
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently the error return paths don't kfree lmac and lmac->name
> > leading to some memory leaks.  Fix this by adding two error return
> > paths that kfree these objects
> >
> > Addresses-Coverity: ("Resource leak")
> > Fixes: 1463f382f58d ("octeontx2-af: Add support for CGX link management")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks for the fix, looks good to me.

Consider venturing an Acked-by tag in the future so it can be recorded 
in git.

Applied, thanks!
