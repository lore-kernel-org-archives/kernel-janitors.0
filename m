From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 01 Jun 2020 13:55:10 +0000
Subject: Re: [PATCH 1/2] ubifs: Fix potential memory leaks while iterating entries
Message-Id: <CAFLxGvxGqes3By2Qg6nouo8Eg-c--=fmvyS6pq1xgMC+JKAmpA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2bec05b7-78d3-fa36-134a-efbe977933e3@web.de>
 <45e2cd69-93ec-a0b9-b2a6-d170eee44055@huawei.com>
In-Reply-To: <45e2cd69-93ec-a0b9-b2a6-d170eee44055@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Yi Zhang <yi.zhang@huawei.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, Markus Elfring <Markus.Elfring@web.de>

On Mon, Jun 1, 2020 at 3:46 PM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>
> 在 2020/6/1 20:00, Markus Elfring 写道:
> >> Fix some potential memory leaks in error handling branches while
> >> iterating xattr entries.
> > Such information is useful.
> >
> >
> >> For example, function ubifs_tnc_remove_ino()
> >> forgets to free pxent if it exists. Similar problems also exist in
> >> ubifs_purge_xattrs(), ubifs_add_orphan() and ubifs_jnl_write_inode().
> > Can an other wording variant be a bit nicer?
> Thanks for reminding, I will improve this description.

The description is fine. No need to resend. Patch will be queued after
the merge window.
Thanks for fixing these issues!

-- 
Thanks,
//richard
