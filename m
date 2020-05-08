From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 08 May 2020 08:23:36 +0000
Subject: Re: [PATCH v2] tools/bootconfig: Completion of error handling
Message-Id: <0b2612c1-28ca-2bb0-14f1-4befea09cede@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <189d719f-a8b8-6e10-ae2f-8120c3d2b7a9@huawei.com>
In-Reply-To: <189d719f-a8b8-6e10-ae2f-8120c3d2b7a9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yunfeng Ye <yeyunfeng@huawei.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Shiyuan Hu <hushiyuan@huawei.com>, Hewenliang <hewenliang4@huawei.com>

…
> +++ b/tools/bootconfig/main.c
> @@ -314,31 +314,33 @@ int apply_xbc(const char *path, const char *xbc_path)
…
> +close_fd:
>  	close(fd);
> +free_data:
>  	free(data);
…

Do you find unchecked return values from calls of functions like close()
and printf() suspicious?
https://cwe.mitre.org/data/definitions/252.html

Regards,
Markus
