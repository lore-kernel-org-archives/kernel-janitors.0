From: "Raseel Bhagat" <raseelbhagat@gmail.com>
Date: Wed, 23 Aug 2006 20:40:41 +0000
Subject: Re: [KJ] [PATCH] all files: init, cleanup to module init/exit
Message-Id: <f68850780608231328x79153c88i9afe2c9f1031bbc3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
In-Reply-To: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi ,

On 8/23/06, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> True, but that isn't the worst sin of this patch. What to do with
>
>         #ifdef MODULE
>
> sprinkled all over touched files and left?
>
I don't understand how is that a problem. ?
There are appropriate #endif s aren't there ?


-- 
Raseel.
http://osd.byethost8.com
http://raseel.livejournal.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
