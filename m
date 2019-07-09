From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 09 Jul 2019 16:14:16 +0000
Subject: Re: [PATCH 0/2] fix use-after-free in mpc831x_usb_cfg() and do some cleanups
Message-Id: <4e7b5f40-e619-3c42-0ae9-0164ad3ecde9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1562670768-23178-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1562670768-23178-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, Xue Zhihong <xue.zhihong@zte.com.cn>

> According to Markus's suggestion, split it into two small patches:

> https://lkml.org/lkml/2019/7/8/520

Thanks that you picked adjustment possibilities up from my feedback.
https://lore.kernel.org/lkml/99840e11-e0e6-b3f4-e35b-56ef4ec39417@web.de/


Now I wonder why you omitted message recipients from the cover letter.
Please keep the address lists usually complete also here for improvements
on the same source file in subsequent patch series.


Can a subject like “[PATCH 0/2] Fix mpc831x_usb_cfg()” be more succinct?


>  powerpc/83xx: fix use-after-free in mpc831x_usb_cfg()


This update variant is generally fine.
I would prefer to avoid the addition of function calls at two places
when the corresponding exception handling should be specified only once
at the end of such a function implementation.


>  powerpc/83xx: cleanup error paths in mpc831x_usb_cfg()

I would find it clearer to fix the error handling in the first update
step completely.
I guess that a renaming of the label “out” into “out_unmap” (or “unmap_io”?)
would be an auxiliary change for the second update step.


I am curious if different preferences for change combinations will trigger
further collateral evolution.

Regards,
Markus
