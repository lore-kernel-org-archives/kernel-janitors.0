From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 02 Nov 2016 15:35:32 +0000
Subject: Re: [PATCH 09/10] scripts/basic/fixdep: Complete error handling in print_cmdline()
Message-Id: <CAK7LNASYQCokO7bL72gs6zLrMNx_Sos1So87=bGMCTX_4gowGw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <d4bd9a09-d413-a073-c2d5-67933d425b87@users.sourceforge.net> <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
In-Reply-To: <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Davis <jim.epost@gmail.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

2016-10-29 8:42 GMT+09:00 Jim Davis <jim.epost@gmail.com>:
> On Fri, Oct 28, 2016 at 1:40 AM, SF Markus Elfring
> <elfring@users.sourceforge.net> wrote:
>
>> +       if (printf("cmd_%s := %s\n\n", target, cmdline) < 10) {
>
> Rather than scatter fragile magic numbers, like 10, throughout the
> code, if you're hell-bent on checking for printf errors you could
> write a little wrapper function that hid the magic number and bundled
> up the errno stuff.


BTW, how the magic number "10" was calculated?




-- 
Best Regards
Masahiro Yamada
