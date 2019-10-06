From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 06 Oct 2019 05:21:01 +0000
Subject: Re: [Cocci] [RFC] scripts: Fix coccicheck failed
Message-Id: <f64fc086-7852-b074-6247-108b753dc272@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAS2K6i+s2A_xTyRq730M6_=tyjtfwHAnEHF37_nrJa4Eg@mail.gmail.com>
 <21684307-d05c-1856-c849-95436aedeb86@web.de>
 <alpine.DEB.2.21.1910051425050.2653@hadrien>
In-Reply-To: <alpine.DEB.2.21.1910051425050.2653@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Martijn Coenen <maco@android.com>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Yue Haibing <yuehaibing@huawei.com>
Cc: linux-kernel@vger.kernel.org

>> Would you like to take the change possibility into account
>> that the coccicheck system configuration should be adapted instead?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccicheck?id=4ea655343ce4180fe9b2c7ec8cb8ef9884a47901#n257
>
> I prefer the one line change for now.  If more issues arise one can see
> what is more desirable at a larger scale.

I got the impression that the script “add_namespace.cocci” should never
be automatically called by the current default setting of the tool “coccicheck”
also because it requires the input parameter “name space” (SmPL identifier “virtual.ns”).
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/coccinelle/misc/add_namespace.cocci?id=eb8305aecb958e8787e7d603c7765c1dcace3a2b

Would you like to increase your software development attention for
efficient system configuration on this issue?

Regards,
Markus
