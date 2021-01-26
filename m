From: Petr Mladek <pmladek@suse.com>
Date: Tue, 26 Jan 2021 10:27:50 +0000
Subject: Re: [PATCH] printk: rectify kernel-doc for prb_rec_init_wr()
Message-Id: <YA/upguVH/Jj0GJz@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210125081748.19903-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210125081748.19903-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon 2021-01-25 09:17:48, Lukas Bulwahn wrote:
> The command 'find ./kernel/printk/ | xargs ./scripts/kernel-doc -none'
> reported a mismatch with the kernel-doc of prb_rec_init_wr().
> 
> Rectify the kernel-doc, such that no issues remain for ./kernel/printk/.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

The patch has been committed into printk/linux.git, branch
printk-rework.

Best Regards,
Petr
