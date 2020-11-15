From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Sun, 15 Nov 2020 11:19:19 +0000
Subject: Re: [PATCH] MAINTAINERS: rectify file patterns for NETFILTER
Message-Id: <20201115111919.GA24901@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201109091942.32280-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201109091942.32280-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 09, 2020 at 10:19:42AM +0100, Lukas Bulwahn wrote:
> The two file patterns in the NETFILTER section:
> 
>   F:      include/linux/netfilter*
>   F:      include/uapi/linux/netfilter*
> 
> intended to match the directories:
> 
>   ./include{/uapi}/linux/netfilter_{arp,bridge,ipv4,ipv6}
> 
> A quick check with ./scripts/get_maintainer.pl --letters -f will show that
> they are not matched, though, because this pattern only matches files, but
> not directories.
> 
> Rectify the patterns to match the intended directories.

Applied, thanks.
