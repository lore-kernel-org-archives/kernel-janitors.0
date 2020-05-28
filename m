From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 28 May 2020 16:04:04 +0000
Subject: Re: proc/fd: Remove the initialization of variables in seq_show()
Message-Id: <826fc010-5002-c9f0-1af6-36346e922cdb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e218bc34-b8cf-cf0d-aaf1-e1f259d29f7c@web.de>
 <CAAWJmAYox7VNCzj7FnRdiX450wd=DtZAcZv3_2JiPmBuLvUMeQ@mail.gmail.com>
In-Reply-To: <CAAWJmAYox7VNCzj7FnRdiX450wd=DtZAcZv3_2JiPmBuLvUMeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tao pilgrim <pilgrimtao@gmail.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Muchun Song <songmuchun@bytedance.com>

>>> The variables{files, file} will definitely be assigned,
>>
>> I find an other specification nicer for these identifiers.
>>
>>
>>> so we don't need to initialize them.
…
> We don't need to initialize the variable “file”.

I can agree to this interpretation of the software situation
because there is a precondition involved for the variable “ret”.
https://elixir.bootlin.com/linux/v5.7-rc7/source/fs/proc/fd.c#L20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/proc/fd.c?id=b0c3ba31be3e45a130e13b278cf3b90f69bda6f6#n20


> I don't find the programming concerns around the handling of the null
> pointer for the variable “file”.

I find the initial change description too terse and therefore incomplete.


> If you have other suggestions, please elaborate on the details.

I propose to extend the patch.
How do you think about to convert initialisations for the variables
“f_flags” and “ret” also into later assignments?

Regards,
Markus
