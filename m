From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 28 Oct 2020 00:12:04 +0000
Subject: Re: [PATCH 1/2 net] devlink: Fix some error codes
Message-Id: <20201027171204.6235e1e6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201026080059.GA1628785@mwanda>
In-Reply-To: <20201026080059.GA1628785@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiri Pirko <jiri@nvidia.com>, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 26 Oct 2020 11:00:59 +0300 Dan Carpenter wrote:
> devlink_nl_region_notify_build() where it leads to a NULL dereference in
> the caller.
> 
> Fixes: 544e7c33ec2f ("net: devlink: Add support for port regions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied both, thanks Dan!
