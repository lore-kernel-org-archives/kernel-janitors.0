From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 05 Oct 2019 17:49:46 +0000
Subject: Re: [Cocci] [RFC] scripts: Fix coccicheck failed
Message-Id: <c23dae0b-9cfb-7a61-eb09-f1654040e635@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAS2K6i+s2A_xTyRq730M6_=tyjtfwHAnEHF37_nrJa4Eg@mail.gmail.com>
 <21684307-d05c-1856-c849-95436aedeb86@web.de>
 <alpine.DEB.2.21.1910051425050.2653@hadrien>
In-Reply-To: <alpine.DEB.2.21.1910051425050.2653@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Yue Haibing <yuehaibing@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, linux-kernel@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Martijn Coenen <maco@android.com>

>> Would you like to take the change possibility into account
>> that the coccicheck system configuration should be adapted instead?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccicheck?id=4ea655343ce4180fe9b2c7ec8cb8ef9884a47901#n257
>
> I prefer the one line change for now.

Thanks for this information.


> If more issues arise one can see what is more desirable at a larger scale.

I suggest to reconsider the corresponding software design consequences now.

* Do you accept only SmPL scripts which will work together with
  the operation mode “report” of the tool “coccicheck”?

* Under which circumstances will your change resistance evolve in the way
  that a clear file type separation can be applied finally?

Regards,
Markus
