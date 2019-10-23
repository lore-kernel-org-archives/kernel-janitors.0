From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 23 Oct 2019 14:08:45 +0000
Subject: Re: [PATCH] coccicheck: Configuring COCCI parameter for supporting a directory search
Message-Id: <2dc38508-b7af-b5bf-2829-52c75514e499@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1910231054250.2335@hadrien>
In-Reply-To: <alpine.DEB.2.21.1910231054250.2335@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, zhongshiqi <zhong.shiqi@zte.com.cn>

> What is the relation between the last two if branches?

A small addition is proposed for this bash script.


> If the first one fails, does that mean that $COCCI has no definition?

No. - It was checked if an empty sting was passed.
A file system check is tried then to determine if a valid directory was specified.
This parameter could be used then for the specification of a specific start
directory for calling the tool “find”, couldn't it?


> In that case, is the final else useful?

Hopefully, yes.

Which software behaviour do you expect for a string which would not
be recognised as an usable directory in a specific moment
during script execution?

Regards,
Markus
