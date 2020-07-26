From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Date: Sun, 26 Jul 2020 17:55:39 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust kprobes.rst entry to new location
Message-Id: <1595786005.wgos31p5yh.naveen@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200726055843.10783-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200726055843.10783-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Lukas Bulwahn wrote:
> Commit 2165b82fde82 ("docs: Move kprobes.rst from staging/ to trace/")
> moved kprobes.rst, but missed to adjust the MAINTAINERS entry.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    Documentation/staging/kprobes.rst
> 
> Adjust the entry to the new file location.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Naveen, Masami-san, please ack.
> Jonathan, please pick this minor non-urgent patch into docs-next.
> 
> applies cleanly on next-20200724

Ah, sorry. Hadn't noticed this change from Mauro.
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Thanks!
- Naveen
