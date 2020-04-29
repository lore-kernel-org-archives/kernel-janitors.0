From: Sayali Lokhande <sayalil@codeaurora.org>
Date: Wed, 29 Apr 2020 04:59:11 +0000
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: Avoid double lock for cp_rwsem during checkpoint
Message-Id: <433d4ad5-22e5-fd2b-cab3-9752ed0c66fb@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <07a820a2-b3b3-32ca-75ce-ceaca106d2c6@web.de>
In-Reply-To: <07a820a2-b3b3-32ca-75ce-ceaca106d2c6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Markus

On 4/27/2020 4:08 PM, Markus Elfring wrote:
>> … This results in deadlock as
>> iput() tries to hold cp_rwsem, which is already held at the
>> beginning by checkpoint->block_operations().
> Will another imperative wording become helpful besides the provided information
> for this change description?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?idj8b55ed4056ea5559ebe4f6a4b247f627870d4c#n151
>
> Would you like to add the tag “Fixes” because of adjustments
> for the data synchronisation?

I couldn't find any past commit which suits to be added under "Fixes" 
here. Let me know if you have any other comment.

>
> Regards,
> Markus
