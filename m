From: Joe Perches <joe@perches.com>
Date: Tue, 07 Feb 2017 22:52:58 +0000
Subject: Re: [PATCH 13/18] HID-debug: Combine 11 seq_printf() calls into one call in hid_dump_field()
Message-Id: <1486507978.27834.3.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <edd25fcd-8625-2469-fa28-2315f81b6b8e@users.sourceforge.net>
         <99abe158-ba41-99eb-95e1-e9aed7bafb53@users.sourceforge.net>
In-Reply-To: <99abe158-ba41-99eb-95e1-e9aed7bafb53@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Bruno =?ISO-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 2017-02-07 at 20:56 +0100, SF Markus Elfring wrote:
> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
[]
> @@ -614,19 +614,18 @@ void hid_dump_field(struct hid_field *field, int n, struct seq_file *f) {
>  	tab(n, f); seq_printf(f, "Report Size(%u)\n", field->report_size);
>  	tab(n, f); seq_printf(f, "Report Count(%u)\n", field->report_count);
>  	tab(n, f); seq_printf(f, "Report Offset(%u)\n", field->report_offset);
> -
> -	tab(n, f); seq_printf(f, "Flags( ");
> +	tab(n, f);

Consider converting tab(n, f) to seq_indent(f, n)
making seq_indent a global function or maybe using
a new name like seq_spaces, and converting the
existing uses in net/ipv4/fib_trie.c appropriately.

