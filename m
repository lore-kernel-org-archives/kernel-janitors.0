From: Heiko Stuebner <heiko@sntech.de>
Date: Sat, 30 Sep 2017 10:43:09 +0000
Subject: Re: [PATCH] clk: rockchip: Delete an error message for a failed memory allocation in rockchip_clk_re
Message-Id: <3649654.h95jfH98gt@phil>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dfcd3f8a-f858-ab71-b08c-e5b2e3005d7c@users.sourceforge.net>
In-Reply-To: <dfcd3f8a-f858-ab71-b08c-e5b2e3005d7c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Am Mittwoch, 27. September 2017, 11:44:30 CEST schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Sep 2017 11:38:17 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

applied for 4.15 after shortening the patch subject a bit


Thanks
Heiko
