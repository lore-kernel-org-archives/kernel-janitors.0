From: "Horvath, Elmer" <Elmer.Horvath@windriver.com>
Date: Fri, 03 Nov 2006 06:42:49 +0000
Subject: Re: [KJ] [tipc-discussion] [patch]
Message-Id: <F6AE8F99CFBB884E9681D609D859BAD324DA38@ala-mail02.corp.ad.wrs.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <F6AE8F99CFBB884E9681D609D859BAD324D63D@ala-mail02.corp.ad.wrs.com>
In-Reply-To: <F6AE8F99CFBB884E9681D609D859BAD324D63D@ala-mail02.corp.ad.wrs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Alexey,

Thanks for the comments.  One thing you disagreed with was not correct.

strncpy() does always write 'n' bytes.  If the source string is smaller
than 'n', the rest of the space is filled with null characters.  Hence
'n' bytes are always written (do a 'man strncpy').

Later,
Elmer


-----Original Message-----
From: Alexey Dobriyan [mailto:adobriyan@gmail.com] 
Sent: Thursday, November 02, 2006 7:19 PM
To: Horvath, Elmer
Cc: wharms@bfs.de; kernel-janitors@lists.osdl.org
Subject: Re: [KJ] [tipc-discussion] [patch] net/tipc:sprintf/strcpy
conversion

On Thu, Nov 02, 2006 at 07:25:01AM -0800, Horvath, Elmer wrote:
> This objection I would have here is that you have would have to use
> strlcpy or you must explicitly set the last byte to '\0'.

That's correct.

> strncpy() will not guarnatee a null-terminated string.

That's correct.

> Also, str(n|l)cpy always
> writes 'n' bytes whereas strcpy() will only write as many bytes as
> required stopping at the null.

That's incorrect.

> It would be better to ensure that the sting being copied is correctly
> sized when first accepted if this is possible.

I don't understand. Do you mean compile-time check of arguments passed
to strcpy/whatever, do you mean __attribute__((bounded ? How to check
it automatically?

> I didn't trace the usage, but it has likely already been checked for
size.  No?

Suuuuure...


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
