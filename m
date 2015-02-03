From: walter harms <wharms@bfs.de>
Date: Tue, 03 Feb 2015 12:32:10 +0000
Subject: Re: [PATCH 2/2] sata_mv: More error handling for phy_power_off() in mv_platform_remove()
Message-Id: <54D0BFCA.1090800@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54D08871.6030304@users.sourceforge.net>
In-Reply-To: <54D08871.6030304@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 03.02.2015 13:10, schrieb Tejun Heo:
> On Tue, Feb 03, 2015 at 09:36:01AM +0100, SF Markus Elfring wrote:
> ...
>> @@ -4215,7 +4215,9 @@ static int mv_platform_remove(struct platform_device *pdev)
>>  			clk_disable_unprepare(hpriv->port_clks[port]);
>>  			clk_put(hpriv->port_clks[port]);
>>  		}
>> -		phy_power_off(hpriv->port_phys[port]);
>> +		rc = phy_power_off(hpriv->port_phys[port]);
>> +		if (rc)
>> +			return rc;
> 
> So, this is a removal function which is ignoring failure from turning
> off phy, which seems like the right thing to do.  The same thing with
> suspend routines.  If something auxliary which isn't strictly
> necessary in reaching suspend state fails, the failure should be
> ignored.
> 
> Running static code analysis to locate trivial irregularities and
> performing identity transformations is fine, even great, but you're
> changing the behavior here without actually understanding what's going
> on.  Please don't do these things automatically.
> 
> Thanks.
> 

maybe this can be changed into
  (void) phy_power_off(hpriv->port_phys[port]);

that would tell the compiler and other readers that this is intentional.

