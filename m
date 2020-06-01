From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jun 2020 14:00:33 +0000
Subject: Re: [1/2] ubifs: Fix potential memory leaks while iterating entries
Message-Id: <4fe27809-552e-ea98-ba1f-cbf68e625d22@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2bec05b7-78d3-fa36-134a-efbe977933e3@web.de>
 <45e2cd69-93ec-a0b9-b2a6-d170eee44055@huawei.com>
In-Reply-To: <45e2cd69-93ec-a0b9-b2a6-d170eee44055@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Yi Zhang <yi.zhang@huawei.com>

>> I suggest to avoid the specification of duplicate function calls
>> (also for the desired exception handling).
>> Will it be helpful to add a few jump targets?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162#n455
> I've thought about using "goto err_tag_2" in kill_xattrs code block to release prev xent,

I propose to choose better labels.


> but later it needs to jump to 'out_release tag‘ for releasing previously requested memory,
> which can clutter the code.

Would you like to reconsider this view?


> It seems that two consecutive 'goto tags' will make the code less readable.

How do you think about to try another software adjustment out in such a design direction?


Can it make sense to combine changes together with the update step
“ubifs: dent: Fix some potential memory leaks while iterating entries”
into a single patch?
https://lore.kernel.org/linux-mtd/20200601091037.3794172-2-chengzhihao1@huawei.com/
https://lore.kernel.org/patchwork/patch/1250456/

Regards,
Markus
