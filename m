From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Mon, 16 Feb 2009 15:34:32 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in 	kernel/utsname_sysctl.c
Message-Id: <49998788.80606@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151039n447cc111medb9721a95af81a8@mail.gmail.com>	 <49996588.2040501@s5r6.in-berlin.de> <ea11fea30902160659q58578152gea3f4da3821c8e0c@mail.gmail.com>
In-Reply-To: <ea11fea30902160659q58578152gea3f4da3821c8e0c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: mingo@elte.hu, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Manish Katiyar wrote:
> On Mon, Feb 16, 2009 at 6:39 PM, Stefan Richter
> <stefanr@s5r6.in-berlin.de> wrote:
>> The changelog should note that this is a whitespace fix + initcall
>> annotation change.

Sorry, I didn't get the point of __initcall/device_initcall.  It's not
an annotation; it defines a call sequence level.

> Replace deprecated __initcall with equivalent device_initcall. Also
> fix whitespaces.
...
> --- a/kernel/utsname_sysctl.c
> +++ b/kernel/utsname_sysctl.c
...
> @@ -142,4 +142,4 @@ static int __init utsname_sysctl_init(void)
>  	return 0;
>  }
> 
> -__initcall(utsname_sysctl_init);
> +device_initcall(utsname_sysctl_init);

It is equivalent, but is it also the most appropriate one?
-- 
Stefan Richter
-===-=-== -=-= -=-http://arcgraph.de/sr/
