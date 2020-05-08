From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 08 May 2020 15:14:49 +0000
Subject: Re: [v3] tools/bootconfig: fix resource leak in apply_xbc()
Message-Id: <20200508111449.575d176c@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3569aa33-8963-966d-9247-ec79b3b3d56d@huawei.com>
        <5e2c3348-f346-e3f2-9c7c-5c4135f9b38c@web.de>
        <559edb00-a03b-747e-8ba7-1f16285deefb@huawei.com>
        <65057e82-8002-4ec4-b714-25ac8d05cb68@web.de>
        <938cd0e9-d96b-766c-cfbc-4f0b73d97cd4@huawei.com>
        <20200508090053.430d28d7@gandalf.local.home>
        <20200508144527.GR1992@kadam>
In-Reply-To: <20200508144527.GR1992@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yunfeng Ye <yeyunfeng@huawei.com>, Markus Elfring <Markus.Elfring@web.de>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Shiyuan Hu <hushiyuan@huawei.com>, Hewenliang <hewenliang4@huawei.com>

On Fri, 8 May 2020 17:45:27 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> > Yunfeng, your v2 was fine and has already landed in Linus's tree. Feel free
> > to ignore Markus's suggestions in the future.  
> 
> There was actually a bug in v2.  It exits with a non-zero instead of
> zero on success so it will mess up people's scripts.

Thanks, I just fixed it. And because of the distraction of Markus's
bikesheding, it was missed :-(

-- Steve
