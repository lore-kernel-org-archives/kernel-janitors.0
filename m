From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Mon, 22 Jan 2007 11:28:38 +0000
Subject: Re: [KJ] newbie test patch
Message-Id: <9a8748490701220328y3f8f0e12v626143f0dd5bc3e1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1169463325.2202.11.camel@bluegenie>
In-Reply-To: <1169463325.2202.11.camel@bluegenie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 22/01/07, Surya Prabhakar <surya.prabhakar@wipro.com> wrote:
> Hi GURU's,
>    I did a git diff and pasted the patch here. I am not sure this is the
> right way of doing it.

It is not. Your patch is whitespace damaged. Please try mailing a
patch to yourself, save the email and try applying the patch - if it
doesn't work for you it won't work for other people either.

>Kindly guide me if wrong.
>
Please read these documents :

Documentation/HOWTO
Documentation/SubmittingPatches
Documentation/SubmitChecklist
Documentation/applying-patches.txt
http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt


> Also how do I add the sign off text automatically.

git (if you use it) can do that - I believe quilt can also do that. Or
you can write your own mailing script to send off the patches that
adds the line.....

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
