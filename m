From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Tue, 13 Mar 2007 10:31:00 +0000
Subject: Re: [KJ] how to generate a multi-part patch?
Message-Id: <20070313103100.GA25609@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703130343080.10772@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703130343080.10772@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 13, 2007 at 03:46:01AM -0400, Robert P. J. Day wrote:
> 
>   what's the canonical way to generate a multi-part patch?  that is,
> starting from "PATCH [0/n]" and so on.  a list of bullet points will
> do fine, i can take it from there.
>
>   from what i read, i'd use quilt to generate the patch set, then
> "git-send-email"?  is that it?  thanks.

I didn't use quilt or git-send-mail before. When I sent the array_size 
series I prepaired all the mails and put them in a =not-sent-mail mbox. 

After normally sending the first mail [00], I opened the =sent_mail mbox 
and hit reply (to let mutt put the `In-Reply-To header' automatically) 
then it's just the matter of chosing one of the not sent yet mails to 
be sent.

This way is ofcourse weak for very large patch serieses, but it just do 
the job for small sized sets ;).

Regards,

-- 
Ahmed S. Darwish
http://darwish.07.googlepages.com

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
