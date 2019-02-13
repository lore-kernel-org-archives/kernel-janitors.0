From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 13 Feb 2019 18:29:20 +0000
Subject: Re: [PATCH v3] Coccinelle: semantic patch for missing put_device()
Message-Id: <c10e0bf1-4830-7ee4-5b21-70b521dd6c36@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550039015-5587-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1550039015-5587-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Coccinelle <cocci@systeme.lip6.fr>

> The of_find_device_by_node() takes a reference to the underlying device
> structure, we should release that reference.

I have got another concern for further software development considerations.

How do you think about to describe here if it can be determined
by source code analysis that the desired release should be performed
only in the same function implementation (or not)?

How much does this aspect influence the source code search confidence?


> +    when != e1 = (T)id
> +    when != e2 = &id->dev
> +    when != e3 = get_device(&id->dev)
> +    when != e4 = (T1)platform_get_drvdata(id)

I have got another idea for a bit of software fine-tuning at such a place.
I am unsure if it can become relevant to reduce the number of metavariables
here by introducing a SmPL disjunction.

+    when != ex = \( (T)id \| &id->dev \| get_device(&id->dev) \| (T1)platform_get_drvdata(id) \)


Regards,
Markus
