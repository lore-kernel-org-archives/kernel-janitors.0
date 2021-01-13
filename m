From: Jonathan Corbet <corbet@lwn.net>
Date: Wed, 13 Jan 2021 23:21:26 +0000
Subject: Re: [PATCH for doc-next] doc/zh_CN: adjust table markup in mips/ingenic-tcu.rst
Message-Id: <20210113162126.62e36bd3@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210113070023.25064-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210113070023.25064-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Yanteng Si <siyanteng@loongson.cn>, Harry Wei <harryxiyou@gmail.com>, Alex Shi <alex.shi@linux.alibaba.com>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 13 Jan 2021 08:00:23 +0100
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 419b1d4ed1cb ("doc/zh_CN: add mips ingenic-tcu.rst translation")
> introduces a warning with make htmldocs:
> 
>   ./Documentation/translations/zh_CN/mips/ingenic-tcu.rst:
>     61: WARNING: Malformed table. Text in column margin in table line 6.
> 
> Adjust the table markup to address this warning.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210113
> 
> Yanteng, please ack.
> 
> Jonathan, please pick this doc warning fixup on your -next tree. 

Not waiting for the ack, I've applied this (with an added Fixes tag),
thanks.

jon
