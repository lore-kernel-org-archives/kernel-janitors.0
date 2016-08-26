From: Ley Foon Tan <lftan@altera.com>
Date: Fri, 26 Aug 2016 03:13:48 +0000
Subject: Re: [Nios2-dev] [PATCH] nios2: use of_property_read_bool
Message-Id: <CAFiDJ5_gxybQrZL0s9TwhAxqFC8k3URxUpqQAXyRJ_Cp+MdiZg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160810122724.9398-1-tklauser@distanz.ch>
In-Reply-To: <20160810122724.9398-1-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tobias Klauser <tklauser@distanz.ch>
Cc: "nios2-dev@lists.rocketboards.org" <nios2-dev@lists.rocketboards.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 10, 2016 at 8:27 PM, Tobias Klauser <tklauser@distanz.ch> wrote:
> Use of_property_read_bool instead of open-coding it as fpcu_has. Convert
> the members of struct cpuinfo from u32 to bool accordingly as they are
> only used as boolean anyhow.
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
Acked-by: Ley Foon Tan <lftan@altera.com>

Thanks.

> ---
>  arch/nios2/include/asm/cpuinfo.h |  8 ++++----
>  arch/nios2/kernel/cpuinfo.c      | 15 +++++----------
>  2 files changed, 9 insertions(+), 14 deletions(-)
>
