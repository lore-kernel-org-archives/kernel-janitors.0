From: Colin Cross <ccross@android.com>
Date: Mon, 27 Aug 2012 18:20:46 +0000
Subject: Re: [leds:for-next 12/12] drivers/leds/led-triggers.c:109:9: error: 'trigger' undeclared (first use
Message-Id: <CAMbhsRTe=HVqmeScygS0HJ65qM9A531aX3zRSuZHDLZf4bdt8w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 27, 2012 at 9:55 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Colin,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds.git for-next
> head:   eb28c03e49a43b787a5670e706e7c0aacff23016
> commit: eb28c03e49a43b787a5670e706e7c0aacff23016 [12/12] leds: triggers: send uevent when changing triggers
> config: i386-allmodconfig (attached as .config)
>
> All related error/warning messages:
>
> drivers/leds/led-triggers.c:109:16: sparse: undefined identifier 'trigger'
> drivers/leds/led-triggers.c: In function 'led_trigger_set':
> drivers/leds/led-triggers.c:109:9: error: 'trigger' undeclared (first use in this function)
> drivers/leds/led-triggers.c:109:9: note: each undeclared identifier is reported only once for each function it appears in
>
> vim +109 drivers/leds/led-triggers.c
>    106          char *envp[2];
>    107          const char *name;
>    108
>  > 109          name = trigger ? trigger->name : "none";
>    110          event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
>    111
>    112          /* Remove any existing trigger */

This is caused by a variable rename in
eb202621f8c0fb264a35e1b35fc00bdb3114a897 (led-triggers: rename
*trigger to *trig for unified naming scheme).  Bryan, do you want to
rename trigger to trig on line 109, or should I post a new patch?
