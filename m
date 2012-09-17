From: Haojian Zhuang <haojian.zhuang@gmail.com>
Date: Mon, 17 Sep 2012 05:01:28 +0000
Subject: Re: [hzhuang1:testing/88pm860x 24/31] drivers/mfd/max8925-core.c:626:10: error: too few arguments to
Message-Id: <CAN1soZxCHRGSaunH8iyvgV6rddkexKymL4QPRLPAT9-KqTvOcw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120916215208.GA5637@localhost>
In-Reply-To: <20120916215208.GA5637@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Sep 17, 2012 at 5:52 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Haojian,
>
> FYI, kernel build failed on
>
> tree:   git://github.com/hzhuang1/linux.git testing/88pm860x
> head:   87111113a97218c173305b8f01ee7f8977b5d12d
> commit: d65270f70ae9c24d17916ca30a4cc67b5018373c [24/31] mfd: max8925: use register offset as REG in backlight
> config: i386-randconfig-b013 (attached as .config)
>
> All related error/warning messages:
>
> drivers/mfd/max8925-core.c: In function 'max8925_device_init':
> drivers/mfd/max8925-core.c:626:10: error: too few arguments to function 'mfd_add_devices'
> In file included from drivers/mfd/max8925-core.c:18:0:
> include/linux/mfd/core.h:100:12: note: declared here
>

Fixed. Thanks

Regards
Haojian
