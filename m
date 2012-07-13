From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Jul 2012 20:47:58 +0000
Subject: Re: [input:next 43/45] drivers/input/keyboard/omap4-keypad.c:218:6: warning: unused variable 'error'
Message-Id: <5072230.2etiZPh4nE@dtor-d630.eng.vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120713202305.GA26333@localhost>
In-Reply-To: <20120713202305.GA26333@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Sourav Poddar <sourav.poddar@ti.com>, kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org

On Saturday, July 14, 2012 04:23:05 AM Fengguang Wu wrote:
> Hi Sourav,
> 
> There are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> head:   7545a8052565aa68eeb4dfb59c1fb5d21a6867e7
> commit: 3dad34659e6646ab578d82b75a023cc4640fe322 [43/45] Input: omap4-keypad
> - add device tree support
> 
> All warnings:
> 
> drivers/input/keyboard/omap4-keypad.c: In function 'omap4_keypad_parse_dt':
> drivers/input/keyboard/omap4-keypad.c:218:6: warning: unused variable
> 'error' [-Wunused-variable]
> 
> vim +218 drivers/input/keyboard/omap4-keypad.c
>    215						   struct omap4_keypad *keypad_data)
>    216	{
>    217		struct device_node *np = dev->of_node;
> 
>  > 218		int error;
> 
>    219
>    220		if (!np) {
>    221			dev_err(dev, "missing DT data");

Hmm, must be me; I'll zap it later tonight.

-- 
Dmitry
