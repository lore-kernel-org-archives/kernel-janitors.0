From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 27 Apr 2018 00:22:09 +0000
Subject: Re: [PATCH 31/61] net: dsa: simplify getting .drvdata
Message-Id: <4c0bae0e-6338-b6ae-4296-d16c40a7c770@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-32-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-32-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, netdev@vger.kernel.org

On 04/19/2018 07:06 AM, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.

Similar to my other comment on patch 4, would not you want to use
dev_set_drvdata() to be consistent? This would be functionally equivalent.
--
Florian
