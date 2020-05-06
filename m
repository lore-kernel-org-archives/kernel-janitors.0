From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 06 May 2020 20:45:23 +0000
Subject: Re: [PATCH] MAINTAINERS: put DYNAMIC INTERRUPT MODERATION in proper order
Message-Id: <20200506134523.46b358e3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506202906.23297-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200506202906.23297-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed,  6 May 2020 22:29:06 +0200 Lukas Bulwahn wrote:
> Commit 9b038086f06b ("docs: networking: convert DIM to RST") added a new
> file entry to DYNAMIC INTERRUPT MODERATION to the end, and not following
> alphabetical order.
> 
> So, ./scripts/checkpatch.pl -f MAINTAINERS complains:
> 
>   WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic
>   order
>   #5966: FILE: MAINTAINERS:5966:
>   +F:      lib/dim/
>   +F:      Documentation/networking/net_dim.rst
> 
> Reorder the file entries to keep MAINTAINERS nicely ordered.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Jakub Kicinski <kuba@kernel.org>

Thanks!
