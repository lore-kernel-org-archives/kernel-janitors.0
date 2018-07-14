From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Jul 2018 14:34:55 +0000
Subject: Re: [v2] Coccinelle: Replace strncpy() + truncation by strscpy()
Message-Id: <4bbe41a6-a9c6-ddd7-6683-14c792c16de0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1531555951-9627-1-git-send-email-asmadeus@codewreck.org>
In-Reply-To: <1531555951-9627-1-git-send-email-asmadeus@codewreck.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dominique Martinet <asmadeus@codewreck.org>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

I would like to contribute another bit of patch review for your proposal.

https://patchwork.kernel.org/patch/10524633/
https://lore.kernel.org/lkml/1531555951-9627-1-git-send-email-asmadeus@codewreck.org/


* I have noticed that an action word was missing in the commit subject.

* The commit description was started with the wording “Besides being simpler, …”.
  I would prefer an other ordering of information there.

  It seems that the mentioned compilation error gave you motivation for
  the shown source code transformation.
  I suggest to move the concrete update suggestion behind it.


> +virtual patch
> +virtual report
> +virtual org

How do you think about to reduce a bit of code repetition?

+virtual patch, report, org


> In particular, I have conciously not removed the intermediate msg
> variable; as I made the message longer I actually added one more of
> these for the org mode section.

I propose again to reconsider such an implementation detail once more
so that unnecessary Python code could be avoided.
The Linux coding style supports the usage of long message strings.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id-b39a2f491a48ec740e0214a7dd584eefc2137d#n81

Can string literals be nicer than extra variables (because of questionable
source code layout concerns)?

Regards,
Markus
