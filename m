From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Mon, 16 Feb 2009 13:09:28 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in kernel/utsname_sysctl.c
Message-Id: <49996588.2040501@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151039n447cc111medb9721a95af81a8@mail.gmail.com>
In-Reply-To: <ea11fea30902151039n447cc111medb9721a95af81a8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: mingo@elte.hu, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Manish Katiyar wrote:
> --- a/kernel/utsname_sysctl.c
> +++ b/kernel/utsname_sysctl.c
> @@ -49,7 +49,7 @@ static int proc_do_uts_string(ctl_table *table, int
> write, struct file *filp,
>  	int r;
>  	memcpy(&uts_table, table, sizeof(uts_table));
>  	uts_table.data = get_uts(table, write);
> -	r = proc_dostring(&uts_table,write,filp,buffer,lenp, ppos);
> +	r = proc_dostring(&uts_table, write, filp, buffer, lenp, ppos);
>  	put_uts(table, write, uts_table.data);
>  	return r;
>  }
> @@ -142,4 +142,4 @@ static int __init utsname_sysctl_init(void)
>  	return 0;
>  }
> 
> -__initcall(utsname_sysctl_init);
> +device_initcall(utsname_sysctl_init);

The changelog should note that this is a whitespace fix + initcall
annotation change.

That checkpatch was somehow involved in the creation of this patch is
entirely uninteresting for the changelog.
-- 
Stefan Richter
-===-=--= --=- =----
http://arcgraph.de/sr/
