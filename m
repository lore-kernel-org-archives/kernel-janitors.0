From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Fri, 12 Jan 2007 10:16:05 +0000
Subject: Re: [KJ] Plunge
Message-Id: <9a8748490701120216s699f305avfb1d31ee6458b7e1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4f8a82c571b69fade74ef67bbb654219@acm.org>
In-Reply-To: <4f8a82c571b69fade74ef67bbb654219@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/01/07, Matthew Whitehead <whiteheadm@acm.org> wrote:
> Okay, I'm ready to take the plunge and request a beginner's
> kernel-janitors assignment.  Anyone got something I can do for the
> community?
>

Take a look at the TODO ( http://kernelnewbies.org/KernelJanitors/Todo ).
Pick some task that you think you can handle.
Create a patch and send it in for review.

One resonably simple task is to build a bunch of randconfig kernels
and then try to fix errors and warnings they generate.

You probably also want to read these documents :

(in the kernel source dir)
  Documentation/HOWTO
  Documentation/CodingStyle
  Documentation/SubmitChecklist
  Documentation/SubmittingPatches

as well as the various documents those refer you to.

This is also worth a read :
http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
