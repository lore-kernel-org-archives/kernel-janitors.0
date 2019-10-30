From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 30 Oct 2019 14:00:53 +0000
Subject: Re: [PATCH v5] coccicheck: Support search for SmPL scripts within selected directory hierarchy
Message-Id: <d86976ac-f12b-ba0a-fc96-57ece8741db5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1572404070-41580-1-git-send-email-zhong.shiqi@zte.com.cn>
In-Reply-To: <1572404070-41580-1-git-send-email-zhong.shiqi@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhong Shiqi <zhong.shiqi@zte.com.cn>, cocci@systeme.lip6.fr
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>

I got the impression that you are struggling with difficulties (for unknown reasons)
around adding space characters at some places.
How would you like to improve this situation?


> *Allow defining the environment variable “COCCI” as a directory to search
> SmPL scripts.
>
> *Start a corresponding file determination if it contains an acceptable
> path.

* Allow defining the environment variable “COCCI” as a directory
  to search SmPL scripts.

* Start a corresponding file determination if it contains
  an acceptable path.


Would you like to update the provided software documentation together with
the small extension of this bash script?

Update candidates:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/dev-tools/coccinelle.rst?id=23fdb198ae81f47a574296dab5167c5e136a02ba#n189

* https://bottest.wiki.kernel.org/coccicheck#controlling_which_files_are_processed_by_coccinelle


> ---

‣ Would you find the patch change log sufficient without the information
  “Changes in”?

‣ I find the specification “1:” unnecessary before a single description item.

Regards,
Markus
