From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 08 May 2020 15:42:22 +0000
Subject: Re: [PATCH v4] tools/bootconfig: Completion of error handling
Message-Id: <839d6c0f-4c77-d8f4-3aff-c5762190c57e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bdda096b-9f8a-dacb-9f89-9077d1288ad7@huawei.com>
In-Reply-To: <bdda096b-9f8a-dacb-9f89-9077d1288ad7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yunfeng Ye <yeyunfeng@huawei.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Shiyuan Hu <hushiyuan@huawei.com>, Hewenliang <hewenliang4@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>

…
> +++ b/tools/bootconfig/main.c
> @@ -314,31 +314,35 @@ int apply_xbc(const char *path, const char *xbc_path)
…
> +close_fd:
>  	close(fd);

Do analysis tools point any software development concerns out
at this source code place?
https://wiki.sei.cmu.edu/confluence/display/c/ERR33-C.+Detect+and+handle+standard+library+errors#ERR33-C.Detectandhandlestandardlibraryerrors-AutomatedDetection

Regards,
Markus
