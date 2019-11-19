From: Dan Murphy <dmurphy@ti.com>
Date: Tue, 19 Nov 2019 17:27:45 +0000
Subject: Re: [PATCH][next] net: phy: dp83869: fix return of uninitialized variable ret
Message-Id: <1346c899-2114-875a-68a7-4ce0c08307dc@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191118114835.39494-1-colin.king@canonical.com>
 <20191118232912.GC15395@lunn.ch>
In-Reply-To: <20191118232912.GC15395@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Colin King <colin.king@canonical.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Andrew

On 11/18/19 5:29 PM, Andrew Lunn wrote:
> On Mon, Nov 18, 2019 at 11:48:35AM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> In the case where the call to phy_interface_is_rgmii returns zero
>> the variable ret is left uninitialized and this is returned at
>> the end of the function dp83869_configure_rgmii.  Fix this by
>> returning 0 instead of the uninitialized value in ret.
>>
>> Addresses-Coverity: ("Uninitialized scalar variable")
>> Fixes: 01db923e8377 ("net: phy: dp83869: Add TI dp83869 phy")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
> Dan: phy_modify_mmd() could fail. You check the return value for
> phy_read and phy_write, so it would be consistent to also check

Thanks for the heads up on this.

I need to check the set/clear_mmd bits too.

Dan


> 	 Andrew
