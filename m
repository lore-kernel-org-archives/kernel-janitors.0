From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 24 May 2020 07:46:50 +0000
Subject: Re: [PATCH] proc/fd: Remove the initialization of variables in seq_show()
Message-Id: <e218bc34-b8cf-cf0d-aaf1-e1f259d29f7c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kaitao Cheng <pilgrimtao@gmail.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Muchun Song <songmuchun@bytedance.com>

> The variables{files, file} will definitely be assigned,

I find an other specification nicer for these identifiers.


> so we don't need to initialize them.

I suggest to recheck programming concerns around the handling
of the null pointer for the variable “file”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/proc/fd.c?id=caffb99b6929f41a69edbb5aef3a359bf45f3315#n20
https://elixir.bootlin.com/linux/v5.7-rc6/source/fs/proc/fd.c#L20

Will another imperative wording be preferred for the change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=caffb99b6929f41a69edbb5aef3a359bf45f3315#n151

Regards,
Markus
