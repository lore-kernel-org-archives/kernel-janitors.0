From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 09 May 2020 05:29:58 +0000
Subject: Re: [PATCH net-next] net: dsa: vsc73xx: convert to devm_platform_ioremap_resource
Message-Id: <20200508222958.19e127d4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508101114.2331-1-weiyongjun1@huawei.com>
In-Reply-To: <20200508101114.2331-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 8 May 2020 10:11:14 +0000 Wei Yongjun wrote:
> Use the helper function that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you!
