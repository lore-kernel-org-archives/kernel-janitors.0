From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 13 Feb 2019 19:52:21 +0000
Subject: Re: [PATCH v3] Coccinelle: semantic patch for missing put_device()
Message-Id: <alpine.DEB.2.21.1902132050200.2655@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550039015-5587-1-git-send-email-wen.yang99@zte.com.cn>
 <c10e0bf1-4830-7ee4-5b21-70b521dd6c36@web.de>
In-Reply-To: <c10e0bf1-4830-7ee4-5b21-70b521dd6c36@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Yi Wang <wang.yi59@zte.com.cn>, kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>, Xue Zhihong <xue.zhihong@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>



On Wed, 13 Feb 2019, Markus Elfring wrote:

> > The of_find_device_by_node() takes a reference to the underlying device
> > structure, we should release that reference.
>
> I have got another concern for further software development considerations.
>
> How do you think about to describe here if it can be determined
> by source code analysis that the desired release should be performed
> only in the same function implementation (or not)?
>
> How much does this aspect influence the source code search confidence?
>
>
> > +    when != e1 = (T)id
> > +    when != e2 = &id->dev
> > +    when != e3 = get_device(&id->dev)
> > +    when != e4 = (T1)platform_get_drvdata(id)
>
> I have got another idea for a bit of software fine-tuning at such a place.
> I am unsure if it can become relevant to reduce the number of metavariables
> here by introducing a SmPL disjunction.
>
> +    when != ex = \( (T)id \| &id->dev \| get_device(&id->dev) \| (T1)platform_get_drvdata(id) \)

There is no need for the disjunction.  There is also no need for the
different variables.  Different variables are only needed when the when
conditions are on different ...s

julia

>
>
> Regards,
> Markus
>
