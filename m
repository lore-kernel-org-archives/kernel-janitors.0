From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 11 Apr 2020 01:35:39 +0000
Subject: Re: [PATCH] net: neterion: remove redundant assignment to variable tmp64
Message-Id: <20200410183539.627ad5f2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410191150.75588-1-colin.king@canonical.com>
In-Reply-To: <20200410191150.75588-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jon Mason <jdmason@kudzu.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 10 Apr 2020 20:11:50 +0100 Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable tmp64 is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")

Patch looks good, but what's the value of this tag?

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
