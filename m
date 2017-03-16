From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 16 Mar 2017 04:28:36 +0000
Subject: Re: [PATCH v3 4/7] macintosh: Only descend into directory when CONFIG_MACINTOSH_DRIVERS is set
Message-Id: <87var9u9or.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170315163730.17055-1-afd@ti.com> <20170315163730.17055-5-afd@ti.com>
In-Reply-To: <20170315163730.17055-5-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org
Cc: linux-pwm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org

"Andrew F. Davis" <afd@ti.com> writes:

> When CONFIG_MACINTOSH_DRIVERS is not set make will still descend into the
> macintosh directory but nothing will be built. This produces unneeded
> build artifacts and messages in addition to slowing the build.
> Fix this here.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  drivers/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheersj
