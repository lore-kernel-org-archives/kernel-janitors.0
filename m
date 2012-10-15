From: Dong Aisheng <dong.aisheng@linaro.org>
Date: Mon, 15 Oct 2012 08:26:14 +0000
Subject: Re: [mfd:for-next 29/86] drivers/mfd/syscon.c:94:15: error: variable 'syscon_regmap_config' has init
Message-Id: <CAP1dx+x1HAqSCi2Gf00b3qUAvMDYn1RY587GwavYov2q_T1i_Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121014095346.GA26805@localhost>
In-Reply-To: <20121014095346.GA26805@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

On 14 October 2012 17:53, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Dong,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-2.6.git for-next
> head:   74d8378159de16a0a1d1975d4778120d263d6000
> commit: 87d687301f380729ec320619f100f3ba39f3693d [29/86] mfd: Add syscon driver based on regmap
> config: i386-randconfig-m062 (attached as .config)
>
> All error/warnings:
>
> drivers/mfd/syscon.c:94:15: error: variable 'syscon_regmap_config' has initializer but incomplete type
> drivers/mfd/syscon.c:95:2: error: unknown field 'reg_bits' specified in initializer

It looks regmap_mmio is not compiled even REGMAP_MMIO is selected.
I just sent out the fix patch with you and Samuel Cced.

Regards
Dong Aisheng
