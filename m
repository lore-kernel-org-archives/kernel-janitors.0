From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 24 Oct 2019 07:06:27 +0000
Subject: Re: [PATCH v2] coccicheck: support $COCCI being defined as a directory
Message-Id: <5762844f-2c39-2106-21fa-65e8297d4235@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1571897060-32374-1-git-send-email-zhong.shiqi@zte.com.cn>
In-Reply-To: <1571897060-32374-1-git-send-email-zhong.shiqi@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhong Shiqi <zhong.shiqi@zte.com.cn>, cocci@systeme.lip6.fr
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>

I find that the commit message should still be considerably improved.
How do you think about to use the subject “[PATCH] coccicheck:
Support search for SmPL scripts within selected directory hierarchy”?


> Put a modification in scripts/coccicheck which supports users in
> configuring COCCI parameter as a directory to traverse files in
> directory whose next level directory contains rule files with Suffix of cocci.

* Please avoid a typo in this change description.

* Would you like to integrate a wording approach like the following?

  A search can be performed for SmPL scripts within a directory hierarchy.
  Start a corresponding file determination if the environment variable “COCCI”
  contains an acceptable path.


Regards,
Markus
