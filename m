From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 08 May 2020 16:42:05 +0000
Subject: Re: [v3] tools/bootconfig: fix resource leak in apply_xbc()
Message-Id: <dbfae758-c516-dca1-5511-9618510e49e8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3569aa33-8963-966d-9247-ec79b3b3d56d@huawei.com>
 <5e2c3348-f346-e3f2-9c7c-5c4135f9b38c@web.de>
 <559edb00-a03b-747e-8ba7-1f16285deefb@huawei.com>
 <65057e82-8002-4ec4-b714-25ac8d05cb68@web.de>
 <938cd0e9-d96b-766c-cfbc-4f0b73d97cd4@huawei.com>
 <20200508090053.430d28d7@gandalf.local.home> <20200508144527.GR1992@kadam>
 <20200508111449.575d176c@gandalf.local.home>
In-Reply-To: <20200508111449.575d176c@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Dan Carpenter <dan.carpenter@oracle.com>, Yunfeng Ye <yeyunfeng@huawei.com>, Masami Hiramatsu <mhiramat@kernel.org>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Shiyuan Hu <hushiyuan@huawei.com>, Hewenliang <hewenliang4@huawei.com>

>> There was actually a bug in v2.  It exits with a non-zero instead of
>> zero on success so it will mess up people's scripts.
>
> Thanks, I just fixed it. And because of the distraction of Markus's
> bikesheding, it was missed :-(

I am curious how the software development attention will evolve further.
tools/bootconfig: Fix apply_xbc() to return zero on success
https://lore.kernel.org/lkml/20200508111349.3b599bde@gandalf.local.home/
https://lore.kernel.org/patchwork/patch/1239092/
https://lkml.org/lkml/2020/5/8/1342

Will additional change possibilities be taken into account?

Regards,
Markus
