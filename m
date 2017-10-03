From: Sudeep Holla <sudeep.holla@arm.com>
Date: Tue, 03 Oct 2017 14:21:25 +0000
Subject: Re: [PATCH] ARM: vexpress/spc: Delete an error message for a failed memory allocation in two functio
Message-Id: <eb4e21f3-f16c-e640-80b2-0d12b01ea4e2@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <557666e2-45b6-8f47-2fc9-756bd7f23541@users.sourceforge.net>
In-Reply-To: <557666e2-45b6-8f47-2fc9-756bd7f23541@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hi,

I am not sure if such trivial patches get merged by someone via
kernel-janitors list with just maintainers ack or not. Please let
me know if you want me to pickup this, for now I am just Ack-ing.

On 03/10/17 09:40, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 3 Oct 2017 10:30:07 +0200
> 
> Omit extra messages for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
