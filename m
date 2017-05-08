From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 08 May 2017 20:19:20 +0000
Subject: Re: [PATCH] xtensa: Use seq_puts() in c_show()
Message-Id: <CAMo8BfL7UDjXzBc6k5KwEGbEb_hkqtt=HHOP_q8A3M__dBwQBQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4fc3f37-799c-397e-62b8-c7f4a7d974f9@users.sourceforge.net>
In-Reply-To: <f4fc3f37-799c-397e-62b8-c7f4a7d974f9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Chris Zankel <chris@zankel.net>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Kefeng Wang <wangkefeng.wang@huawei.com>, Rob Herring <robh@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, May 7, 2017 at 12:33 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 7 May 2017 21:24:51 +0200
>
> A string which did not contain a data format specification should be put
> into a sequence. Thus use the corresponding function "seq_puts".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/xtensa/kernel/setup.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks, applied to my xtensa-fixes branch.

-- Max
