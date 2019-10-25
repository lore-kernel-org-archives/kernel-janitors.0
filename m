From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 25 Oct 2019 07:42:17 +0000
Subject: Re: [PATCH v3] coccicheck: Support search for SmPL scripts within selected directory hierarchy
Message-Id: <14f7a50d-63f5-343f-70e8-6b42ab5baa4c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1571966374-42566-1-git-send-email-zhong.shiqi@zte.com.cn>
In-Reply-To: <1571966374-42566-1-git-send-email-zhong.shiqi@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhong Shiqi <zhong.shiqi@zte.com.cn>, cocci@systeme.lip6.fr
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>

> Allow defining COCCI as a directory to search SmPL scripts. Start a
> corresponding file determination if the environment variable “COCCI”
> contains an acceptable path.

Can another wording fine-tuning matter for such a change description?

  * Allow defining the environment variable “COCCI” as a directory
    to search SmPL scripts.

  * Start a corresponding file determination if it contains an acceptable path.

Regards,
Markus
