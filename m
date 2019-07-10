From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 10 Jul 2019 07:19:18 +0000
Subject: Re: [1/2] powerpc/83xx: fix use-after-free in mpc831x_usb_cfg()
Message-Id: <3138c2fa-1e99-f672-2108-33dd1cf25ca2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1562670768-23178-2-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1562670768-23178-2-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <wen.yang99@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Markus.Elfring@web.de, Xue Zhihong <xue.zhihong@zte.com.cn>, Paul Mackerras <paulus@samba.org>

> The immr_node variable is still being used after the of_node_put() call,
> which may result in use-after-free.

Was any known source code analysis tool involved to point such
a questionable implementation detail out for further software
development considerations?

Regards,
Markus
