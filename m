From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 08 May 2020 11:03:12 +0000
Subject: Re: [PATCH v3] tools/bootconfig: fix resource leak in apply_xbc()
Message-Id: <5e2c3348-f346-e3f2-9c7c-5c4135f9b38c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3569aa33-8963-966d-9247-ec79b3b3d56d@huawei.com>
In-Reply-To: <3569aa33-8963-966d-9247-ec79b3b3d56d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Yunfeng Ye <yeyunfeng@huawei.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Shiyuan Hu <hushiyuan@huawei.com>, Hewenliang <hewenliang4@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>

…
> +++ b/tools/bootconfig/main.c
> @@ -314,31 +314,35 @@ int apply_xbc(const char *path, const char *xbc_path)
…
> +free_data:
>  	free(data);
…

Would any software users prefer to omit the memory release for
a quicker program termination?

Can the commit message become clearer about the explanation for
the importance of the proposed change?

Regards,
Markus
