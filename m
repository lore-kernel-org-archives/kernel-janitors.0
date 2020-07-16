From: Jakub Kicinski <kuba@kernel.org>
Date: Thu, 16 Jul 2020 01:05:32 +0000
Subject: Re: [PATCH v2] decnet: dn_dev: Remove an unnecessary label.
Message-Id: <20200715180532.5297f0dd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714142328.GA4630@blackclown>
In-Reply-To: <20200714142328.GA4630@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suraj Upadhyay <usuraj35@gmail.com>
Cc: davem@davemloft.net, linux-decnet-user@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 14 Jul 2020 19:53:28 +0530 Suraj Upadhyay wrote:
> Remove the unnecessary label from dn_dev_ioctl() and make its error
> handling simpler to read.
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>

Applied, thank you.
