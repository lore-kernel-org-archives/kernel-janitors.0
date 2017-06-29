From: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 29 Jun 2017 13:11:05 +0000
Subject: Re: [bug report] device property: Move FW type specific functionality to FW specific files
Message-Id: <9a4eaa40-2408-1731-93db-a921d11b2ac2@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170629130056.xtcf35gxw76ib6gs@mwanda>
In-Reply-To: <20170629130056.xtcf35gxw76ib6gs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 06/29/17 16:04, Dan Carpenter wrote:
> Also on the next lines:
> drivers/base/property.c:259 fwnode_property_present() warn: assigning (-6) to unsigned variable 'ret'
> 
> And really it should have complained about fwnode_device_is_available()
> but it doesn't.

Will fix.

Thanks, Dan!

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
