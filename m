From: walter harms <wharms@bfs.de>
Date: Tue, 29 Mar 2005 07:19:44 +0000
Subject: Re: [KJ] critical bug in strncpy() - solved
Message-Id: <42490190.5090703@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38529558018014454=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38529558018014454==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

mea culpa,
for some odd reason i did not see "the dest will be padded with nulls."
i will send a fix for the documentation to the mainling list.

re,
walter


Matthew Wilcox wrote:
> There is no bug in lib/string.c's implementation of strncpy().
> Most people do not realise that strncpy is a stupid function that is
> almost impossible to use correctly.  Read the manpage:
> 
>        The strncpy() function is similar, except that not more than n bytes of
>        src  are copied. Thus, if there is no null byte among the first n bytes
>        of src, the result will not be null-terminated.
> 
>        In the case where the length of src is less than that of n, the remain-
>        der of dest will be padded with nulls.
> 
> This agrees with POSIX, ANSI C and Single Unix, fwiw.
> 

--===============38529558018014454==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38529558018014454==--
