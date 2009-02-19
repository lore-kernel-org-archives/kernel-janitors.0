From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Thu, 19 Feb 2009 21:16:56 +0000
Subject: Re: [PATCH] Replace deprecated __initcall with device_initcall and
Message-Id: <499DCC48.1080603@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
In-Reply-To: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Manish Katiyar wrote:
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
[...]
> -/* get symbol type information. This is encoded as a single char at the
> - * begining of the symbol name */
> +/*
> + * get symbol type information. This is encoded as a single char at the
> + * begining of the symbol name
> + */

Typo: beginning

Besides, several sentences in comments of this file start lower-case but
end with a full stop, while other sentences start upper-case but don't
end with a full stop.  The author(s) of the comments obviously didn't
care for consistency and good readability.  If you like you could fix
this as well.  :-)
-- 
Stefan Richter
-===-=--= --=- =--=
http://arcgraph.de/sr/
