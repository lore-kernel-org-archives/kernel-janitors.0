From: Yunfeng Ye <yeyunfeng@huawei.com>
Date: Fri, 08 May 2020 11:42:56 +0000
Subject: Re: [v3] tools/bootconfig: fix resource leak in apply_xbc()
Message-Id: <938cd0e9-d96b-766c-cfbc-4f0b73d97cd4@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3569aa33-8963-966d-9247-ec79b3b3d56d@huawei.com>
 <5e2c3348-f346-e3f2-9c7c-5c4135f9b38c@web.de>
 <559edb00-a03b-747e-8ba7-1f16285deefb@huawei.com>
 <65057e82-8002-4ec4-b714-25ac8d05cb68@web.de>
In-Reply-To: <65057e82-8002-4ec4-b714-25ac8d05cb68@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Shiyuan Hu <hushiyuan@huawei.com>, Hewenliang <hewenliang4@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>



On 2020/5/8 19:30, Markus Elfring wrote:
>> this change can fix the warning of tools.
> 
> Would you like to point any specific source code analysis tools out
> for this issue?
> (Can a corresponding attribution become relevant for a clearer
> change description?)
> 
The tools we used is not for open source. it point out some error description like
"Memory leak: data" and "Resource leak: fd" in tools/bootconfig/main.c.

Can I only description:
  "Memory and resource leak is found by a static code analysis tools" ? thanks.


> Regards,
> Markus
> 
> 
