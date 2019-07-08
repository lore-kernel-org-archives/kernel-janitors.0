From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 08 Jul 2019 15:21:48 +0000
Subject: Re: powerpc/83xx: fix use-after-free on mpc831x_usb_cfg()
Message-Id: <99840e11-e0e6-b3f4-e35b-56ef4ec39417@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1562317084-13140-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1562317084-13140-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, Xue Zhihong <xue.zhihong@zte.com.cn>

> The np variable is still being used after the of_node_put() call,

> which may result in use-after-free.

> We fix this issue by calling of_node_put() after the last usage.


I imagine that this commit description can be improved a bit more
(by mentioning the influence of “immr_node”?).
How do you think about to omit the word “We” here?


> This patatch also do some cleanup.


Should the renaming of a jump label be contributed in a separate update
step of a small patch series besides a wording without a typo?

Regards,
Markus
