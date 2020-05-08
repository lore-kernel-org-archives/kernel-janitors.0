From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 08 May 2020 10:17:44 +0000
Subject: Re: [v2] tools/bootconfig: fix resource leak in apply_xbc()
Message-Id: <131a5310-5d8e-5eb5-e55f-fa0a9a829ec1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <189d719f-a8b8-6e10-ae2f-8120c3d2b7a9@huawei.com>
 <20200508093059.GF9365@kadam>
In-Reply-To: <20200508093059.GF9365@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yunfeng Ye <yeyunfeng@huawei.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Shiyuan Hu <hushiyuan@huawei.com>, Hewenliang <hewenliang4@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>

> Btw, these leaks are totally harmless.  This is a short running user
> space program with is going to immediately exit on error so the memory
> will be freed anyway.

Can such a view mean that the function call “free(data)” should be omitted here
for a quicker program termination?


> But the benifit is to silence static checker warnings so that's useful.

Would you like to extend the commit message for the explanation of
the importance of the proposed change accordingly?

Regards,
Markus
