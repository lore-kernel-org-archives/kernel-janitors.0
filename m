From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 09 May 2020 05:48:07 +0000
Subject: Re: [PATCH] net/atheros: remove redundant assignment to variable size
Message-Id: <20200508224807.5797e7b5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508223321.483485-1-colin.king@canonical.com>
In-Reply-To: <20200508223321.483485-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri,  8 May 2020 23:33:21 +0100 Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable size is being assigned with a value that is never read,
> the assignment is redundant and cab be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you!
