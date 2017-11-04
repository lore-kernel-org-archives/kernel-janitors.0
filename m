From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 04 Nov 2017 15:03:26 +0000
Subject: Re: sr9800: Use common error handling code in sr9800_phy_powerup()
Message-Id: <78748ef8-5d0d-f0e8-bce4-5e6f29c89089@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <10f2b5a4-1dbd-2c4f-caaa-4225dff35296@users.sourceforge.net>
 <CAMuHMdU6K+KPZvsStfwPev9Z5v1RRYAwLr04FHjmeC=VUEMC+Q@mail.gmail.com>
 <0600e4f9-dd53-158c-556b-8a87dfc928e6@users.sourceforge.net>
 <CAMuHMdWpaohd4rFxLzBaBDE2v79487Ak8WQjJpjR465wnRvhXA@mail.gmail.com>
In-Reply-To: <CAMuHMdWpaohd4rFxLzBaBDE2v79487Ak8WQjJpjR465wnRvhXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Geert Uytterhoeven <geert@linux-m68k.org>, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Cc: =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>, "David S. Miller" <davem@davemloft.net>, Greg Ungerer <gerg@linux-m68k.org>, Liu Junliang <liujunliang_ljl@163.com>, Philippe Reynes <tremyfr@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> If you play the "smaller executable object code" card, people expect that
> you provide the actual numbers, too.

I can offer another bit of information for this software development discussion.

The affected source file can be compiled for the processor architecture “x86_64”
by a tool like “GCC 6.4.1+r251631-1.3” from the software distribution
“openSUSE Tumbleweed” with the following command example.

my_cc=/usr/bin/gcc-6 \
&& my_module=drivers/net/usb/sr9800.ko \
&& git checkout next-20171009 \
&& make -j4 CC="${my_cc}" HOSTCC="${my_cc}" allmodconfig "${my_module}" \
&& size "${my_module}" \
&& git checkout ':/^sr9800: Use common error handling code in sr9800_phy_powerup' \
&& make -j4 CC="${my_cc}" HOSTCC="${my_cc}" allmodconfig "${my_module}" \
&& size "${my_module}"


Do you find the following details useful for further clarification?

text: -47
data: 0
bss:  0

Regards,
Markus
