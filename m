From: Jonathan Corbet <corbet@lwn.net>
Date: Mon, 27 Jul 2020 22:22:44 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust kprobes.rst entry to new location
Message-Id: <20200727162244.2a2395bf@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200726055843.10783-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200726055843.10783-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Naveen, Masami-san, please ack.
> Jonathan, please pick this minor non-urgent patch into docs-next.

Applied, thanks.

jon
