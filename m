From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 08 May 2020 13:42:40 +0000
Subject: Re: [PATCH v4] tools/bootconfig: fix resource leak in apply_xbc()
Message-Id: <757dc0e5-3ab7-b00b-11dc-e94a903e3901@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bdda096b-9f8a-dacb-9f89-9077d1288ad7@huawei.com>
In-Reply-To: <bdda096b-9f8a-dacb-9f89-9077d1288ad7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yunfeng Ye <yeyunfeng@huawei.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Shiyuan Hu <hushiyuan@huawei.com>, Hewenliang <hewenliang4@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>

> An error is found by a internel analysis tool:
>   "Memory leak: data" and "Resource leak: fd" in tools/bootconfig/main.c

If such an information will ever be integrated into a final commit message,
I would prefer a wording variant like the following.

   Two issues were pointed out by an internal source code analysis tool:
   * Line …:
     Memory leak: data

   * Line …:
     Resource leak: fd


Each of these issues has got a different importance for this function implementation.


> Fix the @data and @fd allocations that are leaked in the error path of
> apply_xbc().

How do you think about to replace the @ characters by other delimiters
for the relevant identifiers?

Regards,
Markus
