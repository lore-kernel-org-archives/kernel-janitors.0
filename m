From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 16 Jul 2019 09:25:48 +0000
Subject: Re: [PATCH v3] coccinelle: semantic code search for missing of_node_put
Message-Id: <663d8141-5740-a452-1f4a-8335203e65ba@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1563246347-7803-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1563246347-7803-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>

> We find these functions by using the following script:

Why would you like to keep this SmPL code in the commit description?

I would prefer software evolution in an other direction.
https://lore.kernel.org/lkml/44be5924-26ca-5106-aa25-3cbc3343aa2c@web.de/
https://lkml.org/lkml/2019/7/4/21


> @initialize:ocaml@
> @@
>
> let relevant_str = "use of_node_put() on it when done"

I see further possibilities to improve this data processing approach.
https://lore.kernel.org/lkml/904b9362-cd01-ffc9-600b-0c48848617a0@web.de/
https://lore.kernel.org/patchwork/patch/1095169/#1291378
https://lkml.org/lkml/2019/6/28/326


I am missing more constructive answers for mentioned development concerns.


> And this patch also looks for places …

Does a SmPL script perform an action?


> Finally, this patch finds use-after-free issues for a node.
> (implemented by the r_use_after_put rule)

This software extension is another interesting contribution.
But I imagine that a separate SmPL script can be more helpful for
this source code search pattern.


> v3: delete the global set, …

To which previous implementation detail do you refer here?


> +virtual report
> +virtual org
> +
> +@initialize:python@
> +@@
> +
> +report_miss_prefix = "ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line "
> +report_miss_suffix = ", but without a corresponding object release within this function."
> +org_miss_main = "acquired a node pointer with refcount incremented"
> +org_miss_sec = "needed of_node_put"
> +report_use_after_put = "ERROR: use-after-free; reference preceded by of_node_put on line "
> +org_use_after_put_main = "of_node_put"
> +org_use_after_put_sec = "reference"

If you would insist on the usage of these variables, they should be applied
only for the selected analysis operation mode.
I would expect corresponding SmPL dependency specifications.
https://github.com/coccinelle/coccinelle/blob/b4509f6e7fb06d5616bb19dd5a110b203fd0e566/docs/manual/cocci_syntax.tex#L559


> +@r_miss_put exists@
> +local idexpression struct device_node *x;
> +expression e, e1;
> +position p1, p2;
> +statement S;
> +type T, T1;
> +@@
> +
> +* x = @p1\(of_find_all_nodes\|

The usage of the SmPL asterisk functionality can fit to the operation mode “context”.
https://bottest.wiki.kernel.org/coccicheck#modes
Would you like to add any corresponding SmPL details?

Under which circumstances will remaining programming concerns be clarified
for such SmPL disjunctions?


> +... when != e = (T)x
> +    when != true x == NULL

Will assignment exclusions get any more software development attention?
https://lore.kernel.org/lkml/03cc4df5-ce7f-ba91-36b5-687fec8c7297@web.de/
https://lore.kernel.org/patchwork/patch/1095169/#1291892
https://lkml.org/lkml/2019/6/29/193


> +    when != of_node_put(x)
…
> +)
> +&
> +x = f(...)
> +...
> +if (<+...x...+>) S
> +...
> +of_node_put(x);
> +)

You propose once more to use a SmPL conjunction in the rule “r_miss_put_ext”.
I am also still waiting for a definitive explanation on the applicability
of this combination.


> +@r_put@
> +expression E;
> +position p1;
> +@@
> +
> +* of_node_put@p1(E)

I guess that this SmPL code will need further adjustments.


> +@r_use_after_put exists@
> +expression r_put.E, subE<=r_put.E;

I have got an understanding difficulty around the interpretation
of the shown SmPL constraint.
How will the clarification be continued?

Regards,
Markus
