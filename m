From: Zhihao Cheng <chengzhihao1@huawei.com>
Date: Mon, 01 Jun 2020 13:45:44 +0000
Subject: Re: [PATCH 1/2] ubifs: Fix potential memory leaks while iterating entries
Message-Id: <45e2cd69-93ec-a0b9-b2a6-d170eee44055@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2bec05b7-78d3-fa36-134a-efbe977933e3@web.de>
In-Reply-To: <2bec05b7-78d3-fa36-134a-efbe977933e3@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Yi Zhang <yi.zhang@huawei.com>

在 2020/6/1 20:00, Markus Elfring 写道:
>> Fix some potential memory leaks in error handling branches while
>> iterating xattr entries.
> Such information is useful.
>
>
>> For example, function ubifs_tnc_remove_ino()
>> forgets to free pxent if it exists. Similar problems also exist in
>> ubifs_purge_xattrs(), ubifs_add_orphan() and ubifs_jnl_write_inode().
> Can an other wording variant be a bit nicer?
Thanks for reminding, I will improve this description.
>
> I suggest to avoid the specification of duplicate function calls
> (also for the desired exception handling).
> Will it be helpful to add a few jump targets?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=77e6a8804abcc0504c904bd6e5cdf3a5cf8162#n455
I've thought about using "goto err_tag_2" in kill_xattrs code block to 
release prev xent, but later it needs to jump to 'out_release tag‘ for 
releasing previously requested memory, which can clutter the code. It 
seems that two consecutive 'goto tags' will make the code less readable.
> Regards,
> Markus
>
> .
