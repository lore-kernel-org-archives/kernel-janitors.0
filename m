From: Robert Richter <robert.richter@amd.com>
Date: Mon, 15 Oct 2012 14:39:12 +0000
Subject: Re: [patch] x86/oprofile: fix wrapping bug in op_x86_get_ctrl()
Message-Id: <20121015143912.GP8285@erda.amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121010071835.GA26201@elgon.mountain>
In-Reply-To: <20121010071835.GA26201@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10.10.12 10:18:35, Dan Carpenter wrote:
> The "event" variable is a u16 so the shift will always wrap to zero
> making the line a no-op.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied. Thanks for reporting and fixing.

-Robert

-- 
Advanced Micro Devices, Inc.
Operating System Research Center

