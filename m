From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 17 Oct 2016 16:25:54 +0000
Subject: Re: [PATCH] ARC-setup: Use seq_putc() in show_cpuinfo()
Message-Id: <579aaf85-c22d-b680-5ce8-3c0e23ab6d7e@synopsys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <164a402a-de20-645d-00af-9a414cf745c4@users.sourceforge.net>
In-Reply-To: <164a402a-de20-645d-00af-9a414cf745c4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-snps-arc@lists.infradead.org

On 10/15/2016 12:56 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 15 Oct 2016 21:31:16 +0200
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".

Perhaps reword the changelog to say that seqc_putc is more efficient than
seqc_printf to output a single char.
I mean _printf is not wrong but not as efficient ?

>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/arc/kernel/setup.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index 3df7f9c..e3f5432 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -494,8 +494,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  
>  	free_page((unsigned long)str);
>  done:
> -	seq_printf(m, "\n");
> -
> +	seq_putc(m, '\n');
>  	return 0;
>  }
>  

