From: Tao pilgrim <pilgrimtao@gmail.com>
Date: Thu, 28 May 2020 12:51:41 +0000
Subject: Re: [PATCH] proc/fd: Remove the initialization of variables in seq_show()
Message-Id: <CAAWJmAYox7VNCzj7FnRdiX450wd=DtZAcZv3_2JiPmBuLvUMeQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e218bc34-b8cf-cf0d-aaf1-e1f259d29f7c@web.de>
In-Reply-To: <e218bc34-b8cf-cf0d-aaf1-e1f259d29f7c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Muchun Song <songmuchun@bytedance.com>

> > The variables{files, file} will definitely be assigned,
>
> I find an other specification nicer for these identifiers.
>
>
> > so we don't need to initialize them.
>
> I suggest to recheck programming concerns around the handling
> of the null pointer for the variable “file”.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/proc/fd.c?id=caffb99b6929f41a69edbb5aef3a359bf45f3315#n20
> https://elixir.bootlin.com/linux/v5.7-rc6/source/fs/proc/fd.c#L20

We don't need to initialize the variable “file”.
On line 34, if (files) is true,
{file = fcheck_files(files, fd)} will be executed on line 38.
On line 34, if (files) is flse,
{return ret;} will be executed on line 54, and seq_show() will exit directly.
I don't find the programming concerns around the handling of the null
pointer for the variable “file”.

If you have other suggestions, please elaborate on the details.

--
Yours,
Kaitao Cheng
