From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 30 Oct 2019 08:40:55 +0000
Subject: Re: [v4] coccicheck: Support search for SmPL scripts within selected directory hierarchy
Message-Id: <d457995b-fed3-d560-e6b3-b8fa4b0059a0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201910301059095572036@zte.com.cn>
In-Reply-To: <201910301059095572036@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhong Shiqi <zhong.shiqi@zte.com.cn>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>

>> Please reconsider also the section “Using Coccinelle with a single semantic patch”:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/dev-tools/coccinelle.rst?id=f877bee5ea0b56c39cd0a243e113a577b5a4ef92#n151
>
> Could we add new lines?

Yes, of course.


> How about the following?

I suggest to improve the case distinction for the make (and environment)
variable “COCCI” also by adjusting the document outline.
* Empty string
* Directory selection
* File name specification

See also:
https://docutils.readthedocs.io/en/sphinx-docs/user/rst/quickstart.html#sections


> The optional make variable COCCI can be used to search SmPL scripts in a
> directory. In that case, the variable must be initialized with the name of

… it should be set to …


> directory contains SmPL scripts.

a directory which contains scripts for the semantic patch language.

Regards,
Markus
