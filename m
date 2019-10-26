From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 26 Oct 2019 14:12:54 +0000
Subject: Re: [PATCH v4] coccicheck: Support search for SmPL scripts within selected directory hierarchy
Message-Id: <4905e8f0-6266-99b4-c3c4-9a9d29170bfc@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1572076248-43770-1-git-send-email-zhong.shiqi@zte.com.cn>
In-Reply-To: <1572076248-43770-1-git-send-email-zhong.shiqi@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhong Shiqi <zhong.shiqi@zte.com.cn>, cocci@systeme.lip6.fr
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>

> Allow defining the environment variable “COCCI” as a directory
> to search SmPL scripts. Start a corresponding file determination
> if it contains an acceptable path.

Would the paragraph formatting be nicer as an enumeration
as I suggested it previously?


Would you like to update the provided software documentation together with
the small extension of this bash script?

Update candidates:
*

* https://bottest.wiki.kernel.org/coccicheck#controlling_which_files_are_processed_by_coccinelle

Regards,
Markus
