From: Shawn Guo <shawn.guo@linaro.org>
Date: Tue, 09 Oct 2018 10:31:15 +0000
Subject: Re: [PATCH] phy: inno-usb2-phy: fix off-by-one comparison on port number
Message-Id: <CAAQ0ZWTOo8xr22f+kmeY+mrhGKgacCfCTaqO=zEewLuWGWvDYw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181008222417.11739-1-colin.king@canonical.com>
In-Reply-To: <20181008222417.11739-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Oct 9, 2018 at 6:24 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the range check on the port index is off-by-one and a potential
> out of bounds write can occur on priv->ports[i]. Fix this by checking the
> maximum port using >= INNO_PHY_PORT_NUM rather than > INNO_PHY_PORT_NUM.
>
> Detected by CoverityScan, CID#1466118 ("Out-of-bounds write")
>
> Fixes: ba8b0ee81fbb ("phy: add inno-usb2-phy driver for hi3798cv200 SoC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
