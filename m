From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 27 Apr 2018 14:47:26 +0000
Subject: Re: [PATCH] firmware: arm_scmi: Use after free in scmi_create_protocol_device()
Message-Id: <23e2c622-8903-1207-4bce-58b3e8b51de7@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180427140649.GD19583@mwanda>
In-Reply-To: <20180427140649.GD19583@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org



On 27/04/18 15:06, Dan Carpenter wrote:
> We need to return here instead of setting up the freed sdev device as a
> transport.
> 
> Fixes: 907b6d14911d ("firmware: arm_scmi: add per-protocol channels support using idr objects")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the fix, will send to ARM-SoC in the next round.

-- 
Regards,
Sudeep
