From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Tue, 28 Jul 2020 05:12:38 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust kprobes.rst entry to new location
Message-Id: <20200728141238.5fa8056e378fd08b5c1fa3f6@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200726055843.10783-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200726055843.10783-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 26 Jul 2020 07:58:43 +0200
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 2165b82fde82 ("docs: Move kprobes.rst from staging/ to trace/")
> moved kprobes.rst, but missed to adjust the MAINTAINERS entry.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    Documentation/staging/kprobes.rst
> 
> Adjust the entry to the new file location.
> 

Good catch!

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thanks!

> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Naveen, Masami-san, please ack.
> Jonathan, please pick this minor non-urgent patch into docs-next.
> 
> applies cleanly on next-20200724
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 960f7d43f9d7..416fc4555834 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9676,7 +9676,7 @@ M:	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
>  M:	"David S. Miller" <davem@davemloft.net>
>  M:	Masami Hiramatsu <mhiramat@kernel.org>
>  S:	Maintained
> -F:	Documentation/staging/kprobes.rst
> +F:	Documentation/trace/kprobes.rst
>  F:	include/asm-generic/kprobes.h
>  F:	include/linux/kprobes.h
>  F:	kernel/kprobes.c
> -- 
> 2.17.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
