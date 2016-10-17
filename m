From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 17 Oct 2016 17:19:14 +0000
Subject: Re: ARC-setup: Use seq_putc() in show_cpuinfo()
Message-Id: <d8738585-21f3-8691-4c53-bfbafef925be@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <164a402a-de20-645d-00af-9a414cf745c4@users.sourceforge.net>
 <579aaf85-c22d-b680-5ce8-3c0e23ab6d7e@synopsys.com>
In-Reply-To: <579aaf85-c22d-b680-5ce8-3c0e23ab6d7e@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-snps-arc@lists.infradead.org

>> A single character (line break) should be put into a sequence.
>> Thus use the corresponding function "seq_putc".
> 
> Perhaps reword the changelog to say that seqc_putc is more efficient than
> seqc_printf to output a single char.
> I mean _printf is not wrong but not as efficient ?

I came along source files for a few other software modules with similar
change possibilities.
Unfortunately, the corresponding developers are not convinced yet
to replace a call of the function "seq_printf" at the end by
a "seq_putc" because of software efficiency reasons.

Do you find this update suggestion acceptable to some degree
for the function "setup"?

Regards,
Markus
