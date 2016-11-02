From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 02 Nov 2016 17:38:33 +0000
Subject: Re: scripts/basic/fixdep: Complete error handling in print_cmdline()
Message-Id: <3e08ed31-b8bf-cba0-67f8-0a66d0cdeeb4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <d4bd9a09-d413-a073-c2d5-67933d425b87@users.sourceforge.net>
 <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
 <CAK7LNASYQCokO7bL72gs6zLrMNx_Sos1So87=bGMCTX_4gowGw@mail.gmail.com>
In-Reply-To: <CAK7LNASYQCokO7bL72gs6zLrMNx_Sos1So87=bGMCTX_4gowGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jim Davis <jim.epost@gmail.com>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>> +       if (printf("cmd_%s := %s\n\n", target, cmdline) < 10) {
>>
>> Rather than scatter fragile magic numbers, like 10, throughout the
>> code, if you're hell-bent on checking for printf errors you could
>> write a little wrapper function that hid the magic number and bundled
>> up the errno stuff.
> 
> 
> BTW, how the magic number "10" was calculated?

Does the passed format string indicate how many characters should be
printed at least?

Regards,
Markus
