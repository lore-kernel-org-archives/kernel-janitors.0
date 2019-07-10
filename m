From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 10 Jul 2019 09:24:45 +0000
Subject: Re: [1/2] powerpc/83xx: fix use-after-free in mpc831x_usb_cfg()
Message-Id: <ef968d9a-785e-dbf7-dfe6-9572fc241e63@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201907101533443009168@zte.com.cn>
In-Reply-To: <201907101533443009168@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <wen.yang99@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, Xue Zhihong <xue.zhihong@zte.com.cn>

> we developed a coccinelle script to detect such problems.

How do you think about to give any attribution to this development software
in your commit descriptions?


> After a period of testing, we will send it to the LMKL mailing list later.

I am also curious then on how this area will evolve further.

Regards,
Markus
